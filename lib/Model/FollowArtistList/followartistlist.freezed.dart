// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'followartistlist.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FollowArtistList _$FollowArtistListFromJson(Map<String, dynamic> json) {
  return _FollowArtistList.fromJson(json);
}

/// @nodoc
mixin _$FollowArtistList {
  bool? get status => throw _privateConstructorUsedError;
  List<FollowArtist>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FollowArtistListCopyWith<FollowArtistList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FollowArtistListCopyWith<$Res> {
  factory $FollowArtistListCopyWith(
          FollowArtistList value, $Res Function(FollowArtistList) then) =
      _$FollowArtistListCopyWithImpl<$Res, FollowArtistList>;
  @useResult
  $Res call({bool? status, List<FollowArtist>? data});
}

/// @nodoc
class _$FollowArtistListCopyWithImpl<$Res, $Val extends FollowArtistList>
    implements $FollowArtistListCopyWith<$Res> {
  _$FollowArtistListCopyWithImpl(this._value, this._then);

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
              as List<FollowArtist>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FollowArtistListImplCopyWith<$Res>
    implements $FollowArtistListCopyWith<$Res> {
  factory _$$FollowArtistListImplCopyWith(_$FollowArtistListImpl value,
          $Res Function(_$FollowArtistListImpl) then) =
      __$$FollowArtistListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? status, List<FollowArtist>? data});
}

/// @nodoc
class __$$FollowArtistListImplCopyWithImpl<$Res>
    extends _$FollowArtistListCopyWithImpl<$Res, _$FollowArtistListImpl>
    implements _$$FollowArtistListImplCopyWith<$Res> {
  __$$FollowArtistListImplCopyWithImpl(_$FollowArtistListImpl _value,
      $Res Function(_$FollowArtistListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? data = freezed,
  }) {
    return _then(_$FollowArtistListImpl(
      freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
      freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<FollowArtist>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FollowArtistListImpl implements _FollowArtistList {
  const _$FollowArtistListImpl(this.status, final List<FollowArtist>? data)
      : _data = data;

  factory _$FollowArtistListImpl.fromJson(Map<String, dynamic> json) =>
      _$$FollowArtistListImplFromJson(json);

  @override
  final bool? status;
  final List<FollowArtist>? _data;
  @override
  List<FollowArtist>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'FollowArtistList(status: $status, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FollowArtistListImpl &&
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
  _$$FollowArtistListImplCopyWith<_$FollowArtistListImpl> get copyWith =>
      __$$FollowArtistListImplCopyWithImpl<_$FollowArtistListImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FollowArtistListImplToJson(
      this,
    );
  }
}

abstract class _FollowArtistList implements FollowArtistList {
  const factory _FollowArtistList(
          final bool? status, final List<FollowArtist>? data) =
      _$FollowArtistListImpl;

  factory _FollowArtistList.fromJson(Map<String, dynamic> json) =
      _$FollowArtistListImpl.fromJson;

  @override
  bool? get status;
  @override
  List<FollowArtist>? get data;
  @override
  @JsonKey(ignore: true)
  _$$FollowArtistListImplCopyWith<_$FollowArtistListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
