// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'albumidlists.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AlbumIdListsImpl _$$AlbumIdListsImplFromJson(Map<String, dynamic> json) =>
    _$AlbumIdListsImpl(
      json['status'] as bool?,
      json['data'] == null
          ? null
          : AlbumId.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AlbumIdListsImplToJson(_$AlbumIdListsImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
