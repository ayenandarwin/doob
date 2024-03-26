// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'categoryidlist.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CategoryIdLists _$CategoryIdListsFromJson(Map<String, dynamic> json) {
  return _CategoryIdLists.fromJson(json);
}

/// @nodoc
mixin _$CategoryIdLists {
  bool? get status => throw _privateConstructorUsedError;
  CategoryId? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CategoryIdListsCopyWith<CategoryIdLists> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryIdListsCopyWith<$Res> {
  factory $CategoryIdListsCopyWith(
          CategoryIdLists value, $Res Function(CategoryIdLists) then) =
      _$CategoryIdListsCopyWithImpl<$Res, CategoryIdLists>;
  @useResult
  $Res call({bool? status, CategoryId? data});

  $CategoryIdCopyWith<$Res>? get data;
}

/// @nodoc
class _$CategoryIdListsCopyWithImpl<$Res, $Val extends CategoryIdLists>
    implements $CategoryIdListsCopyWith<$Res> {
  _$CategoryIdListsCopyWithImpl(this._value, this._then);

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
              as CategoryId?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CategoryIdCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $CategoryIdCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CategoryIdListsImplCopyWith<$Res>
    implements $CategoryIdListsCopyWith<$Res> {
  factory _$$CategoryIdListsImplCopyWith(_$CategoryIdListsImpl value,
          $Res Function(_$CategoryIdListsImpl) then) =
      __$$CategoryIdListsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? status, CategoryId? data});

  @override
  $CategoryIdCopyWith<$Res>? get data;
}

/// @nodoc
class __$$CategoryIdListsImplCopyWithImpl<$Res>
    extends _$CategoryIdListsCopyWithImpl<$Res, _$CategoryIdListsImpl>
    implements _$$CategoryIdListsImplCopyWith<$Res> {
  __$$CategoryIdListsImplCopyWithImpl(
      _$CategoryIdListsImpl _value, $Res Function(_$CategoryIdListsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? data = freezed,
  }) {
    return _then(_$CategoryIdListsImpl(
      freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as CategoryId?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CategoryIdListsImpl implements _CategoryIdLists {
  const _$CategoryIdListsImpl(this.status, this.data);

  factory _$CategoryIdListsImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryIdListsImplFromJson(json);

  @override
  final bool? status;
  @override
  final CategoryId? data;

  @override
  String toString() {
    return 'CategoryIdLists(status: $status, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryIdListsImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryIdListsImplCopyWith<_$CategoryIdListsImpl> get copyWith =>
      __$$CategoryIdListsImplCopyWithImpl<_$CategoryIdListsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryIdListsImplToJson(
      this,
    );
  }
}

abstract class _CategoryIdLists implements CategoryIdLists {
  const factory _CategoryIdLists(final bool? status, final CategoryId? data) =
      _$CategoryIdListsImpl;

  factory _CategoryIdLists.fromJson(Map<String, dynamic> json) =
      _$CategoryIdListsImpl.fromJson;

  @override
  bool? get status;
  @override
  CategoryId? get data;
  @override
  @JsonKey(ignore: true)
  _$$CategoryIdListsImplCopyWith<_$CategoryIdListsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
