
import 'package:doob/Model/Song/song.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'songlist.freezed.dart';
part 'songlist.g.dart';

@freezed
class SongList with _$SongList {
  const factory SongList(
    bool? status,
    List<Song>? data,
    
  ) = _SongList;

  factory SongList.fromJson(Map<String, dynamic> json) =>
      _$SongListFromJson(json);
}
