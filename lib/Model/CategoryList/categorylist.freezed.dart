// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'categorylist.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CategoryLists _$CategoryListsFromJson(Map<String, dynamic> json) {
  return _CategoryLists.fromJson(json);
}

/// @nodoc
mixin _$CategoryLists {
  bool? get status => throw _privateConstructorUsedError;
  List<Category>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CategoryListsCopyWith<CategoryLists> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryListsCopyWith<$Res> {
  factory $CategoryListsCopyWith(
          CategoryLists value, $Res Function(CategoryLists) then) =
      _$CategoryListsCopyWithImpl<$Res, CategoryLists>;
  @useResult
  $Res call({bool? status, List<Category>? data});
}

/// @nodoc
class _$CategoryListsCopyWithImpl<$Res, $Val extends CategoryLists>
    implements $CategoryListsCopyWith<$Res> {
  _$CategoryListsCopyWithImpl(this._value, this._then);

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
              as List<Category>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CategoryListsImplCopyWith<$Res>
    implements $CategoryListsCopyWith<$Res> {
  factory _$$CategoryListsImplCopyWith(
          _$CategoryListsImpl value, $Res Function(_$CategoryListsImpl) then) =
      __$$CategoryListsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? status, List<Category>? data});
}

/// @nodoc
class __$$CategoryListsImplCopyWithImpl<$Res>
    extends _$CategoryListsCopyWithImpl<$Res, _$CategoryListsImpl>
    implements _$$CategoryListsImplCopyWith<$Res> {
  __$$CategoryListsImplCopyWithImpl(
      _$CategoryListsImpl _value, $Res Function(_$CategoryListsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? data = freezed,
  }) {
    return _then(_$CategoryListsImpl(
      freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
      freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Category>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CategoryListsImpl implements _CategoryLists {
  const _$CategoryListsImpl(this.status, final List<Category>? data)
      : _data = data;

  factory _$CategoryListsImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryListsImplFromJson(json);

  @override
  final bool? status;
  final List<Category>? _data;
  @override
  List<Category>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'CategoryLists(status: $status, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryListsImpl &&
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
  _$$CategoryListsImplCopyWith<_$CategoryListsImpl> get copyWith =>
      __$$CategoryListsImplCopyWithImpl<_$CategoryListsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryListsImplToJson(
      this,
    );
  }
}

abstract class _CategoryLists implements CategoryLists {
  const factory _CategoryLists(final bool? status, final List<Category>? data) =
      _$CategoryListsImpl;

  factory _CategoryLists.fromJson(Map<String, dynamic> json) =
      _$CategoryListsImpl.fromJson;

  @override
  bool? get status;
  @override
  List<Category>? get data;
  @override
  @JsonKey(ignore: true)
  _$$CategoryListsImplCopyWith<_$CategoryListsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
