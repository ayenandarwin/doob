
import 'package:doob/Model/SongComments/songcomment.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'songcommentlist.freezed.dart';
part 'songcommentlist.g.dart';

@freezed
class SongCommentList with _$SongCommentList {
  const factory SongCommentList(
    bool? status,
    List<SongComment>? data,
    
  ) = _SongCommentList;

  factory SongCommentList.fromJson(Map<String, dynamic> json) =>
      _$SongCommentListFromJson(json);
}
