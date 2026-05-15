import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/utils/formatters.dart';
import '../application/cart_controller.dart';
import '../domain/cart_line.dart';
import '../domain/pricing.dart';

/// One cart line with quantity controls and remove action.
class CartLineTile extends ConsumerWidget {
  const CartLineTile({super.key, required this.line});

  final CartLine line;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(cartProvider.notifier);
    final customizationText = line.selections
        .map(
          (selection) =>
              '${selection.option.name}'
              '${selection.option.priceModifier == 0 ? '' : ' (+${formatCurrency(selection.option.priceModifier)})'}',
        )
        .join(' · ');

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        line.item.name,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      if (customizationText.isNotEmpty) ...[
                        const SizedBox(height: 4),
                        Text(
                          customizationText,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ],
                  ),
                ),
                Text(
                  formatCurrency(lineTotal(line)),
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                IconButton(
                  onPressed: () =>
                      controller.updateLineQuantity(line.id, line.quantity - 1),
                  icon: const Icon(Icons.remove_circle_outline),
                ),
                Text('${line.quantity}'),
                IconButton(
                  onPressed: () =>
                      controller.updateLineQuantity(line.id, line.quantity + 1),
                  icon: const Icon(Icons.add_circle_outline),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () => controller.removeLine(line.id),
                  child: const Text('Remove'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
