// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'artistidList.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ArtistIdLists _$ArtistIdListsFromJson(Map<String, dynamic> json) {
  return _ArtistIdLists.fromJson(json);
}

/// @nodoc
mixin _$ArtistIdLists {
  bool? get status => throw _privateConstructorUsedError;
  ArtistId? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ArtistIdListsCopyWith<ArtistIdLists> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArtistIdListsCopyWith<$Res> {
  factory $ArtistIdListsCopyWith(
          ArtistIdLists value, $Res Function(ArtistIdLists) then) =
      _$ArtistIdListsCopyWithImpl<$Res, ArtistIdLists>;
  @useResult
  $Res call({bool? status, ArtistId? data});

  $ArtistIdCopyWith<$Res>? get data;
}

/// @nodoc
class _$ArtistIdListsCopyWithImpl<$Res, $Val extends ArtistIdLists>
    implements $ArtistIdListsCopyWith<$Res> {
  _$ArtistIdListsCopyWithImpl(this._value, this._then);

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
              as ArtistId?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ArtistIdCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $ArtistIdCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ArtistIdListsImplCopyWith<$Res>
    implements $ArtistIdListsCopyWith<$Res> {
  factory _$$ArtistIdListsImplCopyWith(
          _$ArtistIdListsImpl value, $Res Function(_$ArtistIdListsImpl) then) =
      __$$ArtistIdListsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? status, ArtistId? data});

  @override
  $ArtistIdCopyWith<$Res>? get data;
}

/// @nodoc
class __$$ArtistIdListsImplCopyWithImpl<$Res>
    extends _$ArtistIdListsCopyWithImpl<$Res, _$ArtistIdListsImpl>
    implements _$$ArtistIdListsImplCopyWith<$Res> {
  __$$ArtistIdListsImplCopyWithImpl(
      _$ArtistIdListsImpl _value, $Res Function(_$ArtistIdListsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? data = freezed,
  }) {
    return _then(_$ArtistIdListsImpl(
      freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as ArtistId?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ArtistIdListsImpl implements _ArtistIdLists {
  const _$ArtistIdListsImpl(this.status, this.data);

  factory _$ArtistIdListsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ArtistIdListsImplFromJson(json);

  @override
  final bool? status;
  @override
  final ArtistId? data;

  @override
  String toString() {
    return 'ArtistIdLists(status: $status, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ArtistIdListsImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ArtistIdListsImplCopyWith<_$ArtistIdListsImpl> get copyWith =>
      __$$ArtistIdListsImplCopyWithImpl<_$ArtistIdListsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ArtistIdListsImplToJson(
      this,
    );
  }
}

abstract class _ArtistIdLists implements ArtistIdLists {
  const factory _ArtistIdLists(final bool? status, final ArtistId? data) =
      _$ArtistIdListsImpl;

  factory _ArtistIdLists.fromJson(Map<String, dynamic> json) =
      _$ArtistIdListsImpl.fromJson;

  @override
  bool? get status;
  @override
  ArtistId? get data;
  @override
  @JsonKey(ignore: true)
  _$$ArtistIdListsImplCopyWith<_$ArtistIdListsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
