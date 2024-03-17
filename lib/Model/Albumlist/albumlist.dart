
import 'package:doob/Model/Album/album.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'albumlist.freezed.dart';
part 'albumlist.g.dart';

@freezed
class AlbumList with _$AlbumList {
  const factory AlbumList(
    bool? status,
    List<Album>? data,
    
  ) = _AlbumList;

  factory AlbumList.fromJson(Map<String, dynamic> json) =>
      _$AlbumListFromJson(json);
}
