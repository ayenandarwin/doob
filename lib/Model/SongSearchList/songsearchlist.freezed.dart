// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'songsearchlist.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SongSearchList _$SongSearchListFromJson(Map<String, dynamic> json) {
  return _SongSearchList.fromJson(json);
}

/// @nodoc
mixin _$SongSearchList {
  bool? get status => throw _privateConstructorUsedError;
  List<SongSearch>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SongSearchListCopyWith<SongSearchList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SongSearchListCopyWith<$Res> {
  factory $SongSearchListCopyWith(
          SongSearchList value, $Res Function(SongSearchList) then) =
      _$SongSearchListCopyWithImpl<$Res, SongSearchList>;
  @useResult
  $Res call({bool? status, List<SongSearch>? data});
}

/// @nodoc
class _$SongSearchListCopyWithImpl<$Res, $Val extends SongSearchList>
    implements $SongSearchListCopyWith<$Res> {
  _$SongSearchListCopyWithImpl(this._value, this._then);

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
              as List<SongSearch>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SongSearchListImplCopyWith<$Res>
    implements $SongSearchListCopyWith<$Res> {
  factory _$$SongSearchListImplCopyWith(_$SongSearchListImpl value,
          $Res Function(_$SongSearchListImpl) then) =
      __$$SongSearchListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? status, List<SongSearch>? data});
}

/// @nodoc
class __$$SongSearchListImplCopyWithImpl<$Res>
    extends _$SongSearchListCopyWithImpl<$Res, _$SongSearchListImpl>
    implements _$$SongSearchListImplCopyWith<$Res> {
  __$$SongSearchListImplCopyWithImpl(
      _$SongSearchListImpl _value, $Res Function(_$SongSearchListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? data = freezed,
  }) {
    return _then(_$SongSearchListImpl(
      freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
      freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<SongSearch>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SongSearchListImpl implements _SongSearchList {
  const _$SongSearchListImpl(this.status, final List<SongSearch>? data)
      : _data = data;

  factory _$SongSearchListImpl.fromJson(Map<String, dynamic> json) =>
      _$$SongSearchListImplFromJson(json);

  @override
  final bool? status;
  final List<SongSearch>? _data;
  @override
  List<SongSearch>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'SongSearchList(status: $status, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SongSearchListImpl &&
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
  _$$SongSearchListImplCopyWith<_$SongSearchListImpl> get copyWith =>
      __$$SongSearchListImplCopyWithImpl<_$SongSearchListImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SongSearchListImplToJson(
      this,
    );
  }
}

abstract class _SongSearchList implements SongSearchList {
  const factory _SongSearchList(
      final bool? status, final List<SongSearch>? data) = _$SongSearchListImpl;

  factory _SongSearchList.fromJson(Map<String, dynamic> json) =
      _$SongSearchListImpl.fromJson;

  @override
  bool? get status;
  @override
  List<SongSearch>? get data;
  @override
  @JsonKey(ignore: true)
  _$$SongSearchListImplCopyWith<_$SongSearchListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
