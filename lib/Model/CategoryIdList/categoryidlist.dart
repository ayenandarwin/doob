import 'package:doob/Model/CategoryId/categoryid.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'categoryidlist.freezed.dart';
part 'categoryidlist.g.dart';

@freezed
class CategoryIdLists with _$CategoryIdLists {
  const factory CategoryIdLists(
    bool? status,
    CategoryId? data,
 //  Map<String,dynamic>? data,
  ) = _CategoryIdLists;

  factory CategoryIdLists.fromJson(Map<String, dynamic> json) =>
      _$CategoryIdListsFromJson(json);
}
