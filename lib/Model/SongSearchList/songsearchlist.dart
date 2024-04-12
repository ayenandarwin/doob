
import 'package:doob/Model/SongSearch/songsearch.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'songsearchlist.freezed.dart';
part 'songsearchlist.g.dart';

@freezed
class SongSearchList with _$SongSearchList {
  const factory SongSearchList(
    bool? status,
    List<SongSearch>? data,
    
  ) = _SongSearchList;

  factory SongSearchList.fromJson(Map<String, dynamic> json) =>
      _$SongSearchListFromJson(json);
}
