// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'slideridlist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SliderIdListImpl _$$SliderIdListImplFromJson(Map<String, dynamic> json) =>
    _$SliderIdListImpl(
      json['status'] as bool?,
      SliderId.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SliderIdListImplToJson(_$SliderIdListImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
