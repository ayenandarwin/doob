import 'package:freezed_annotation/freezed_annotation.dart';
part 'customerfollow.freezed.dart';
part 'customerfollow.g.dart';

@freezed
class CustomerFollow with _$CustomerFollow {
  const factory CustomerFollow(
    int? id,
    String? name,
    String? gender,
    String? date_of_birth,
    String? phone,
    String? email,
    String? address,
    
    String? status,
    int? verified,
    
   
  ) = _CustomerFollow;

  factory CustomerFollow.fromJson(Map<String, dynamic> json) =>
      _$CustomerFollowFromJson(json);
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