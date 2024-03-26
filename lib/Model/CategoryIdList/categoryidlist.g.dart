// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categoryidlist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CategoryIdListsImpl _$$CategoryIdListsImplFromJson(
        Map<String, dynamic> json) =>
    _$CategoryIdListsImpl(
      json['status'] as bool?,
      json['data'] == null
          ? null
          : CategoryId.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CategoryIdListsImplToJson(
        _$CategoryIdListsImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
