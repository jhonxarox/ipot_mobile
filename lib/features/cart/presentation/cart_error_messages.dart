import '../domain/cart_validation.dart';

/// User-facing text for customization validation failures.
String formatCustomizationErrors(List<CustomizationError> errors) {
  if (errors.isEmpty) return '';

  return errors.map(_formatOne).join('\n');
}

String _formatOne(CustomizationError error) => switch (error) {
      RequiredGroupMissing(:final group) =>
        'Please choose an option for ${group.name}',
      MaxSelectionsExceeded(:final group, :final selectedCount) =>
        '${group.name}: choose up to ${group.maxSelections} '
        '(you selected $selectedCount)',
      UnknownOption() => 'Invalid customization selected',
    };
