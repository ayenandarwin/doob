import 'package:doob/Model/CustomerFollow/customerfollow.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'customerfollowlist.freezed.dart';
part 'customerfollowlist.g.dart';

@freezed
class CustomerFollowList with _$CustomerFollowList {
  const factory CustomerFollowList(
    bool? status,
    List<CustomerFollow>? data,
    
  ) = _CustomerFollowList;

  factory CustomerFollowList.fromJson(Map<String, dynamic> json) =>
      _$CustomerFollowListFromJson(json);
}
