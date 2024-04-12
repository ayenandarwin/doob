
import 'package:doob/Model/SongSave/songsave.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'songsavelist.freezed.dart';
part 'songsavelist.g.dart';

@freezed
class SongSaveList with _$SongSaveList {
  const factory SongSaveList(
    bool? status,
    List<SongSave>? data,
    
  ) = _SongSaveList;

  factory SongSaveList.fromJson(Map<String, dynamic> json) =>
      _$SongSaveListFromJson(json);
}
