import 'package:freezed_annotation/freezed_annotation.dart';
part 'categoryid.freezed.dart';
part 'categoryid.g.dart';

@freezed
class CategoryId with _$CategoryId {
  const factory CategoryId(
    int? id,
    String? name,
    String? parent,
 
   
  ) = _CategoryId;

  factory CategoryId.fromJson(Map<String, dynamic> json) =>
      _$CategoryIdFromJson(json);
}


    