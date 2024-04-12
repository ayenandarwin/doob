// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'songcomment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SongCommentImpl _$$SongCommentImplFromJson(Map<String, dynamic> json) =>
    _$SongCommentImpl(
      json['id'] as int?,
      json['comment_text'] as String?,
      json['customer'] == null
          ? null
          : Customer.fromJson(json['customer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SongCommentImplToJson(_$SongCommentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'comment_text': instance.comment_text,
      'customer': instance.customer,
    };
