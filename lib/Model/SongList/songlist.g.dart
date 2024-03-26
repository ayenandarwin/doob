// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'songlist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SongListImpl _$$SongListImplFromJson(Map<String, dynamic> json) =>
    _$SongListImpl(
      json['status'] as bool?,
      (json['data'] as List<dynamic>?)
          ?.map((e) => Song.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SongListImplToJson(_$SongListImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
