import 'package:doob/Model/Category/category.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'categorylist.freezed.dart';
part 'categorylist.g.dart';

@freezed
class CategoryLists with _$CategoryLists {
  const factory CategoryLists(
    bool? status,
    List<Category>? data,
 //  Map<String,dynamic>? data,
  ) = _CategoryLists;

  factory CategoryLists.fromJson(Map<String, dynamic> json) =>
      _$CategoryListsFromJson(json);
}
