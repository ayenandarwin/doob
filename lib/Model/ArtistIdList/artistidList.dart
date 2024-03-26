
import 'package:doob/Model/ArtistId/artistid.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'artistidList.freezed.dart';
part 'artistidList.g.dart';

@freezed
class ArtistIdLists with _$ArtistIdLists {
  const factory ArtistIdLists(
    bool? status,
    ArtistId? data,
    
  ) = _ArtistIdLists;

  factory ArtistIdLists.fromJson(Map<String, dynamic> json) =>
      _$ArtistIdListsFromJson(json);
}
