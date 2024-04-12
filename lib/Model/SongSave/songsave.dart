import 'package:freezed_annotation/freezed_annotation.dart';
part 'songsave.freezed.dart';
part 'songsave.g.dart';

@freezed
class SongSave with _$SongSave {
  const factory SongSave(
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
   
    
   
  ) = _SongSave;

  factory SongSave.fromJson(Map<String, dynamic> json) =>
      _$SongSaveFromJson(json);
}

/*
           "id": 25,
            "name": "Energy",
            "cover_photo": "https://doob.smartcodemm.com/storage/SongSaves/cover_photo/J9K2kuFJVERtmdtQkf6oK18YaVGKWO4nf6zZatlO.png",
            "audio": "https://doob.smartcodemm.com/storage/SongSaves/audio/xr2gvVQ7RyvodWMCtynleCnc9q7EiBFHRwnrWDnf.mp3",
            "run_time": "01:57",
            "lyric": "",
            "album_id": 29,
            "owner_id": 73,
            "status": "approved",
            "type": "SongSave",
            "mtv": "",
            "reject_reason": null

 */
   