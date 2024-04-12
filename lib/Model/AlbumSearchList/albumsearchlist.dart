
import 'package:doob/Model/AlbumSearch/albumsearch.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'albumsearchlist.freezed.dart';
part 'albumsearchlist.g.dart';

@freezed
class AlbumSearchList with _$AlbumSearchList {
  const factory AlbumSearchList(
    bool? status,
    List<AlbumSearch>? data,
    
  ) = _AlbumSearchList;

  factory AlbumSearchList.fromJson(Map<String, dynamic> json) =>
      _$AlbumSearchListFromJson(json);
}
