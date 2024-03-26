import 'package:doob/Model/Artists/artists.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'artistList.freezed.dart';
part 'artistList.g.dart';

@freezed
class ArtistList with _$ArtistList {
  const factory ArtistList(
    bool? status,
    List<Artist>? data,
    
  ) = _ArtistList;

  factory ArtistList.fromJson(Map<String, dynamic> json) =>
      _$ArtistListFromJson(json);
}
