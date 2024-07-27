
import 'package:doob/Model/HomeFourSongs/homefoursongs.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'homefoursonglist.freezed.dart';
part 'homefoursonglist.g.dart';

@freezed
class HomeFourSongList with _$HomeFourSongList {
  const factory HomeFourSongList(
    bool? status,
    List<HomeFourSongs>? data,
    
  ) = _HomeFourSongList;

  factory HomeFourSongList.fromJson(Map<String, dynamic> json) =>
      _$HomeFourSongListFromJson(json);
}
