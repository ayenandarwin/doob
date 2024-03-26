import 'package:doob/Model/Album/Songs/songs.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'album.freezed.dart';
part 'album.g.dart';

@freezed
class Album with _$Album {
  const factory Album(
    int? id,
    String? name,
    String? type,
    String? cover_photo,
    List album_artists,
    String? status,
    List<Songs>? songs,
    
  
   
   
  ) = _Album;

  factory Album.fromJson(Map<String, dynamic> json) =>
      _$AlbumFromJson(json);
}

/*
            id": 29,
            "name": "Renaissance",
            "type": "single",
            "cover_photo": "https://doob.smartcodemm.com/storage/album/zhvQtWcCavo8s4U14e3SbUONhxTTs6T026RC5Ab6.png",
            "status": "approved",
*/