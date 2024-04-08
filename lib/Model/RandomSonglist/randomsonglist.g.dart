// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'randomsonglist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RandomSongListImpl _$$RandomSongListImplFromJson(Map<String, dynamic> json) =>
    _$RandomSongListImpl(
      json['status'] as bool?,
      (json['data'] as List<dynamic>?)
          ?.map((e) => RandomSong.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$RandomSongListImplToJson(
        _$RandomSongListImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
