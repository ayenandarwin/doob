// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'songlist.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SongList _$SongListFromJson(Map<String, dynamic> json) {
  return _SongList.fromJson(json);
}

/// @nodoc
mixin _$SongList {
  bool? get status => throw _privateConstructorUsedError;
  List<Song>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SongListCopyWith<SongList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SongListCopyWith<$Res> {
  factory $SongListCopyWith(SongList value, $Res Function(SongList) then) =
      _$SongListCopyWithImpl<$Res, SongList>;
  @useResult
  $Res call({bool? status, List<Song>? data});
}

/// @nodoc
class _$SongListCopyWithImpl<$Res, $Val extends SongList>
    implements $SongListCopyWith<$Res> {
  _$SongListCopyWithImpl(this._value, this._then);

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
              as List<Song>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SongListImplCopyWith<$Res>
    implements $SongListCopyWith<$Res> {
  factory _$$SongListImplCopyWith(
          _$SongListImpl value, $Res Function(_$SongListImpl) then) =
      __$$SongListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? status, List<Song>? data});
}

/// @nodoc
class __$$SongListImplCopyWithImpl<$Res>
    extends _$SongListCopyWithImpl<$Res, _$SongListImpl>
    implements _$$SongListImplCopyWith<$Res> {
  __$$SongListImplCopyWithImpl(
      _$SongListImpl _value, $Res Function(_$SongListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? data = freezed,
  }) {
    return _then(_$SongListImpl(
      freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
      freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Song>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SongListImpl implements _SongList {
  const _$SongListImpl(this.status, final List<Song>? data) : _data = data;

  factory _$SongListImpl.fromJson(Map<String, dynamic> json) =>
      _$$SongListImplFromJson(json);

  @override
  final bool? status;
  final List<Song>? _data;
  @override
  List<Song>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'SongList(status: $status, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SongListImpl &&
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
  _$$SongListImplCopyWith<_$SongListImpl> get copyWith =>
      __$$SongListImplCopyWithImpl<_$SongListImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SongListImplToJson(
      this,
    );
  }
}

abstract class _SongList implements SongList {
  const factory _SongList(final bool? status, final List<Song>? data) =
      _$SongListImpl;

  factory _SongList.fromJson(Map<String, dynamic> json) =
      _$SongListImpl.fromJson;

  @override
  bool? get status;
  @override
  List<Song>? get data;
  @override
  @JsonKey(ignore: true)
  _$$SongListImplCopyWith<_$SongListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
