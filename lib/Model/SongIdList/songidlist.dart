
import 'package:doob/Model/SongId/songid.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'songidlist.freezed.dart';
part 'songidlist.g.dart';

@freezed
class SongIdList with _$SongIdList {
  const factory SongIdList(
    bool? status,
    SongId? data,
    
  ) = _SongIdList;

  factory SongIdList.fromJson(Map<String, dynamic> json) =>
      _$SongIdListFromJson(json);
}
