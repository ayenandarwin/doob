import 'package:freezed_annotation/freezed_annotation.dart';
part 'homefourpodcasts.freezed.dart';
part 'homefourpodcasts.g.dart';

@freezed
class HomeFourPodcasts with _$HomeFourPodcasts {
  const factory HomeFourPodcasts(
    int? id,
    String? name,
    String? cover_photo,
    String? thumbnail,
    String? audio,
    String? run_time,
    String? lyric,
    int? album_id,
    int? owner_id,
    String? status,
    String? type,
    String? mtv,
    String? reject_reason,
    int? like_count,
    int? comment_count,
    int? share_count,
  ) = _HomeFourPodcasts;

  factory HomeFourPodcasts.fromJson(Map<String, dynamic> json) =>
      _$HomeFourPodcastsFromJson(json);
}

/*
            "id": 42,
            "name": "Energy",
            "cover_photo": "https://doobbucket.s3.ap-southeast-1.amazonaws.com/songs/cover-photos/ImXL63xu73wUva0zANgVM6ykTIsFAbhfMbWQhGSl.jpg",
            "thumbnail": "https://doobbucket.s3.ap-southeast-1.amazonaws.com/songs/thumbnails/Aju5q6tHVasON6ttUlUl9kDn6JXnF0Aykw9QoLjF.jpg",
            "audio": "https://doobbucket.s3.ap-southeast-1.amazonaws.com/songs/mp3/eLzkwM2b0dnouKgGOfz4KML9YX0b5z2VxQyXT7uR.mp3",
            "run_time": "01:57",
            "lyric": "",
            "album_id": 35,
            "owner_id": 83,
            "status": "approved",
            "type": "podcast",
            "mtv": "https://doobbucket.s3.ap-southeast-1.amazonaws.com/songs/mtv/Aju5q6tHVasON6ttUlUl9kDn6JXnF0Aykw9QoLjF.mp4",
            "reject_reason": null,
            "like_count": 2,
            "comment_count": 6,
            "share_count": 0

 */
   