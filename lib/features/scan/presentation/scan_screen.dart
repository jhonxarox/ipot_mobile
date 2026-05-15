import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ipot_mobile/features/scan/data/scan_url_parser.dart';
import 'package:ipot_mobile/features/scan/presentation/scan_controller.dart';
import 'package:ipot_mobile/features/scan/presentation/widgets/manual_entry_sheet.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:permission_handler/permission_handler.dart';

/// QR scanner entry point. Parses `ipot://table/{tableId}` payloads and
/// navigates to the menu route on success.
class ScanScreen extends ConsumerStatefulWidget {
  const ScanScreen({super.key});

  @override
  ConsumerState<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends ConsumerState<ScanScreen> {
  final _scannerController = MobileScannerController(
    detectionSpeed: DetectionSpeed.noDuplicates,
  );

  bool _isHandlingScan = false;

  @override
  void dispose() {
    _scannerController.dispose();
    super.dispose();
  }

  void _showInvalidQrMessage() {
    if (!mounted) return;
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Invalid QR code')));
  }

  Future<void> _onTableIdResolved(String tableId) async {
    if (_isHandlingScan || !mounted) return;
    _isHandlingScan = true;
    await _scannerController.stop();
    if (!mounted) return;
    context.go('/menu/$tableId');
  }

  void _onBarcodeDetected(BarcodeCapture capture) {
    if (_isHandlingScan) return;

    final raw = capture.barcodes
        .map((barcode) => barcode.rawValue)
        .whereType<String>()
        .firstOrNull;
    if (raw == null) return;

    final tableId = parseTableId(raw);
    if (tableId == null) {
      _showInvalidQrMessage();
      return;
    }

    _onTableIdResolved(tableId);
  }

  Future<void> _openManualEntry() async {
    final tableId = await showManualEntrySheet(context);
    if (tableId != null) {
      await _onTableIdResolved(tableId);
    }
  }

  @override
  Widget build(BuildContext context) {
    final scanState = ref.watch(scanControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan table QR'),
        actions: [
          TextButton(
            onPressed: _openManualEntry,
            child: const Text('Enter ID'),
          ),
        ],
      ),
      body: switch (scanState.permission) {
        ScanPermissionStatus.unknown => const Center(
          child: CircularProgressIndicator(),
        ),
        ScanPermissionStatus.granted => _ScannerBody(
          controller: _scannerController,
          onDetect: _onBarcodeDetected,
          onManualEntry: _openManualEntry,
        ),
        ScanPermissionStatus.denied => _PermissionBody(
          permanentlyDenied: false,
          onRequestPermission: () =>
              ref.read(scanControllerProvider.notifier).requestPermission(),
          onManualEntry: _openManualEntry,
        ),
        ScanPermissionStatus.permanentlyDenied => _PermissionBody(
          permanentlyDenied: true,
          onRequestPermission: openAppSettings,
          onManualEntry: _openManualEntry,
        ),
      },
    );
  }
}

class _ScannerBody extends StatelessWidget {
  const _ScannerBody({
    required this.controller,
    required this.onDetect,
    required this.onManualEntry,
  });

  final MobileScannerController controller;
  final void Function(BarcodeCapture) onDetect;
  final VoidCallback onManualEntry;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        MobileScanner(controller: controller, onDetect: onDetect),
        const _ScanOverlay(),
        Positioned(
          left: 24,
          right: 24,
          bottom: 32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Point your camera at the table QR code',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.white,
                  shadows: const [Shadow(blurRadius: 8, color: Colors.black54)],
                ),
              ),
              const SizedBox(height: 12),
              OutlinedButton(
                onPressed: onManualEntry,
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                  side: const BorderSide(color: Colors.white70),
                ),
                child: const Text('Enter table ID manually'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ScanOverlay extends StatelessWidget {
  const _ScanOverlay();

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Center(
        child: Container(
          width: 260,
          height: 260,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white70, width: 2),
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }
}

class _PermissionBody extends StatelessWidget {
  const _PermissionBody({
    required this.permanentlyDenied,
    required this.onRequestPermission,
    required this.onManualEntry,
  });

  final bool permanentlyDenied;
  final Future<void> Function() onRequestPermission;
  final VoidCallback onManualEntry;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.no_photography_outlined,
            size: 64,
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(height: 16),
          Text(
            permanentlyDenied
                ? 'Camera access is turned off'
                : 'Camera access is required to scan',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
          Text(
            permanentlyDenied
                ? 'Open Settings to allow camera access, or enter your table ID manually.'
                : 'Allow camera access to scan the QR code on your table.',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 24),
          FilledButton(
            onPressed: onRequestPermission,
            child: Text(permanentlyDenied ? 'Open Settings' : 'Allow camera'),
          ),
          const SizedBox(height: 12),
          OutlinedButton(
            onPressed: onManualEntry,
            child: const Text('Enter table ID manually'),
          ),
        ],
      ),
    );
  }
}
