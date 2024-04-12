import 'package:freezed_annotation/freezed_annotation.dart';

import '../ArtistSearch/artistsearch.dart';
part 'artistsearchlist.freezed.dart';
part 'artistsearchlist.g.dart';

@freezed
class ArtistSearchList with _$ArtistSearchList {
  const factory ArtistSearchList(
    bool? status,
    List<ArtistSearch>? data,
    
  ) = _ArtistSearchList;

  factory ArtistSearchList.fromJson(Map<String, dynamic> json) =>
      _$ArtistSearchListFromJson(json);
}
