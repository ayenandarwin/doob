// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'albumlist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AlbumListImpl _$$AlbumListImplFromJson(Map<String, dynamic> json) =>
    _$AlbumListImpl(
      json['status'] as bool?,
      (json['data'] as List<dynamic>?)
          ?.map((e) => Album.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$AlbumListImplToJson(_$AlbumListImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
