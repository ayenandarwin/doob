// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'homefoursonglist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HomeFourSongListImpl _$$HomeFourSongListImplFromJson(
        Map<String, dynamic> json) =>
    _$HomeFourSongListImpl(
      json['status'] as bool?,
      (json['data'] as List<dynamic>?)
          ?.map((e) => HomeFourSongs.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$HomeFourSongListImplToJson(
        _$HomeFourSongListImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
