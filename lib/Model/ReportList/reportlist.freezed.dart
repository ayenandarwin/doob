// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reportlist.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ReportList _$ReportListFromJson(Map<String, dynamic> json) {
  return _ReportList.fromJson(json);
}

/// @nodoc
mixin _$ReportList {
  bool? get status => throw _privateConstructorUsedError;
  List<Report>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReportListCopyWith<ReportList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportListCopyWith<$Res> {
  factory $ReportListCopyWith(
          ReportList value, $Res Function(ReportList) then) =
      _$ReportListCopyWithImpl<$Res, ReportList>;
  @useResult
  $Res call({bool? status, List<Report>? data});
}

/// @nodoc
class _$ReportListCopyWithImpl<$Res, $Val extends ReportList>
    implements $ReportListCopyWith<$Res> {
  _$ReportListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Report>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReportListImplCopyWith<$Res>
    implements $ReportListCopyWith<$Res> {
  factory _$$ReportListImplCopyWith(
          _$ReportListImpl value, $Res Function(_$ReportListImpl) then) =
      __$$ReportListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? status, List<Report>? data});
}

/// @nodoc
class __$$ReportListImplCopyWithImpl<$Res>
    extends _$ReportListCopyWithImpl<$Res, _$ReportListImpl>
    implements _$$ReportListImplCopyWith<$Res> {
  __$$ReportListImplCopyWithImpl(
      _$ReportListImpl _value, $Res Function(_$ReportListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? data = freezed,
  }) {
    return _then(_$ReportListImpl(
      freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
      freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Report>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReportListImpl implements _ReportList {
  const _$ReportListImpl(this.status, final List<Report>? data) : _data = data;

  factory _$ReportListImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReportListImplFromJson(json);

  @override
  final bool? status;
  final List<Report>? _data;
  @override
  List<Report>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ReportList(status: $status, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReportListImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, status, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReportListImplCopyWith<_$ReportListImpl> get copyWith =>
      __$$ReportListImplCopyWithImpl<_$ReportListImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReportListImplToJson(
      this,
    );
  }
}

abstract class _ReportList implements ReportList {
  const factory _ReportList(final bool? status, final List<Report>? data) =
      _$ReportListImpl;

  factory _ReportList.fromJson(Map<String, dynamic> json) =
      _$ReportListImpl.fromJson;

  @override
  bool? get status;
  @override
  List<Report>? get data;
  @override
  @JsonKey(ignore: true)
  _$$ReportListImplCopyWith<_$ReportListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
