
import 'package:doob/Model/RandomSongs/randomsong.dart';
import 'package:doob/Model/Song/song.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'randomsonglist.freezed.dart';
part 'randomsonglist.g.dart';

@freezed
class RandomSongList with _$RandomSongList {
  const factory RandomSongList(
    bool? status,
    List<RandomSong>? data,
    
  ) = _RandomSongList;

  factory RandomSongList.fromJson(Map<String, dynamic> json) =>
      _$RandomSongListFromJson(json);
}
