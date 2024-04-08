import 'package:freezed_annotation/freezed_annotation.dart';
part 'song.freezed.dart';
part 'song.g.dart';

@freezed
class Song with _$Song {
  const factory Song(
    int? id,
    String? name,
    String? cover_photo,
    String? audio,
    String? run_time,
    String? lyric,
int? album_id,
    int? owner_id,
    String? status,
    String? type,
    String? mtv,
    String? reject_reason,
   
    
   
  ) = _Song;

  factory Song.fromJson(Map<String, dynamic> json) =>
      _$SongFromJson(json);
}

/*
           "id": 25,
            "name": "Energy",
            "cover_photo": "https://doob.smartcodemm.com/storage/songs/cover_photo/J9K2kuFJVERtmdtQkf6oK18YaVGKWO4nf6zZatlO.png",
            "audio": "https://doob.smartcodemm.com/storage/songs/audio/xr2gvVQ7RyvodWMCtynleCnc9q7EiBFHRwnrWDnf.mp3",
            "run_time": "01:57",
            "lyric": "",
            "album_id": 29,
            "owner_id": 73,
            "status": "approved",
            "type": "song",
            "mtv": "",
            "reject_reason": null

 */
   