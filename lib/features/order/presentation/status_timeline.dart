import 'package:flutter/material.dart';

import '../domain/order_status.dart';

/// Vertical timeline of order status steps.
class StatusTimeline extends StatelessWidget {
  const StatusTimeline({super.key, required this.current});

  final OrderStatus current;

  static const _steps = [
    OrderStatus.pending,
    OrderStatus.confirmed,
    OrderStatus.preparing,
    OrderStatus.ready,
    OrderStatus.served,
  ];

  @override
  Widget build(BuildContext context) {
    final currentIndex = _steps.indexOf(current);

    return Column(
      children: [
        for (var i = 0; i < _steps.length; i++)
          _StepRow(
            label: _steps[i].label,
            isComplete: i < currentIndex,
            isCurrent: i == currentIndex,
            isLast: i == _steps.length - 1,
          ),
      ],
    );
  }
}

class _StepRow extends StatelessWidget {
  const _StepRow({
    required this.label,
    required this.isComplete,
    required this.isCurrent,
    required this.isLast,
  });

  final String label;
  final bool isComplete;
  final bool isCurrent;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final color = isComplete || isCurrent ? scheme.primary : scheme.outline;

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            width: 32,
            child: Column(
              children: [
                Icon(
                  isComplete
                      ? Icons.check_circle
                      : isCurrent
                          ? Icons.radio_button_checked
                          : Icons.radio_button_off,
                  color: color,
                  size: 22,
                ),
                if (!isLast)
                  Expanded(
                    child: Container(
                      width: 2,
                      color: isComplete ? scheme.primary : scheme.outlineVariant,
                    ),
                  ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: isLast ? 0 : 20),
              child: Text(
                label,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: isCurrent || isComplete
                          ? scheme.onSurface
                          : scheme.outline,
                      fontWeight: isCurrent ? FontWeight.bold : null,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
