// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'followartist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FollowArtistImpl _$$FollowArtistImplFromJson(Map<String, dynamic> json) =>
    _$FollowArtistImpl(
      json['id'] as int?,
      json['name'] as String?,
      json['photo'] as String?,
      json['gender'] as String?,
      json['date_of_birth'] as String?,
      json['phone'] as String?,
      json['email'] as String?,
      json['address'] as String?,
      json['status'] as String?,
      json['verified'] as int?,
    );

Map<String, dynamic> _$$FollowArtistImplToJson(_$FollowArtistImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'photo': instance.photo,
      'gender': instance.gender,
      'date_of_birth': instance.date_of_birth,
      'phone': instance.phone,
      'email': instance.email,
      'address': instance.address,
      'status': instance.status,
      'verified': instance.verified,
    };