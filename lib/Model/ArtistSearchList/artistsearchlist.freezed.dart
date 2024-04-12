// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'artistsearchlist.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ArtistSearchList _$ArtistSearchListFromJson(Map<String, dynamic> json) {
  return _ArtistSearchList.fromJson(json);
}

/// @nodoc
mixin _$ArtistSearchList {
  bool? get status => throw _privateConstructorUsedError;
  List<ArtistSearch>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ArtistSearchListCopyWith<ArtistSearchList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArtistSearchListCopyWith<$Res> {
  factory $ArtistSearchListCopyWith(
          ArtistSearchList value, $Res Function(ArtistSearchList) then) =
      _$ArtistSearchListCopyWithImpl<$Res, ArtistSearchList>;
  @useResult
  $Res call({bool? status, List<ArtistSearch>? data});
}

/// @nodoc
class _$ArtistSearchListCopyWithImpl<$Res, $Val extends ArtistSearchList>
    implements $ArtistSearchListCopyWith<$Res> {
  _$ArtistSearchListCopyWithImpl(this._value, this._then);

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
              as List<ArtistSearch>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ArtistSearchListImplCopyWith<$Res>
    implements $ArtistSearchListCopyWith<$Res> {
  factory _$$ArtistSearchListImplCopyWith(_$ArtistSearchListImpl value,
          $Res Function(_$ArtistSearchListImpl) then) =
      __$$ArtistSearchListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? status, List<ArtistSearch>? data});
}

/// @nodoc
class __$$ArtistSearchListImplCopyWithImpl<$Res>
    extends _$ArtistSearchListCopyWithImpl<$Res, _$ArtistSearchListImpl>
    implements _$$ArtistSearchListImplCopyWith<$Res> {
  __$$ArtistSearchListImplCopyWithImpl(_$ArtistSearchListImpl _value,
      $Res Function(_$ArtistSearchListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? data = freezed,
  }) {
    return _then(_$ArtistSearchListImpl(
      freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
      freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<ArtistSearch>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ArtistSearchListImpl implements _ArtistSearchList {
  const _$ArtistSearchListImpl(this.status, final List<ArtistSearch>? data)
      : _data = data;

  factory _$ArtistSearchListImpl.fromJson(Map<String, dynamic> json) =>
      _$$ArtistSearchListImplFromJson(json);

  @override
  final bool? status;
  final List<ArtistSearch>? _data;
  @override
  List<ArtistSearch>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ArtistSearchList(status: $status, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ArtistSearchListImpl &&
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
  _$$ArtistSearchListImplCopyWith<_$ArtistSearchListImpl> get copyWith =>
      __$$ArtistSearchListImplCopyWithImpl<_$ArtistSearchListImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ArtistSearchListImplToJson(
      this,
    );
  }
}

abstract class _ArtistSearchList implements ArtistSearchList {
  const factory _ArtistSearchList(
          final bool? status, final List<ArtistSearch>? data) =
      _$ArtistSearchListImpl;

  factory _ArtistSearchList.fromJson(Map<String, dynamic> json) =
      _$ArtistSearchListImpl.fromJson;

  @override
  bool? get status;
  @override
  List<ArtistSearch>? get data;
  @override
  @JsonKey(ignore: true)
  _$$ArtistSearchListImplCopyWith<_$ArtistSearchListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
