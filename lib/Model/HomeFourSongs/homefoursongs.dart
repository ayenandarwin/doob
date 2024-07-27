import 'package:freezed_annotation/freezed_annotation.dart';
part 'homefoursongs.freezed.dart';
part 'homefoursongs.g.dart';

@freezed
class HomeFourSongs with _$HomeFourSongs {
  const factory HomeFourSongs(
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
  ) = _HomeFourSongs;

  factory HomeFourSongs.fromJson(Map<String, dynamic> json) =>
      _$HomeFourSongsFromJson(json);
}

/*
            "id": 48,
            "name": "Just The Way You Are",
            "cover_photo": "https://doobbucket.s3.ap-southeast-1.amazonaws.com/songs/cover-photos/4HCmzpfrTR8vsOLNRfJ29qDHbdei0z9m9vtDKSDK.png",
            "thumbnail": "https://doobbucket.s3.ap-southeast-1.amazonaws.com/songs/thumbnails/2MY1TkqRFN9Vv5FsPP9iWlJ7jPjsIXr6HFYf6xEL.jpg",
            "audio": "https://doobbucket.s3.ap-southeast-1.amazonaws.com/songs/mp3/5o2liNXlQyVAm87p3EhWN90KzRZcwQ0fc29YSVhM.mp3",
            "run_time": "03:36",
            "lyric": "https://doobbucket.s3.ap-southeast-1.amazonaws.com/songs/lyrics/665ea9c1226d5.lrc",
            "album_id": null,
            "owner_id": 85,
            "status": "approved",
            "type": "song",
            "mtv": "https://doobbucket.s3.ap-southeast-1.amazonaws.com/songs/mtv/2MY1TkqRFN9Vv5FsPP9iWlJ7jPjsIXr6HFYf6xEL.mp4",
            "reject_reason": null,
            "like_count": 0,
            "comment_count": 0,
            "share_count": 0

 */
   