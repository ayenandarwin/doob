// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customerfollowlist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CustomerFollowListImpl _$$CustomerFollowListImplFromJson(
        Map<String, dynamic> json) =>
    _$CustomerFollowListImpl(
      json['status'] as bool?,
      (json['data'] as List<dynamic>?)
          ?.map((e) => CustomerFollow.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CustomerFollowListImplToJson(
        _$CustomerFollowListImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
