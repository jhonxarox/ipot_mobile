import 'package:freezed_annotation/freezed_annotation.dart';

part 'customization_option.freezed.dart';
part 'customization_option.g.dart';

@freezed
abstract class CustomizationOption with _$CustomizationOption {
  const factory CustomizationOption({
    required int id,
    required String name,
    @JsonKey(name: 'price_modifier') required double priceModifier,
  }) = _CustomizationOption;

  factory CustomizationOption.fromJson(Map<String, dynamic> json) =>
      _$CustomizationOptionFromJson(json);
}
