import 'package:doob/Model/Slider/slider.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'sliderlist.freezed.dart';
part 'sliderlist.g.dart';

@freezed
class SliderList with _$SliderList {
  const factory SliderList(
    bool? status,
    List<Slider>? data,
  ) = _SliderList;

  factory SliderList.fromJson(Map<String, dynamic> json) =>
      _$SliderListFromJson(json);
}
