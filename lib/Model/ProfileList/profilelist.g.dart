// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profilelist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProfileListsImpl _$$ProfileListsImplFromJson(Map<String, dynamic> json) =>
    _$ProfileListsImpl(
      json['status'] as bool?,
      json['data'] == null
          ? null
          : Profile.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ProfileListsImplToJson(_$ProfileListsImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
