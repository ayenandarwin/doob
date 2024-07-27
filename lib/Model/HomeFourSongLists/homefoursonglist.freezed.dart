// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'homefoursonglist.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

HomeFourSongList _$HomeFourSongListFromJson(Map<String, dynamic> json) {
  return _HomeFourSongList.fromJson(json);
}

/// @nodoc
mixin _$HomeFourSongList {
  bool? get status => throw _privateConstructorUsedError;
  List<HomeFourSongs>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HomeFourSongListCopyWith<HomeFourSongList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeFourSongListCopyWith<$Res> {
  factory $HomeFourSongListCopyWith(
          HomeFourSongList value, $Res Function(HomeFourSongList) then) =
      _$HomeFourSongListCopyWithImpl<$Res, HomeFourSongList>;
  @useResult
  $Res call({bool? status, List<HomeFourSongs>? data});
}

/// @nodoc
class _$HomeFourSongListCopyWithImpl<$Res, $Val extends HomeFourSongList>
    implements $HomeFourSongListCopyWith<$Res> {
  _$HomeFourSongListCopyWithImpl(this._value, this._then);

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
              as List<HomeFourSongs>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HomeFourSongListImplCopyWith<$Res>
    implements $HomeFourSongListCopyWith<$Res> {
  factory _$$HomeFourSongListImplCopyWith(_$HomeFourSongListImpl value,
          $Res Function(_$HomeFourSongListImpl) then) =
      __$$HomeFourSongListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? status, List<HomeFourSongs>? data});
}

/// @nodoc
class __$$HomeFourSongListImplCopyWithImpl<$Res>
    extends _$HomeFourSongListCopyWithImpl<$Res, _$HomeFourSongListImpl>
    implements _$$HomeFourSongListImplCopyWith<$Res> {
  __$$HomeFourSongListImplCopyWithImpl(_$HomeFourSongListImpl _value,
      $Res Function(_$HomeFourSongListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? data = freezed,
  }) {
    return _then(_$HomeFourSongListImpl(
      freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
      freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<HomeFourSongs>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HomeFourSongListImpl implements _HomeFourSongList {
  const _$HomeFourSongListImpl(this.status, final List<HomeFourSongs>? data)
      : _data = data;

  factory _$HomeFourSongListImpl.fromJson(Map<String, dynamic> json) =>
      _$$HomeFourSongListImplFromJson(json);

  @override
  final bool? status;
  final List<HomeFourSongs>? _data;
  @override
  List<HomeFourSongs>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'HomeFourSongList(status: $status, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeFourSongListImpl &&
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
  _$$HomeFourSongListImplCopyWith<_$HomeFourSongListImpl> get copyWith =>
      __$$HomeFourSongListImplCopyWithImpl<_$HomeFourSongListImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HomeFourSongListImplToJson(
      this,
    );
  }
}

abstract class _HomeFourSongList implements HomeFourSongList {
  const factory _HomeFourSongList(
          final bool? status, final List<HomeFourSongs>? data) =
      _$HomeFourSongListImpl;

  factory _HomeFourSongList.fromJson(Map<String, dynamic> json) =
      _$HomeFourSongListImpl.fromJson;

  @override
  bool? get status;
  @override
  List<HomeFourSongs>? get data;
  @override
  @JsonKey(ignore: true)
  _$$HomeFourSongListImplCopyWith<_$HomeFourSongListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
