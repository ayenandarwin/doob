import 'package:doob/Model/Profile/profile.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'profilelist.freezed.dart';
part 'profilelist.g.dart';

@freezed
class ProfileLists with _$ProfileLists {
  const factory ProfileLists(
    bool? status,
    Profile? data,
 //  Map<String,dynamic>? data,
  ) = _ProfileLists;

  factory ProfileLists.fromJson(Map<String, dynamic> json) =>
      _$ProfileListsFromJson(json);
}
