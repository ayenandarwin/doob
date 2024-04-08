import 'package:doob/Model/FollowArtist/followartist.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'followartistlist.freezed.dart';
part 'followartistlist.g.dart';

@freezed
class FollowArtistList with _$FollowArtistList {
  const factory FollowArtistList(
    bool? status,
    List<FollowArtist>? data,
    
  ) = _FollowArtistList;

  factory FollowArtistList.fromJson(Map<String, dynamic> json) =>
      _$FollowArtistListFromJson(json);
}
