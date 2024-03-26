// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sliderlist.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SliderList _$SliderListFromJson(Map<String, dynamic> json) {
  return _SliderList.fromJson(json);
}

/// @nodoc
mixin _$SliderList {
  bool? get status => throw _privateConstructorUsedError;
  List<Slider>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SliderListCopyWith<SliderList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SliderListCopyWith<$Res> {
  factory $SliderListCopyWith(
          SliderList value, $Res Function(SliderList) then) =
      _$SliderListCopyWithImpl<$Res, SliderList>;
  @useResult
  $Res call({bool? status, List<Slider>? data});
}

/// @nodoc
class _$SliderListCopyWithImpl<$Res, $Val extends SliderList>
    implements $SliderListCopyWith<$Res> {
  _$SliderListCopyWithImpl(this._value, this._then);

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
              as List<Slider>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SliderListImplCopyWith<$Res>
    implements $SliderListCopyWith<$Res> {
  factory _$$SliderListImplCopyWith(
          _$SliderListImpl value, $Res Function(_$SliderListImpl) then) =
      __$$SliderListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? status, List<Slider>? data});
}

/// @nodoc
class __$$SliderListImplCopyWithImpl<$Res>
    extends _$SliderListCopyWithImpl<$Res, _$SliderListImpl>
    implements _$$SliderListImplCopyWith<$Res> {
  __$$SliderListImplCopyWithImpl(
      _$SliderListImpl _value, $Res Function(_$SliderListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? data = freezed,
  }) {
    return _then(_$SliderListImpl(
      freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
      freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Slider>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SliderListImpl implements _SliderList {
  const _$SliderListImpl(this.status, final List<Slider>? data) : _data = data;

  factory _$SliderListImpl.fromJson(Map<String, dynamic> json) =>
      _$$SliderListImplFromJson(json);

  @override
  final bool? status;
  final List<Slider>? _data;
  @override
  List<Slider>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'SliderList(status: $status, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SliderListImpl &&
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
  _$$SliderListImplCopyWith<_$SliderListImpl> get copyWith =>
      __$$SliderListImplCopyWithImpl<_$SliderListImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SliderListImplToJson(
      this,
    );
  }
}

abstract class _SliderList implements SliderList {
  const factory _SliderList(final bool? status, final List<Slider>? data) =
      _$SliderListImpl;

  factory _SliderList.fromJson(Map<String, dynamic> json) =
      _$SliderListImpl.fromJson;

  @override
  bool? get status;
  @override
  List<Slider>? get data;
  @override
  @JsonKey(ignore: true)
  _$$SliderListImplCopyWith<_$SliderListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
