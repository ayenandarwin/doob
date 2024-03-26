// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'songidlist.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SongIdList _$SongIdListFromJson(Map<String, dynamic> json) {
  return _SongIdList.fromJson(json);
}

/// @nodoc
mixin _$SongIdList {
  bool? get status => throw _privateConstructorUsedError;
  SongId? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SongIdListCopyWith<SongIdList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SongIdListCopyWith<$Res> {
  factory $SongIdListCopyWith(
          SongIdList value, $Res Function(SongIdList) then) =
      _$SongIdListCopyWithImpl<$Res, SongIdList>;
  @useResult
  $Res call({bool? status, SongId? data});

  $SongIdCopyWith<$Res>? get data;
}

/// @nodoc
class _$SongIdListCopyWithImpl<$Res, $Val extends SongIdList>
    implements $SongIdListCopyWith<$Res> {
  _$SongIdListCopyWithImpl(this._value, this._then);

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
              as SongId?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SongIdCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $SongIdCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SongIdListImplCopyWith<$Res>
    implements $SongIdListCopyWith<$Res> {
  factory _$$SongIdListImplCopyWith(
          _$SongIdListImpl value, $Res Function(_$SongIdListImpl) then) =
      __$$SongIdListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? status, SongId? data});

  @override
  $SongIdCopyWith<$Res>? get data;
}

/// @nodoc
class __$$SongIdListImplCopyWithImpl<$Res>
    extends _$SongIdListCopyWithImpl<$Res, _$SongIdListImpl>
    implements _$$SongIdListImplCopyWith<$Res> {
  __$$SongIdListImplCopyWithImpl(
      _$SongIdListImpl _value, $Res Function(_$SongIdListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? data = freezed,
  }) {
    return _then(_$SongIdListImpl(
      freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as SongId?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SongIdListImpl implements _SongIdList {
  const _$SongIdListImpl(this.status, this.data);

  factory _$SongIdListImpl.fromJson(Map<String, dynamic> json) =>
      _$$SongIdListImplFromJson(json);

  @override
  final bool? status;
  @override
  final SongId? data;

  @override
  String toString() {
    return 'SongIdList(status: $status, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SongIdListImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SongIdListImplCopyWith<_$SongIdListImpl> get copyWith =>
      __$$SongIdListImplCopyWithImpl<_$SongIdListImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SongIdListImplToJson(
      this,
    );
  }
}

abstract class _SongIdList implements SongIdList {
  const factory _SongIdList(final bool? status, final SongId? data) =
      _$SongIdListImpl;

  factory _SongIdList.fromJson(Map<String, dynamic> json) =
      _$SongIdListImpl.fromJson;

  @override
  bool? get status;
  @override
  SongId? get data;
  @override
  @JsonKey(ignore: true)
  _$$SongIdListImplCopyWith<_$SongIdListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
