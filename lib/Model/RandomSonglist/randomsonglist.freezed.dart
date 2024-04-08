// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'randomsonglist.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RandomSongList _$RandomSongListFromJson(Map<String, dynamic> json) {
  return _RandomSongList.fromJson(json);
}

/// @nodoc
mixin _$RandomSongList {
  bool? get status => throw _privateConstructorUsedError;
  List<RandomSong>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RandomSongListCopyWith<RandomSongList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RandomSongListCopyWith<$Res> {
  factory $RandomSongListCopyWith(
          RandomSongList value, $Res Function(RandomSongList) then) =
      _$RandomSongListCopyWithImpl<$Res, RandomSongList>;
  @useResult
  $Res call({bool? status, List<RandomSong>? data});
}

/// @nodoc
class _$RandomSongListCopyWithImpl<$Res, $Val extends RandomSongList>
    implements $RandomSongListCopyWith<$Res> {
  _$RandomSongListCopyWithImpl(this._value, this._then);

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
              as List<RandomSong>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RandomSongListImplCopyWith<$Res>
    implements $RandomSongListCopyWith<$Res> {
  factory _$$RandomSongListImplCopyWith(_$RandomSongListImpl value,
          $Res Function(_$RandomSongListImpl) then) =
      __$$RandomSongListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? status, List<RandomSong>? data});
}

/// @nodoc
class __$$RandomSongListImplCopyWithImpl<$Res>
    extends _$RandomSongListCopyWithImpl<$Res, _$RandomSongListImpl>
    implements _$$RandomSongListImplCopyWith<$Res> {
  __$$RandomSongListImplCopyWithImpl(
      _$RandomSongListImpl _value, $Res Function(_$RandomSongListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? data = freezed,
  }) {
    return _then(_$RandomSongListImpl(
      freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
      freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<RandomSong>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RandomSongListImpl implements _RandomSongList {
  const _$RandomSongListImpl(this.status, final List<RandomSong>? data)
      : _data = data;

  factory _$RandomSongListImpl.fromJson(Map<String, dynamic> json) =>
      _$$RandomSongListImplFromJson(json);

  @override
  final bool? status;
  final List<RandomSong>? _data;
  @override
  List<RandomSong>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'RandomSongList(status: $status, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RandomSongListImpl &&
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
  _$$RandomSongListImplCopyWith<_$RandomSongListImpl> get copyWith =>
      __$$RandomSongListImplCopyWithImpl<_$RandomSongListImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RandomSongListImplToJson(
      this,
    );
  }
}

abstract class _RandomSongList implements RandomSongList {
  const factory _RandomSongList(
      final bool? status, final List<RandomSong>? data) = _$RandomSongListImpl;

  factory _RandomSongList.fromJson(Map<String, dynamic> json) =
      _$RandomSongListImpl.fromJson;

  @override
  bool? get status;
  @override
  List<RandomSong>? get data;
  @override
  @JsonKey(ignore: true)
  _$$RandomSongListImplCopyWith<_$RandomSongListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
