// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'songidlist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SongIdListImpl _$$SongIdListImplFromJson(Map<String, dynamic> json) =>
    _$SongIdListImpl(
      json['status'] as bool?,
      json['data'] == null
          ? null
          : SongId.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SongIdListImplToJson(_$SongIdListImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
