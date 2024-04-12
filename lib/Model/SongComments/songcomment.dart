import 'package:doob/Model/SongComments/Customer/customer.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'songcomment.freezed.dart';
part 'songcomment.g.dart';

@freezed
class SongComment with _$SongComment {
  const factory SongComment(
    int? id,
    String? comment_text,
   Customer? customer,
   
    
   
  ) = _SongComment;

  factory SongComment.fromJson(Map<String, dynamic> json) =>
      _$SongCommentFromJson(json);
}

/*
 "id": 2,
            "comment_text": "test update",
            "customer": {
                "id": 58,
                "name": "Zar Ni",
                "phone": "09765504024",
                "register_type": "phone",
                "profile_photo": "https://doobbucket.s3.ap-southeast-1.amazonaws.com/users/"
*/