import 'package:freezed_annotation/freezed_annotation.dart';
part 'songid.freezed.dart';
part 'songid.g.dart';

@freezed
class SongId with _$SongId {
  const factory SongId(
    int? id,
    String? name,
    String? cover_photo,
    String? audio,
    String? run_time,
    String? lyric,
    String? album_id,
    String? owner_id,
    String? status,
    String? type,
    String? mtv,
    String? reject_reason,
   
    
   
  ) = _SongId;

  factory SongId.fromJson(Map<String, dynamic> json) =>
      _$SongIdFromJson(json);
}

