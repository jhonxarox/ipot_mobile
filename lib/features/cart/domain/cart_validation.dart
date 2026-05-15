import '../../menu/domain/customization_group.dart';
import '../../menu/domain/menu_item.dart';
import 'selected_option.dart';

/// Validation failure for customization selections on a menu item.
sealed class CustomizationError {
  const CustomizationError();
}

/// A required customization group has no selected options.
final class RequiredGroupMissing extends CustomizationError {
  const RequiredGroupMissing(this.group);

  final CustomizationGroup group;
}

/// Too many options (by total quantity) selected in a group.
final class MaxSelectionsExceeded extends CustomizationError {
  const MaxSelectionsExceeded({
    required this.group,
    required this.selectedCount,
  });

  final CustomizationGroup group;
  final int selectedCount;
}

/// Selected option does not belong to any group on the item.
final class UnknownOption extends CustomizationError {
  const UnknownOption(this.optionId);

  final int optionId;
}

/// Validates [selections] against [item] customization rules.
///
/// Returns an empty list when valid. Callers should block add-to-cart when
/// non-empty.
List<CustomizationError> validateSelections(
  MenuItem item,
  List<SelectedOption> selections,
) {
  final errors = <CustomizationError>[];

  final optionToGroup = <int, CustomizationGroup>{};
  for (final group in item.customizationGroups) {
    for (final option in group.options) {
      optionToGroup[option.id] = group;
    }
  }

  final quantityByGroup = <int, int>{};

  for (final selection in selections) {
    final group = optionToGroup[selection.option.id];
    if (group == null) {
      errors.add(UnknownOption(selection.option.id));
      continue;
    }
    if (selection.groupId != group.id) {
      errors.add(UnknownOption(selection.option.id));
      continue;
    }
    if (selection.quantity < 1) continue;

    quantityByGroup[group.id] =
        (quantityByGroup[group.id] ?? 0) + selection.quantity;
  }

  for (final group in item.customizationGroups) {
    final count = quantityByGroup[group.id] ?? 0;
    if (group.required && count == 0) {
      errors.add(RequiredGroupMissing(group));
    }
    if (count > group.maxSelections) {
      errors.add(
        MaxSelectionsExceeded(group: group, selectedCount: count),
      );
    }
  }

  return errors;
}
