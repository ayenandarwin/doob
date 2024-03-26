import 'package:doob/Model/AlbumId/albumid.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'albumidlists.freezed.dart';
part 'albumidlists.g.dart';

@freezed
class AlbumIdLists with _$AlbumIdLists {
  const factory AlbumIdLists(
    bool? status,
   // Map<String,dynamic>? data,
    //
    AlbumId? data,
  ) = _AlbumIdLists;

  factory AlbumIdLists.fromJson(Map<String, dynamic> json) =>
      _$AlbumIdListsFromJson(json);
}
