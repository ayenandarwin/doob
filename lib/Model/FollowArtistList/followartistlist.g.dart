// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'followartistlist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FollowArtistListImpl _$$FollowArtistListImplFromJson(
        Map<String, dynamic> json) =>
    _$FollowArtistListImpl(
      json['status'] as bool?,
      (json['data'] as List<dynamic>?)
          ?.map((e) => FollowArtist.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$FollowArtistListImplToJson(
        _$FollowArtistListImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
