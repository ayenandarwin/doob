
import 'package:doob/Model/SliderId/sliderid.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'slideridlist.freezed.dart';
part 'slideridlist.g.dart';

@freezed
class SliderIdList with _$SliderIdList {
  const factory SliderIdList(
    bool? status,
    SliderId data,
    
  ) = _SliderIdList;

  factory SliderIdList.fromJson(Map<String, dynamic> json) =>
      _$SliderIdListFromJson(json);
}
