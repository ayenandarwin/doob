// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'randomsong.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RandomSongImpl _$$RandomSongImplFromJson(Map<String, dynamic> json) =>
    _$RandomSongImpl(
      json['id'] as int?,
      json['name'] as String?,
      json['cover_photo'] as String?,
      json['audio'] as String?,
      json['run_time'] as String?,
      json['lyric'] as String?,
      json['album_id'] as int?,
      json['owner_id'] as int?,
      json['status'] as String?,
      json['type'] as String?,
      json['mtv'] as String?,
      json['reject_reason'] as String?,
    );

Map<String, dynamic> _$$RandomSongImplToJson(_$RandomSongImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'cover_photo': instance.cover_photo,
      'audio': instance.audio,
      'run_time': instance.run_time,
      'lyric': instance.lyric,
      'album_id': instance.album_id,
      'owner_id': instance.owner_id,
      'status': instance.status,
      'type': instance.type,
      'mtv': instance.mtv,
      'reject_reason': instance.reject_reason,
    };
