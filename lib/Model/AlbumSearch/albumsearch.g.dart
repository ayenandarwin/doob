// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'albumsearch.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AlbumSearchImpl _$$AlbumSearchImplFromJson(Map<String, dynamic> json) =>
    _$AlbumSearchImpl(
      json['id'] as int?,
      json['name'] as String?,
      json['type'] as String?,
      json['cover_photo'] as String?,
      json['AlbumSearch_artists'] as List<dynamic>,
      json['status'] as String?,
      (json['songs'] as List<dynamic>?)
          ?.map((e) => Songs.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$AlbumSearchImplToJson(_$AlbumSearchImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'cover_photo': instance.cover_photo,
      'AlbumSearch_artists': instance.AlbumSearch_artists,
      'status': instance.status,
      'songs': instance.songs,
    };
