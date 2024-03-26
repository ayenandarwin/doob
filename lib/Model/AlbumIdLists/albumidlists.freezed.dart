// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'albumidlists.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AlbumIdLists _$AlbumIdListsFromJson(Map<String, dynamic> json) {
  return _AlbumIdLists.fromJson(json);
}

/// @nodoc
mixin _$AlbumIdLists {
  bool? get status =>
      throw _privateConstructorUsedError; // Map<String,dynamic>? data,
//
  AlbumId? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AlbumIdListsCopyWith<AlbumIdLists> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlbumIdListsCopyWith<$Res> {
  factory $AlbumIdListsCopyWith(
          AlbumIdLists value, $Res Function(AlbumIdLists) then) =
      _$AlbumIdListsCopyWithImpl<$Res, AlbumIdLists>;
  @useResult
  $Res call({bool? status, AlbumId? data});

  $AlbumIdCopyWith<$Res>? get data;
}

/// @nodoc
class _$AlbumIdListsCopyWithImpl<$Res, $Val extends AlbumIdLists>
    implements $AlbumIdListsCopyWith<$Res> {
  _$AlbumIdListsCopyWithImpl(this._value, this._then);

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
              as AlbumId?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AlbumIdCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $AlbumIdCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AlbumIdListsImplCopyWith<$Res>
    implements $AlbumIdListsCopyWith<$Res> {
  factory _$$AlbumIdListsImplCopyWith(
          _$AlbumIdListsImpl value, $Res Function(_$AlbumIdListsImpl) then) =
      __$$AlbumIdListsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? status, AlbumId? data});

  @override
  $AlbumIdCopyWith<$Res>? get data;
}

/// @nodoc
class __$$AlbumIdListsImplCopyWithImpl<$Res>
    extends _$AlbumIdListsCopyWithImpl<$Res, _$AlbumIdListsImpl>
    implements _$$AlbumIdListsImplCopyWith<$Res> {
  __$$AlbumIdListsImplCopyWithImpl(
      _$AlbumIdListsImpl _value, $Res Function(_$AlbumIdListsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? data = freezed,
  }) {
    return _then(_$AlbumIdListsImpl(
      freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as AlbumId?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AlbumIdListsImpl implements _AlbumIdLists {
  const _$AlbumIdListsImpl(this.status, this.data);

  factory _$AlbumIdListsImpl.fromJson(Map<String, dynamic> json) =>
      _$$AlbumIdListsImplFromJson(json);

  @override
  final bool? status;
// Map<String,dynamic>? data,
//
  @override
  final AlbumId? data;

  @override
  String toString() {
    return 'AlbumIdLists(status: $status, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AlbumIdListsImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AlbumIdListsImplCopyWith<_$AlbumIdListsImpl> get copyWith =>
      __$$AlbumIdListsImplCopyWithImpl<_$AlbumIdListsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AlbumIdListsImplToJson(
      this,
    );
  }
}

abstract class _AlbumIdLists implements AlbumIdLists {
  const factory _AlbumIdLists(final bool? status, final AlbumId? data) =
      _$AlbumIdListsImpl;

  factory _AlbumIdLists.fromJson(Map<String, dynamic> json) =
      _$AlbumIdListsImpl.fromJson;

  @override
  bool? get status;
  @override // Map<String,dynamic>? data,
//
  AlbumId? get data;
  @override
  @JsonKey(ignore: true)
  _$$AlbumIdListsImplCopyWith<_$AlbumIdListsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
