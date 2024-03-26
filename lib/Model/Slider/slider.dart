import 'package:freezed_annotation/freezed_annotation.dart';
part 'slider.freezed.dart';
part 'slider.g.dart';

@freezed
class Slider with _$Slider {
  const factory Slider(
    int? id,
    String? photo,
    int? status,
    
    
   
  ) = _Slider;

  factory Slider.fromJson(Map<String, dynamic> json) =>
      _$SliderFromJson(json);
}


   