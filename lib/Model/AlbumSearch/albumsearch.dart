import 'package:doob/Model/Album/Songs/songs.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'albumsearch.freezed.dart';
part 'albumsearch.g.dart';

@freezed
class AlbumSearch with _$AlbumSearch {
  const factory AlbumSearch(
    int? id,
    String? name,
    String? type,
    String? cover_photo,
    List AlbumSearch_artists,
    String? status,
    List<Songs>? songs,
    
  
   
   
  ) = _AlbumSearch;

  factory AlbumSearch.fromJson(Map<String, dynamic> json) =>
      _$AlbumSearchFromJson(json);
}

/*
            id": 29,
            "name": "Renaissance",
            "type": "single",
            "cover_photo": "https://doob.smartcodemm.com/storage/AlbumSearch/zhvQtWcCavo8s4U14e3SbUONhxTTs6T026RC5Ab6.png",
            "status": "approved",
*/