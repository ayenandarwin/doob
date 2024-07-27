// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'homefourpodcastlist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HomeFourPodcastListImpl _$$HomeFourPodcastListImplFromJson(
        Map<String, dynamic> json) =>
    _$HomeFourPodcastListImpl(
      json['status'] as bool?,
      (json['data'] as List<dynamic>?)
          ?.map((e) => HomeFourSongs.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$HomeFourPodcastListImplToJson(
        _$HomeFourPodcastListImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
