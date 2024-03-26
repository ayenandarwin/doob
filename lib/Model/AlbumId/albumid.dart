import 'package:doob/Model/AlbumId/Songs/songs.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'albumid.freezed.dart';
part 'albumid.g.dart';

@freezed
class AlbumId with _$AlbumId {
  const factory AlbumId(
    int? id,
    String? name,
    String? type,
    String? cover_photo,
    List album_artists,
    String? status,
    List<Songs>? songs,
  ) = _AlbumId;

  factory AlbumId.fromJson(Map<String, dynamic> json) =>
      _$AlbumIdFromJson(json);
}
