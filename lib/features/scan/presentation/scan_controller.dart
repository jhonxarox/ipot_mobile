import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';

/// Camera permission state for the scan feature.
enum ScanPermissionStatus {
  /// Not yet checked or permission request in flight.
  unknown,

  /// User granted camera access.
  granted,

  /// User denied; may still request again.
  denied,

  /// User denied permanently; must open system settings.
  permanentlyDenied,
}

/// Immutable scan permission snapshot consumed by [ScanScreen].
class ScanState {
  const ScanState({required this.permission});

  final ScanPermissionStatus permission;

  bool get canUseCamera => permission == ScanPermissionStatus.granted;
}

/// Handles camera permission checks and requests for QR scanning.
class ScanController extends Notifier<ScanState> {
  @override
  ScanState build() {
    Future.microtask(refreshPermission);
    return const ScanState(permission: ScanPermissionStatus.unknown);
  }

  Future<void> refreshPermission() async {
    final status = await Permission.camera.status;
    state = ScanState(permission: _mapStatus(status));
  }

  Future<void> requestPermission() async {
    final status = await Permission.camera.request();
    state = ScanState(permission: _mapStatus(status));
  }

  ScanPermissionStatus _mapStatus(PermissionStatus status) => switch (status) {
        PermissionStatus.granted ||
        PermissionStatus.limited ||
        PermissionStatus.provisional =>
          ScanPermissionStatus.granted,
        PermissionStatus.permanentlyDenied =>
          ScanPermissionStatus.permanentlyDenied,
        PermissionStatus.denied ||
        PermissionStatus.restricted =>
          ScanPermissionStatus.denied,
      };
}

final scanControllerProvider =
    NotifierProvider<ScanController, ScanState>(ScanController.new);
