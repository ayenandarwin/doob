// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'followartistsonglist.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FollowArtistSongList _$FollowArtistSongListFromJson(Map<String, dynamic> json) {
  return _FollowArtistSongList.fromJson(json);
}

/// @nodoc
mixin _$FollowArtistSongList {
  bool? get status => throw _privateConstructorUsedError;
  List<FollowArtistSong>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FollowArtistSongListCopyWith<FollowArtistSongList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FollowArtistSongListCopyWith<$Res> {
  factory $FollowArtistSongListCopyWith(FollowArtistSongList value,
          $Res Function(FollowArtistSongList) then) =
      _$FollowArtistSongListCopyWithImpl<$Res, FollowArtistSongList>;
  @useResult
  $Res call({bool? status, List<FollowArtistSong>? data});
}

/// @nodoc
class _$FollowArtistSongListCopyWithImpl<$Res,
        $Val extends FollowArtistSongList>
    implements $FollowArtistSongListCopyWith<$Res> {
  _$FollowArtistSongListCopyWithImpl(this._value, this._then);

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
              as List<FollowArtistSong>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FollowArtistSongListImplCopyWith<$Res>
    implements $FollowArtistSongListCopyWith<$Res> {
  factory _$$FollowArtistSongListImplCopyWith(_$FollowArtistSongListImpl value,
          $Res Function(_$FollowArtistSongListImpl) then) =
      __$$FollowArtistSongListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? status, List<FollowArtistSong>? data});
}

/// @nodoc
class __$$FollowArtistSongListImplCopyWithImpl<$Res>
    extends _$FollowArtistSongListCopyWithImpl<$Res, _$FollowArtistSongListImpl>
    implements _$$FollowArtistSongListImplCopyWith<$Res> {
  __$$FollowArtistSongListImplCopyWithImpl(_$FollowArtistSongListImpl _value,
      $Res Function(_$FollowArtistSongListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? data = freezed,
  }) {
    return _then(_$FollowArtistSongListImpl(
      freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
      freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<FollowArtistSong>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FollowArtistSongListImpl implements _FollowArtistSongList {
  const _$FollowArtistSongListImpl(
      this.status, final List<FollowArtistSong>? data)
      : _data = data;

  factory _$FollowArtistSongListImpl.fromJson(Map<String, dynamic> json) =>
      _$$FollowArtistSongListImplFromJson(json);

  @override
  final bool? status;
  final List<FollowArtistSong>? _data;
  @override
  List<FollowArtistSong>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'FollowArtistSongList(status: $status, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FollowArtistSongListImpl &&
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
  _$$FollowArtistSongListImplCopyWith<_$FollowArtistSongListImpl>
      get copyWith =>
          __$$FollowArtistSongListImplCopyWithImpl<_$FollowArtistSongListImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FollowArtistSongListImplToJson(
      this,
    );
  }
}

abstract class _FollowArtistSongList implements FollowArtistSongList {
  const factory _FollowArtistSongList(
          final bool? status, final List<FollowArtistSong>? data) =
      _$FollowArtistSongListImpl;

  factory _FollowArtistSongList.fromJson(Map<String, dynamic> json) =
      _$FollowArtistSongListImpl.fromJson;

  @override
  bool? get status;
  @override
  List<FollowArtistSong>? get data;
  @override
  @JsonKey(ignore: true)
  _$$FollowArtistSongListImplCopyWith<_$FollowArtistSongListImpl>
      get copyWith => throw _privateConstructorUsedError;
}
