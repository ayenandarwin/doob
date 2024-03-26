// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artistList.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ArtistListImpl _$$ArtistListImplFromJson(Map<String, dynamic> json) =>
    _$ArtistListImpl(
      json['status'] as bool?,
      (json['data'] as List<dynamic>?)
          ?.map((e) => Artist.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ArtistListImplToJson(_$ArtistListImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
