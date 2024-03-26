// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sliderlist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SliderListImpl _$$SliderListImplFromJson(Map<String, dynamic> json) =>
    _$SliderListImpl(
      json['status'] as bool?,
      (json['data'] as List<dynamic>?)
          ?.map((e) => Slider.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SliderListImplToJson(_$SliderListImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
