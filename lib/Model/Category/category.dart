import 'package:freezed_annotation/freezed_annotation.dart';
part 'category.freezed.dart';
part 'category.g.dart';

@freezed
class Category with _$Category {
  const factory Category(
    int? id,
    String? name,
    String? parent,
 
   
  ) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}


    