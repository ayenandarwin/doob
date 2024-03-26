import 'package:freezed_annotation/freezed_annotation.dart';
part 'sliderid.freezed.dart';
part 'sliderid.g.dart';

@freezed
class SliderId with _$SliderId {
  const factory SliderId(
    int? id,
    String? photo,
    int? status,
    
    
   
  ) = _SliderId;

  factory SliderId.fromJson(Map<String, dynamic> json) =>
      _$SliderIdFromJson(json);
}


   