
import 'package:doob/Model/FollowArtistSong/followartistsong.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'followartistsonglist.freezed.dart';
part 'followartistsonglist.g.dart';

@freezed
class FollowArtistSongList with _$FollowArtistSongList {
  const factory FollowArtistSongList(
    bool? status,
    List<FollowArtistSong>? data,
    
  ) = _FollowArtistSongList;

  factory FollowArtistSongList.fromJson(Map<String, dynamic> json) =>
      _$FollowArtistSongListFromJson(json);
}
