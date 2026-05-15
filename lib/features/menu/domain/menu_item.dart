import 'package:freezed_annotation/freezed_annotation.dart';

import 'customization_group.dart';

part 'menu_item.freezed.dart';
part 'menu_item.g.dart';

@freezed
abstract class MenuItem with _$MenuItem {
  const factory MenuItem({
    required int id,
    required String name,
    required String description,
    required double price,
    @JsonKey(name: 'category_id') required int categoryId,
    @JsonKey(name: 'image_url') String? imageUrl,
    @JsonKey(name: 'customization_groups')
    @Default([])
    List<CustomizationGroup> customizationGroups,
  }) = _MenuItem;

  factory MenuItem.fromJson(Map<String, dynamic> json) =>
      _$MenuItemFromJson(json);
}
