// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categorylist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CategoryListsImpl _$$CategoryListsImplFromJson(Map<String, dynamic> json) =>
    _$CategoryListsImpl(
      json['status'] as bool?,
      (json['data'] as List<dynamic>?)
          ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CategoryListsImplToJson(_$CategoryListsImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
