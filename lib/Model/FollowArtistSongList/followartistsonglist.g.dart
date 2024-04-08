// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'followartistsonglist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FollowArtistSongListImpl _$$FollowArtistSongListImplFromJson(
        Map<String, dynamic> json) =>
    _$FollowArtistSongListImpl(
      json['status'] as bool?,
      (json['data'] as List<dynamic>?)
          ?.map((e) => FollowArtistSong.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$FollowArtistSongListImplToJson(
        _$FollowArtistSongListImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
