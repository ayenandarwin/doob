
import 'package:doob/Model/HomeFourSongs/homefoursongs.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'homefourpodcastlist.freezed.dart';
part 'homefourpodcastlist.g.dart';

@freezed
class HomeFourPodcastList with _$HomeFourPodcastList {
  const factory HomeFourPodcastList(
    bool? status,
    List<HomeFourSongs>? data,
    
  ) = _HomeFourPodcastList;

  factory HomeFourPodcastList.fromJson(Map<String, dynamic> json) =>
      _$HomeFourPodcastListFromJson(json);
}
