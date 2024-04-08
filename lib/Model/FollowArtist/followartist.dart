import 'package:freezed_annotation/freezed_annotation.dart';
part 'followartist.freezed.dart';
part 'followartist.g.dart';

@freezed
class FollowArtist with _$FollowArtist {
  const factory FollowArtist(
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
    
   
  ) = _FollowArtist;

  factory FollowArtist.fromJson(Map<String, dynamic> json) =>
      _$FollowArtistFromJson(json);
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