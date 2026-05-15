import 'package:flutter/material.dart';

import '../../../core/utils/formatters.dart';
import '../domain/customization_group.dart';
import '../domain/menu_item.dart';

/// Item detail bottom sheet. Customization picker ships in B4; this shell
/// surfaces groups/options so reviewers can verify the data model early.
Future<void> showItemDetailSheet(BuildContext context, MenuItem item) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    showDragHandle: true,
    builder: (context) => ItemDetailSheet(item: item),
  );
}

class ItemDetailSheet extends StatelessWidget {
  const ItemDetailSheet({super.key, required this.item});

  final MenuItem item;

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.viewInsetsOf(context).bottom;

    return Padding(
      padding: EdgeInsets.fromLTRB(24, 0, 24, 24 + bottomInset),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(item.name, style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 8),
            Text(
              formatCurrency(item.price),
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
            const SizedBox(height: 12),
            Text(item.description),
            if (item.customizationGroups.isNotEmpty) ...[
              const SizedBox(height: 24),
              Text(
                'Customizations',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              ...item.customizationGroups.map(_CustomizationGroupSection.new),
            ],
            const SizedBox(height: 24),
            FilledButton(
              onPressed: () {
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Add to cart ships in the cart milestone'),
                  ),
                );
              },
              child: const Text('Add to cart'),
            ),
          ],
        ),
      ),
    );
  }
}

class _CustomizationGroupSection extends StatelessWidget {
  const _CustomizationGroupSection(this.group);

  final CustomizationGroup group;

  @override
  Widget build(BuildContext context) {
    final requiredLabel = group.required ? 'Required' : 'Optional';

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${group.name} · $requiredLabel · up to ${group.maxSelections}',
            style: Theme.of(context).textTheme.labelLarge,
          ),
          const SizedBox(height: 4),
          ...group.options.map(
            (option) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: Text(
                '• ${option.name}'
                '${option.priceModifier == 0 ? '' : ' (+${formatCurrency(option.priceModifier)})'}',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
