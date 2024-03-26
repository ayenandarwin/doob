// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'artistList.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ArtistList _$ArtistListFromJson(Map<String, dynamic> json) {
  return _ArtistList.fromJson(json);
}

/// @nodoc
mixin _$ArtistList {
  bool? get status => throw _privateConstructorUsedError;
  List<Artist>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ArtistListCopyWith<ArtistList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArtistListCopyWith<$Res> {
  factory $ArtistListCopyWith(
          ArtistList value, $Res Function(ArtistList) then) =
      _$ArtistListCopyWithImpl<$Res, ArtistList>;
  @useResult
  $Res call({bool? status, List<Artist>? data});
}

/// @nodoc
class _$ArtistListCopyWithImpl<$Res, $Val extends ArtistList>
    implements $ArtistListCopyWith<$Res> {
  _$ArtistListCopyWithImpl(this._value, this._then);

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
              as List<Artist>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ArtistListImplCopyWith<$Res>
    implements $ArtistListCopyWith<$Res> {
  factory _$$ArtistListImplCopyWith(
          _$ArtistListImpl value, $Res Function(_$ArtistListImpl) then) =
      __$$ArtistListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? status, List<Artist>? data});
}

/// @nodoc
class __$$ArtistListImplCopyWithImpl<$Res>
    extends _$ArtistListCopyWithImpl<$Res, _$ArtistListImpl>
    implements _$$ArtistListImplCopyWith<$Res> {
  __$$ArtistListImplCopyWithImpl(
      _$ArtistListImpl _value, $Res Function(_$ArtistListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? data = freezed,
  }) {
    return _then(_$ArtistListImpl(
      freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
      freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Artist>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ArtistListImpl implements _ArtistList {
  const _$ArtistListImpl(this.status, final List<Artist>? data) : _data = data;

  factory _$ArtistListImpl.fromJson(Map<String, dynamic> json) =>
      _$$ArtistListImplFromJson(json);

  @override
  final bool? status;
  final List<Artist>? _data;
  @override
  List<Artist>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ArtistList(status: $status, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ArtistListImpl &&
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
  _$$ArtistListImplCopyWith<_$ArtistListImpl> get copyWith =>
      __$$ArtistListImplCopyWithImpl<_$ArtistListImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ArtistListImplToJson(
      this,
    );
  }
}

abstract class _ArtistList implements ArtistList {
  const factory _ArtistList(final bool? status, final List<Artist>? data) =
      _$ArtistListImpl;

  factory _ArtistList.fromJson(Map<String, dynamic> json) =
      _$ArtistListImpl.fromJson;

  @override
  bool? get status;
  @override
  List<Artist>? get data;
  @override
  @JsonKey(ignore: true)
  _$$ArtistListImplCopyWith<_$ArtistListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
