import 'package:freezed_annotation/freezed_annotation.dart';

part 'restaurant_info.freezed.dart';
part 'restaurant_info.g.dart';

@freezed
abstract class RestaurantInfo with _$RestaurantInfo {
  const factory RestaurantInfo({
    required String id,
    required String name,
    @JsonKey(name: 'table_id') required String tableId,
  }) = _RestaurantInfo;

  factory RestaurantInfo.fromJson(Map<String, dynamic> json) =>
      _$RestaurantInfoFromJson(json);
}
