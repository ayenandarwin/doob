// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customerfollowlist.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CustomerFollowList _$CustomerFollowListFromJson(Map<String, dynamic> json) {
  return _CustomerFollowList.fromJson(json);
}

/// @nodoc
mixin _$CustomerFollowList {
  bool? get status => throw _privateConstructorUsedError;
  List<CustomerFollow>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CustomerFollowListCopyWith<CustomerFollowList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerFollowListCopyWith<$Res> {
  factory $CustomerFollowListCopyWith(
          CustomerFollowList value, $Res Function(CustomerFollowList) then) =
      _$CustomerFollowListCopyWithImpl<$Res, CustomerFollowList>;
  @useResult
  $Res call({bool? status, List<CustomerFollow>? data});
}

/// @nodoc
class _$CustomerFollowListCopyWithImpl<$Res, $Val extends CustomerFollowList>
    implements $CustomerFollowListCopyWith<$Res> {
  _$CustomerFollowListCopyWithImpl(this._value, this._then);

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
              as List<CustomerFollow>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CustomerFollowListImplCopyWith<$Res>
    implements $CustomerFollowListCopyWith<$Res> {
  factory _$$CustomerFollowListImplCopyWith(_$CustomerFollowListImpl value,
          $Res Function(_$CustomerFollowListImpl) then) =
      __$$CustomerFollowListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? status, List<CustomerFollow>? data});
}

/// @nodoc
class __$$CustomerFollowListImplCopyWithImpl<$Res>
    extends _$CustomerFollowListCopyWithImpl<$Res, _$CustomerFollowListImpl>
    implements _$$CustomerFollowListImplCopyWith<$Res> {
  __$$CustomerFollowListImplCopyWithImpl(_$CustomerFollowListImpl _value,
      $Res Function(_$CustomerFollowListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? data = freezed,
  }) {
    return _then(_$CustomerFollowListImpl(
      freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
      freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<CustomerFollow>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomerFollowListImpl implements _CustomerFollowList {
  const _$CustomerFollowListImpl(this.status, final List<CustomerFollow>? data)
      : _data = data;

  factory _$CustomerFollowListImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomerFollowListImplFromJson(json);

  @override
  final bool? status;
  final List<CustomerFollow>? _data;
  @override
  List<CustomerFollow>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'CustomerFollowList(status: $status, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerFollowListImpl &&
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
  _$$CustomerFollowListImplCopyWith<_$CustomerFollowListImpl> get copyWith =>
      __$$CustomerFollowListImplCopyWithImpl<_$CustomerFollowListImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomerFollowListImplToJson(
      this,
    );
  }
}

abstract class _CustomerFollowList implements CustomerFollowList {
  const factory _CustomerFollowList(
          final bool? status, final List<CustomerFollow>? data) =
      _$CustomerFollowListImpl;

  factory _CustomerFollowList.fromJson(Map<String, dynamic> json) =
      _$CustomerFollowListImpl.fromJson;

  @override
  bool? get status;
  @override
  List<CustomerFollow>? get data;
  @override
  @JsonKey(ignore: true)
  _$$CustomerFollowListImplCopyWith<_$CustomerFollowListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
