// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sliderid.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SliderId _$SliderIdFromJson(Map<String, dynamic> json) {
  return _SliderId.fromJson(json);
}

/// @nodoc
mixin _$SliderId {
  int? get id => throw _privateConstructorUsedError;
  String? get photo => throw _privateConstructorUsedError;
  int? get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SliderIdCopyWith<SliderId> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SliderIdCopyWith<$Res> {
  factory $SliderIdCopyWith(SliderId value, $Res Function(SliderId) then) =
      _$SliderIdCopyWithImpl<$Res, SliderId>;
  @useResult
  $Res call({int? id, String? photo, int? status});
}

/// @nodoc
class _$SliderIdCopyWithImpl<$Res, $Val extends SliderId>
    implements $SliderIdCopyWith<$Res> {
  _$SliderIdCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? photo = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SliderIdImplCopyWith<$Res>
    implements $SliderIdCopyWith<$Res> {
  factory _$$SliderIdImplCopyWith(
          _$SliderIdImpl value, $Res Function(_$SliderIdImpl) then) =
      __$$SliderIdImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? photo, int? status});
}

/// @nodoc
class __$$SliderIdImplCopyWithImpl<$Res>
    extends _$SliderIdCopyWithImpl<$Res, _$SliderIdImpl>
    implements _$$SliderIdImplCopyWith<$Res> {
  __$$SliderIdImplCopyWithImpl(
      _$SliderIdImpl _value, $Res Function(_$SliderIdImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? photo = freezed,
    Object? status = freezed,
  }) {
    return _then(_$SliderIdImpl(
      freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String?,
      freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SliderIdImpl implements _SliderId {
  const _$SliderIdImpl(this.id, this.photo, this.status);

  factory _$SliderIdImpl.fromJson(Map<String, dynamic> json) =>
      _$$SliderIdImplFromJson(json);

  @override
  final int? id;
  @override
  final String? photo;
  @override
  final int? status;

  @override
  String toString() {
    return 'SliderId(id: $id, photo: $photo, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SliderIdImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.photo, photo) || other.photo == photo) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, photo, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SliderIdImplCopyWith<_$SliderIdImpl> get copyWith =>
      __$$SliderIdImplCopyWithImpl<_$SliderIdImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SliderIdImplToJson(
      this,
    );
  }
}

abstract class _SliderId implements SliderId {
  const factory _SliderId(
      final int? id, final String? photo, final int? status) = _$SliderIdImpl;

  factory _SliderId.fromJson(Map<String, dynamic> json) =
      _$SliderIdImpl.fromJson;

  @override
  int? get id;
  @override
  String? get photo;
  @override
  int? get status;
  @override
  @JsonKey(ignore: true)
  _$$SliderIdImplCopyWith<_$SliderIdImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
