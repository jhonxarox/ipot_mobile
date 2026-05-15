import 'package:flutter/material.dart';
import 'package:ipot_mobile/features/scan/data/scan_url_parser.dart';

/// Bottom sheet for entering a table ID when the camera is unavailable or
/// the user prefers typing.
Future<String?> showManualEntrySheet(BuildContext context) {
  return showModalBottomSheet<String>(
    context: context,
    isScrollControlled: true,
    showDragHandle: true,
    builder: (context) => const _ManualEntrySheet(),
  );
}

class _ManualEntrySheet extends StatefulWidget {
  const _ManualEntrySheet();

  @override
  State<_ManualEntrySheet> createState() => _ManualEntrySheetState();
}

class _ManualEntrySheetState extends State<_ManualEntrySheet> {
  final _controller = TextEditingController();
  String? _errorText;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _submit() {
    final tableId = parseTableId(_controller.text);
    if (tableId == null) {
      setState(() {
        _errorText = 'Enter a valid table ID (e.g. T001 or ipot://table/T001)';
      });
      return;
    }
    Navigator.of(context).pop(tableId);
  }

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.viewInsetsOf(context).bottom;

    return Padding(
      padding: EdgeInsets.fromLTRB(24, 0, 24, 24 + bottomInset),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Enter table ID', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 8),
          Text(
            'Type the code from your table sticker, or paste the full QR link.',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _controller,
            autofocus: true,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
              labelText: 'Table ID',
              hintText: 'T001',
              errorText: _errorText,
              border: const OutlineInputBorder(),
            ),
            onSubmitted: (_) => _submit(),
          ),
          const SizedBox(height: 16),
          FilledButton(
            onPressed: _submit,
            child: const Text('Continue to menu'),
          ),
        ],
      ),
    );
  }
}
