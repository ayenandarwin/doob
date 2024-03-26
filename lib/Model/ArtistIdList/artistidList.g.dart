// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artistidList.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ArtistIdListsImpl _$$ArtistIdListsImplFromJson(Map<String, dynamic> json) =>
    _$ArtistIdListsImpl(
      json['status'] as bool?,
      json['data'] == null
          ? null
          : ArtistId.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ArtistIdListsImplToJson(_$ArtistIdListsImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
