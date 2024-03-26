import 'package:freezed_annotation/freezed_annotation.dart';
part 'artists.freezed.dart';
part 'artists.g.dart';

@freezed
class Artist with _$Artist {
  const factory Artist(
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
    
   
  ) = _Artist;

  factory Artist.fromJson(Map<String, dynamic> json) =>
      _$ArtistFromJson(json);
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