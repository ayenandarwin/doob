import 'package:doob/Model/Reports/report.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'reportlist.freezed.dart';
part 'reportlist.g.dart';

@freezed
class ReportList with _$ReportList {
  const factory ReportList(
    bool? status,
    List<Report>? data,
    
  ) = _ReportList;

  factory ReportList.fromJson(Map<String, dynamic> json) =>
      _$ReportListFromJson(json);
}
