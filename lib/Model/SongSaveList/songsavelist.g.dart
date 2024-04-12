// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'songsavelist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SongSaveListImpl _$$SongSaveListImplFromJson(Map<String, dynamic> json) =>
    _$SongSaveListImpl(
      json['status'] as bool?,
      (json['data'] as List<dynamic>?)
          ?.map((e) => SongSave.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SongSaveListImplToJson(_$SongSaveListImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
