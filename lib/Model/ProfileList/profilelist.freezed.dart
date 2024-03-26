// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profilelist.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProfileLists _$ProfileListsFromJson(Map<String, dynamic> json) {
  return _ProfileLists.fromJson(json);
}

/// @nodoc
mixin _$ProfileLists {
  bool? get status => throw _privateConstructorUsedError;
  Profile? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProfileListsCopyWith<ProfileLists> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileListsCopyWith<$Res> {
  factory $ProfileListsCopyWith(
          ProfileLists value, $Res Function(ProfileLists) then) =
      _$ProfileListsCopyWithImpl<$Res, ProfileLists>;
  @useResult
  $Res call({bool? status, Profile? data});

  $ProfileCopyWith<$Res>? get data;
}

/// @nodoc
class _$ProfileListsCopyWithImpl<$Res, $Val extends ProfileLists>
    implements $ProfileListsCopyWith<$Res> {
  _$ProfileListsCopyWithImpl(this._value, this._then);

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
              as Profile?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProfileCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $ProfileCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProfileListsImplCopyWith<$Res>
    implements $ProfileListsCopyWith<$Res> {
  factory _$$ProfileListsImplCopyWith(
          _$ProfileListsImpl value, $Res Function(_$ProfileListsImpl) then) =
      __$$ProfileListsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? status, Profile? data});

  @override
  $ProfileCopyWith<$Res>? get data;
}

/// @nodoc
class __$$ProfileListsImplCopyWithImpl<$Res>
    extends _$ProfileListsCopyWithImpl<$Res, _$ProfileListsImpl>
    implements _$$ProfileListsImplCopyWith<$Res> {
  __$$ProfileListsImplCopyWithImpl(
      _$ProfileListsImpl _value, $Res Function(_$ProfileListsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? data = freezed,
  }) {
    return _then(_$ProfileListsImpl(
      freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Profile?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProfileListsImpl implements _ProfileLists {
  const _$ProfileListsImpl(this.status, this.data);

  factory _$ProfileListsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProfileListsImplFromJson(json);

  @override
  final bool? status;
  @override
  final Profile? data;

  @override
  String toString() {
    return 'ProfileLists(status: $status, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileListsImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileListsImplCopyWith<_$ProfileListsImpl> get copyWith =>
      __$$ProfileListsImplCopyWithImpl<_$ProfileListsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProfileListsImplToJson(
      this,
    );
  }
}

abstract class _ProfileLists implements ProfileLists {
  const factory _ProfileLists(final bool? status, final Profile? data) =
      _$ProfileListsImpl;

  factory _ProfileLists.fromJson(Map<String, dynamic> json) =
      _$ProfileListsImpl.fromJson;

  @override
  bool? get status;
  @override
  Profile? get data;
  @override
  @JsonKey(ignore: true)
  _$$ProfileListsImplCopyWith<_$ProfileListsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
