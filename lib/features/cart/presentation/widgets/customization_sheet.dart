import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/utils/formatters.dart';
import '../../../menu/domain/customization_group.dart';
import '../../../menu/domain/menu_item.dart';
import '../../application/cart_controller.dart';
import '../../domain/pricing.dart';
import '../../domain/selected_option.dart';
import '../cart_error_messages.dart';

/// Bottom sheet to pick customizations and add an item to the cart.
Future<void> showAddToCartSheet(BuildContext context, MenuItem item) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    showDragHandle: true,
    builder: (context) => AddToCartSheet(item: item),
  );
}

class AddToCartSheet extends ConsumerStatefulWidget {
  const AddToCartSheet({super.key, required this.item});

  final MenuItem item;

  @override
  ConsumerState<AddToCartSheet> createState() => _AddToCartSheetState();
}

class _AddToCartSheetState extends ConsumerState<AddToCartSheet> {
  int _quantity = 1;

  /// groupId → selected option ids (each counts as quantity 1).
  final Map<int, Set<int>> _selectedByGroup = {};

  List<SelectedOption> get _selections {
    final result = <SelectedOption>[];
    for (final group in widget.item.customizationGroups) {
      final optionIds = _selectedByGroup[group.id] ?? {};
      for (final optionId in optionIds) {
        final option = group.options.firstWhere((o) => o.id == optionId);
        result.add(
          SelectedOption(
            groupId: group.id,
            option: option,
            quantity: 1,
          ),
        );
      }
    }
    return result;
  }

  double get _unitPrice => lineUnitPrice(widget.item, _selections);

  void _selectSingle(CustomizationGroup group, int optionId) {
    setState(() => _selectedByGroup[group.id] = {optionId});
  }

  void _toggleMulti(CustomizationGroup group, int optionId) {
    setState(() {
      final selected = _selectedByGroup.putIfAbsent(group.id, () => {});
      if (selected.contains(optionId)) {
        selected.remove(optionId);
        return;
      }
      if (selected.length >= group.maxSelections) return;
      selected.add(optionId);
    });
  }

  void _addToCart() {
    final errors = ref
        .read(cartProvider.notifier)
        .addItem(widget.item, _selections, quantity: _quantity);

    if (errors.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(formatCustomizationErrors(errors))),
      );
      return;
    }

    Navigator.of(context).pop();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('${widget.item.name} added to cart')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.viewInsetsOf(context).bottom;
    final item = widget.item;

    return Padding(
      padding: EdgeInsets.fromLTRB(24, 0, 24, 24 + bottomInset),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(item.name, style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 8),
            Text(item.description),
            const SizedBox(height: 16),
            for (final group in item.customizationGroups)
              _GroupPicker(
                group: group,
                selectedIds: _selectedByGroup[group.id] ?? {},
                onSelectSingle: (id) => _selectSingle(group, id),
                onToggleMulti: (id) => _toggleMulti(group, id),
              ),
            const SizedBox(height: 8),
            Row(
              children: [
                Text('Quantity', style: Theme.of(context).textTheme.titleSmall),
                const Spacer(),
                IconButton(
                  onPressed: _quantity > 1
                      ? () => setState(() => _quantity--)
                      : null,
                  icon: const Icon(Icons.remove_circle_outline),
                ),
                Text('$_quantity', style: Theme.of(context).textTheme.titleMedium),
                IconButton(
                  onPressed: () => setState(() => _quantity++),
                  icon: const Icon(Icons.add_circle_outline),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'Unit price: ${formatCurrency(_unitPrice)}',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
            Text(
              'Line total: ${formatCurrency(_unitPrice * _quantity)}',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: _addToCart,
              child: const Text('Add to cart'),
            ),
          ],
        ),
      ),
    );
  }
}

class _GroupPicker extends StatelessWidget {
  const _GroupPicker({
    required this.group,
    required this.selectedIds,
    required this.onSelectSingle,
    required this.onToggleMulti,
  });

  final CustomizationGroup group;
  final Set<int> selectedIds;
  final ValueChanged<int> onSelectSingle;
  final ValueChanged<int> onToggleMulti;

  @override
  Widget build(BuildContext context) {
    final requiredLabel = group.required ? 'Required' : 'Optional';
    final atMax = selectedIds.length >= group.maxSelections;

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${group.name} · $requiredLabel · '
            'choose up to ${group.maxSelections}',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(height: 4),
          ...group.options.map((option) {
            final selected = selectedIds.contains(option.id);
            final priceSuffix = option.priceModifier == 0
                ? ''
                : ' (+${formatCurrency(option.priceModifier)})';

            if (group.maxSelections == 1) {
              final isSelected = selectedIds.contains(option.id);
              return ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Icon(
                  isSelected
                      ? Icons.radio_button_checked
                      : Icons.radio_button_off,
                  color: isSelected
                      ? Theme.of(context).colorScheme.primary
                      : null,
                ),
                title: Text('${option.name}$priceSuffix'),
                onTap: () => onSelectSingle(option.id),
              );
            }

            return CheckboxListTile(
              value: selected,
              onChanged: (!selected && atMax)
                  ? null
                  : (_) => onToggleMulti(option.id),
              title: Text('${option.name}$priceSuffix'),
              contentPadding: EdgeInsets.zero,
              controlAffinity: ListTileControlAffinity.leading,
            );
          }),
        ],
      ),
    );
  }
}
