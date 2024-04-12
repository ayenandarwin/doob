import 'package:freezed_annotation/freezed_annotation.dart';
part 'artistsearch.freezed.dart';
part 'artistsearch.g.dart';

@freezed
class ArtistSearch with _$ArtistSearch {
  const factory ArtistSearch(
    int? id,
    String? name,
    String? photo,
    String? gender,
    String? date_of_birth,
    String? phone,
    String? email,
    String? address,
    
    String? status,
    int? verified,
    
   
  ) = _ArtistSearch;

  factory ArtistSearch.fromJson(Map<String, dynamic> json) =>
      _$ArtistSearchFromJson(json);
}


     /*      "id": 78,
            "name": "Post Malone",
            "gender": "Male",
            "date_of_birth": "2024-02-25",
            "phone": "09979973858",
            "email": "postmalone@gmail.com",
            "address": "Myanmar",
            "status": "approved",
            "verified": 1

            */