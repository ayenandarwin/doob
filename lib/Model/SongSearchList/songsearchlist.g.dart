// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'songsearchlist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SongSearchListImpl _$$SongSearchListImplFromJson(Map<String, dynamic> json) =>
    _$SongSearchListImpl(
      json['status'] as bool?,
      (json['data'] as List<dynamic>?)
          ?.map((e) => SongSearch.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SongSearchListImplToJson(
        _$SongSearchListImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
