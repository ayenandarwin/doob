// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'slideridlist.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SliderIdList _$SliderIdListFromJson(Map<String, dynamic> json) {
  return _SliderIdList.fromJson(json);
}

/// @nodoc
mixin _$SliderIdList {
  bool? get status => throw _privateConstructorUsedError;
  SliderId get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SliderIdListCopyWith<SliderIdList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SliderIdListCopyWith<$Res> {
  factory $SliderIdListCopyWith(
          SliderIdList value, $Res Function(SliderIdList) then) =
      _$SliderIdListCopyWithImpl<$Res, SliderIdList>;
  @useResult
  $Res call({bool? status, SliderId data});

  $SliderIdCopyWith<$Res> get data;
}

/// @nodoc
class _$SliderIdListCopyWithImpl<$Res, $Val extends SliderIdList>
    implements $SliderIdListCopyWith<$Res> {
  _$SliderIdListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as SliderId,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SliderIdCopyWith<$Res> get data {
    return $SliderIdCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SliderIdListImplCopyWith<$Res>
    implements $SliderIdListCopyWith<$Res> {
  factory _$$SliderIdListImplCopyWith(
          _$SliderIdListImpl value, $Res Function(_$SliderIdListImpl) then) =
      __$$SliderIdListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? status, SliderId data});

  @override
  $SliderIdCopyWith<$Res> get data;
}

/// @nodoc
class __$$SliderIdListImplCopyWithImpl<$Res>
    extends _$SliderIdListCopyWithImpl<$Res, _$SliderIdListImpl>
    implements _$$SliderIdListImplCopyWith<$Res> {
  __$$SliderIdListImplCopyWithImpl(
      _$SliderIdListImpl _value, $Res Function(_$SliderIdListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? data = null,
  }) {
    return _then(_$SliderIdListImpl(
      freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
      null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as SliderId,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SliderIdListImpl implements _SliderIdList {
  const _$SliderIdListImpl(this.status, this.data);

  factory _$SliderIdListImpl.fromJson(Map<String, dynamic> json) =>
      _$$SliderIdListImplFromJson(json);

  @override
  final bool? status;
  @override
  final SliderId data;

  @override
  String toString() {
    return 'SliderIdList(status: $status, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SliderIdListImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SliderIdListImplCopyWith<_$SliderIdListImpl> get copyWith =>
      __$$SliderIdListImplCopyWithImpl<_$SliderIdListImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SliderIdListImplToJson(
      this,
    );
  }
}

abstract class _SliderIdList implements SliderIdList {
  const factory _SliderIdList(final bool? status, final SliderId data) =
      _$SliderIdListImpl;

  factory _SliderIdList.fromJson(Map<String, dynamic> json) =
      _$SliderIdListImpl.fromJson;

  @override
  bool? get status;
  @override
  SliderId get data;
  @override
  @JsonKey(ignore: true)
  _$$SliderIdListImplCopyWith<_$SliderIdListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
