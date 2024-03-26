// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'slider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Slider _$SliderFromJson(Map<String, dynamic> json) {
  return _Slider.fromJson(json);
}

/// @nodoc
mixin _$Slider {
  int? get id => throw _privateConstructorUsedError;
  String? get photo => throw _privateConstructorUsedError;
  int? get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SliderCopyWith<Slider> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SliderCopyWith<$Res> {
  factory $SliderCopyWith(Slider value, $Res Function(Slider) then) =
      _$SliderCopyWithImpl<$Res, Slider>;
  @useResult
  $Res call({int? id, String? photo, int? status});
}

/// @nodoc
class _$SliderCopyWithImpl<$Res, $Val extends Slider>
    implements $SliderCopyWith<$Res> {
  _$SliderCopyWithImpl(this._value, this._then);

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
abstract class _$$SliderImplCopyWith<$Res> implements $SliderCopyWith<$Res> {
  factory _$$SliderImplCopyWith(
          _$SliderImpl value, $Res Function(_$SliderImpl) then) =
      __$$SliderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? photo, int? status});
}

/// @nodoc
class __$$SliderImplCopyWithImpl<$Res>
    extends _$SliderCopyWithImpl<$Res, _$SliderImpl>
    implements _$$SliderImplCopyWith<$Res> {
  __$$SliderImplCopyWithImpl(
      _$SliderImpl _value, $Res Function(_$SliderImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? photo = freezed,
    Object? status = freezed,
  }) {
    return _then(_$SliderImpl(
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
class _$SliderImpl implements _Slider {
  const _$SliderImpl(this.id, this.photo, this.status);

  factory _$SliderImpl.fromJson(Map<String, dynamic> json) =>
      _$$SliderImplFromJson(json);

  @override
  final int? id;
  @override
  final String? photo;
  @override
  final int? status;

  @override
  String toString() {
    return 'Slider(id: $id, photo: $photo, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SliderImpl &&
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
  _$$SliderImplCopyWith<_$SliderImpl> get copyWith =>
      __$$SliderImplCopyWithImpl<_$SliderImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SliderImplToJson(
      this,
    );
  }
}

abstract class _Slider implements Slider {
  const factory _Slider(final int? id, final String? photo, final int? status) =
      _$SliderImpl;

  factory _Slider.fromJson(Map<String, dynamic> json) = _$SliderImpl.fromJson;

  @override
  int? get id;
  @override
  String? get photo;
  @override
  int? get status;
  @override
  @JsonKey(ignore: true)
  _$$SliderImplCopyWith<_$SliderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
