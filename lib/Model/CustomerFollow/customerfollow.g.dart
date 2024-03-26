// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customerfollow.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CustomerFollowImpl _$$CustomerFollowImplFromJson(Map<String, dynamic> json) =>
    _$CustomerFollowImpl(
      json['id'] as int?,
      json['name'] as String?,
      json['gender'] as String?,
      json['date_of_birth'] as String?,
      json['phone'] as String?,
      json['email'] as String?,
      json['address'] as String?,
      json['status'] as String?,
      json['verified'] as int?,
    );

Map<String, dynamic> _$$CustomerFollowImplToJson(
        _$CustomerFollowImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'gender': instance.gender,
      'date_of_birth': instance.date_of_birth,
      'phone': instance.phone,
      'email': instance.email,
      'address': instance.address,
      'status': instance.status,
      'verified': instance.verified,
    };
