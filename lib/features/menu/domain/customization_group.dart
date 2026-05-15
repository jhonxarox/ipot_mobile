import 'package:freezed_annotation/freezed_annotation.dart';

import 'customization_option.dart';

part 'customization_group.freezed.dart';
part 'customization_group.g.dart';

@freezed
abstract class CustomizationGroup with _$CustomizationGroup {
  const factory CustomizationGroup({
    required int id,
    required String name,
    required bool required,
    @JsonKey(name: 'max_selections') required int maxSelections,
    @Default([]) List<CustomizationOption> options,
  }) = _CustomizationGroup;

  factory CustomizationGroup.fromJson(Map<String, dynamic> json) =>
      _$CustomizationGroupFromJson(json);
}
