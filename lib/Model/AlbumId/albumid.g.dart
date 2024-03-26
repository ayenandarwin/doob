// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'albumid.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AlbumIdImpl _$$AlbumIdImplFromJson(Map<String, dynamic> json) =>
    _$AlbumIdImpl(
      json['id'] as int?,
      json['name'] as String?,
      json['type'] as String?,
      json['cover_photo'] as String?,
      json['album_artists'] as List<dynamic>,
      json['status'] as String?,
      (json['songs'] as List<dynamic>?)
          ?.map((e) => Songs.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$AlbumIdImplToJson(_$AlbumIdImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'cover_photo': instance.cover_photo,
      'album_artists': instance.album_artists,
      'status': instance.status,
      'songs': instance.songs,
    };
