import 'package:freezed_annotation/freezed_annotation.dart';
part 'randomsong.freezed.dart';
part 'randomsong.g.dart';

@freezed
class RandomSong with _$RandomSong {
  const factory RandomSong(
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
    
   
  ) = _RandomSong;

  factory RandomSong.fromJson(Map<String, dynamic> json) =>
      _$RandomSongFromJson(json);
}


     /*       "id": 33,
            "name": "Test",
            "cover_photo": "https://doobbucket.s3.ap-southeast-1.amazonaws.com/songs/cover-photos/Iza1lnoWPqNvs3nvT5QMArZCXLu7F933PueaYZD8.jpg",
            "audio": "https://doobbucket.s3.ap-southeast-1.amazonaws.com/songs/mp3/EHzBIo8hsa7iSuLcT2g20xKg4mTlBBCNYN5L7MbX.mp3",
            "run_time": "04:14",
            "lyric": "",
            "album_id": 34,
            "owner_id": 84,
            "status": "approved",
            "type": "song",
            "mtv": "",
            "reject_reason": null

            */