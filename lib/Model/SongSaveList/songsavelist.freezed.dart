// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'songsavelist.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SongSaveList _$SongSaveListFromJson(Map<String, dynamic> json) {
  return _SongSaveList.fromJson(json);
}

/// @nodoc
mixin _$SongSaveList {
  bool? get status => throw _privateConstructorUsedError;
  List<SongSave>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SongSaveListCopyWith<SongSaveList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SongSaveListCopyWith<$Res> {
  factory $SongSaveListCopyWith(
          SongSaveList value, $Res Function(SongSaveList) then) =
      _$SongSaveListCopyWithImpl<$Res, SongSaveList>;
  @useResult
  $Res call({bool? status, List<SongSave>? data});
}

/// @nodoc
class _$SongSaveListCopyWithImpl<$Res, $Val extends SongSaveList>
    implements $SongSaveListCopyWith<$Res> {
  _$SongSaveListCopyWithImpl(this._value, this._then);

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
              as List<SongSave>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SongSaveListImplCopyWith<$Res>
    implements $SongSaveListCopyWith<$Res> {
  factory _$$SongSaveListImplCopyWith(
          _$SongSaveListImpl value, $Res Function(_$SongSaveListImpl) then) =
      __$$SongSaveListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? status, List<SongSave>? data});
}

/// @nodoc
class __$$SongSaveListImplCopyWithImpl<$Res>
    extends _$SongSaveListCopyWithImpl<$Res, _$SongSaveListImpl>
    implements _$$SongSaveListImplCopyWith<$Res> {
  __$$SongSaveListImplCopyWithImpl(
      _$SongSaveListImpl _value, $Res Function(_$SongSaveListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? data = freezed,
  }) {
    return _then(_$SongSaveListImpl(
      freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
      freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<SongSave>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SongSaveListImpl implements _SongSaveList {
  const _$SongSaveListImpl(this.status, final List<SongSave>? data)
      : _data = data;

  factory _$SongSaveListImpl.fromJson(Map<String, dynamic> json) =>
      _$$SongSaveListImplFromJson(json);

  @override
  final bool? status;
  final List<SongSave>? _data;
  @override
  List<SongSave>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'SongSaveList(status: $status, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SongSaveListImpl &&
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
  _$$SongSaveListImplCopyWith<_$SongSaveListImpl> get copyWith =>
      __$$SongSaveListImplCopyWithImpl<_$SongSaveListImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SongSaveListImplToJson(
      this,
    );
  }
}

abstract class _SongSaveList implements SongSaveList {
  const factory _SongSaveList(final bool? status, final List<SongSave>? data) =
      _$SongSaveListImpl;

  factory _SongSaveList.fromJson(Map<String, dynamic> json) =
      _$SongSaveListImpl.fromJson;

  @override
  bool? get status;
  @override
  List<SongSave>? get data;
  @override
  @JsonKey(ignore: true)
  _$$SongSaveListImplCopyWith<_$SongSaveListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
