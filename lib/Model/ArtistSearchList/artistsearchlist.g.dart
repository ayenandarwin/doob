// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artistsearchlist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ArtistSearchListImpl _$$ArtistSearchListImplFromJson(
        Map<String, dynamic> json) =>
    _$ArtistSearchListImpl(
      json['status'] as bool?,
      (json['data'] as List<dynamic>?)
          ?.map((e) => ArtistSearch.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ArtistSearchListImplToJson(
        _$ArtistSearchListImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
