// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'songcommentlist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SongCommentListImpl _$$SongCommentListImplFromJson(
        Map<String, dynamic> json) =>
    _$SongCommentListImpl(
      json['status'] as bool?,
      (json['data'] as List<dynamic>?)
          ?.map((e) => SongComment.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SongCommentListImplToJson(
        _$SongCommentListImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
