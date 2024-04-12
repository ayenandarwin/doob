// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'albumsearchlist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AlbumSearchListImpl _$$AlbumSearchListImplFromJson(
        Map<String, dynamic> json) =>
    _$AlbumSearchListImpl(
      json['status'] as bool?,
      (json['data'] as List<dynamic>?)
          ?.map((e) => AlbumSearch.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$AlbumSearchListImplToJson(
        _$AlbumSearchListImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
