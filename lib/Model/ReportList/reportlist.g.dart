// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reportlist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReportListImpl _$$ReportListImplFromJson(Map<String, dynamic> json) =>
    _$ReportListImpl(
      json['status'] as bool?,
      (json['data'] as List<dynamic>?)
          ?.map((e) => Report.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ReportListImplToJson(_$ReportListImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
