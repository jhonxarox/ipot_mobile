// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RestaurantInfo _$RestaurantInfoFromJson(Map<String, dynamic> json) =>
    _RestaurantInfo(
      id: json['id'] as String,
      name: json['name'] as String,
      tableId: json['table_id'] as String,
    );

Map<String, dynamic> _$RestaurantInfoToJson(_RestaurantInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'table_id': instance.tableId,
    };
