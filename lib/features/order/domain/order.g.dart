// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Order _$OrderFromJson(Map<String, dynamic> json) => _Order(
  id: json['id'] as String,
  status: _statusFromJson(json['status']),
  estimatedPreparationMinutes: (json['estimated_preparation_minutes'] as num?)
      ?.toInt(),
);

Map<String, dynamic> _$OrderToJson(_Order instance) => <String, dynamic>{
  'id': instance.id,
  'status': _statusToJson(instance.status),
  'estimated_preparation_minutes': instance.estimatedPreparationMinutes,
};
