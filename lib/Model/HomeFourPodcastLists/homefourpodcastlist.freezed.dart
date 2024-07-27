// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'homefourpodcastlist.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

HomeFourPodcastList _$HomeFourPodcastListFromJson(Map<String, dynamic> json) {
  return _HomeFourPodcastList.fromJson(json);
}

/// @nodoc
mixin _$HomeFourPodcastList {
  bool? get status => throw _privateConstructorUsedError;
  List<HomeFourSongs>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HomeFourPodcastListCopyWith<HomeFourPodcastList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeFourPodcastListCopyWith<$Res> {
  factory $HomeFourPodcastListCopyWith(
          HomeFourPodcastList value, $Res Function(HomeFourPodcastList) then) =
      _$HomeFourPodcastListCopyWithImpl<$Res, HomeFourPodcastList>;
  @useResult
  $Res call({bool? status, List<HomeFourSongs>? data});
}

/// @nodoc
class _$HomeFourPodcastListCopyWithImpl<$Res, $Val extends HomeFourPodcastList>
    implements $HomeFourPodcastListCopyWith<$Res> {
  _$HomeFourPodcastListCopyWithImpl(this._value, this._then);

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
abstract class _$$HomeFourPodcastListImplCopyWith<$Res>
    implements $HomeFourPodcastListCopyWith<$Res> {
  factory _$$HomeFourPodcastListImplCopyWith(_$HomeFourPodcastListImpl value,
          $Res Function(_$HomeFourPodcastListImpl) then) =
      __$$HomeFourPodcastListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? status, List<HomeFourSongs>? data});
}

/// @nodoc
class __$$HomeFourPodcastListImplCopyWithImpl<$Res>
    extends _$HomeFourPodcastListCopyWithImpl<$Res, _$HomeFourPodcastListImpl>
    implements _$$HomeFourPodcastListImplCopyWith<$Res> {
  __$$HomeFourPodcastListImplCopyWithImpl(_$HomeFourPodcastListImpl _value,
      $Res Function(_$HomeFourPodcastListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? data = freezed,
  }) {
    return _then(_$HomeFourPodcastListImpl(
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
class _$HomeFourPodcastListImpl implements _HomeFourPodcastList {
  const _$HomeFourPodcastListImpl(this.status, final List<HomeFourSongs>? data)
      : _data = data;

  factory _$HomeFourPodcastListImpl.fromJson(Map<String, dynamic> json) =>
      _$$HomeFourPodcastListImplFromJson(json);

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
    return 'HomeFourPodcastList(status: $status, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeFourPodcastListImpl &&
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
  _$$HomeFourPodcastListImplCopyWith<_$HomeFourPodcastListImpl> get copyWith =>
      __$$HomeFourPodcastListImplCopyWithImpl<_$HomeFourPodcastListImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HomeFourPodcastListImplToJson(
      this,
    );
  }
}

abstract class _HomeFourPodcastList implements HomeFourPodcastList {
  const factory _HomeFourPodcastList(
          final bool? status, final List<HomeFourSongs>? data) =
      _$HomeFourPodcastListImpl;

  factory _HomeFourPodcastList.fromJson(Map<String, dynamic> json) =
      _$HomeFourPodcastListImpl.fromJson;

  @override
  bool? get status;
  @override
  List<HomeFourSongs>? get data;
  @override
  @JsonKey(ignore: true)
  _$$HomeFourPodcastListImplCopyWith<_$HomeFourPodcastListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
