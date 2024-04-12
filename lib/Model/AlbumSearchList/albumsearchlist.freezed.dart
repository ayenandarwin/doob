// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'albumsearchlist.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AlbumSearchList _$AlbumSearchListFromJson(Map<String, dynamic> json) {
  return _AlbumSearchList.fromJson(json);
}

/// @nodoc
mixin _$AlbumSearchList {
  bool? get status => throw _privateConstructorUsedError;
  List<AlbumSearch>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AlbumSearchListCopyWith<AlbumSearchList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlbumSearchListCopyWith<$Res> {
  factory $AlbumSearchListCopyWith(
          AlbumSearchList value, $Res Function(AlbumSearchList) then) =
      _$AlbumSearchListCopyWithImpl<$Res, AlbumSearchList>;
  @useResult
  $Res call({bool? status, List<AlbumSearch>? data});
}

/// @nodoc
class _$AlbumSearchListCopyWithImpl<$Res, $Val extends AlbumSearchList>
    implements $AlbumSearchListCopyWith<$Res> {
  _$AlbumSearchListCopyWithImpl(this._value, this._then);

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
              as List<AlbumSearch>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AlbumSearchListImplCopyWith<$Res>
    implements $AlbumSearchListCopyWith<$Res> {
  factory _$$AlbumSearchListImplCopyWith(_$AlbumSearchListImpl value,
          $Res Function(_$AlbumSearchListImpl) then) =
      __$$AlbumSearchListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? status, List<AlbumSearch>? data});
}

/// @nodoc
class __$$AlbumSearchListImplCopyWithImpl<$Res>
    extends _$AlbumSearchListCopyWithImpl<$Res, _$AlbumSearchListImpl>
    implements _$$AlbumSearchListImplCopyWith<$Res> {
  __$$AlbumSearchListImplCopyWithImpl(
      _$AlbumSearchListImpl _value, $Res Function(_$AlbumSearchListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? data = freezed,
  }) {
    return _then(_$AlbumSearchListImpl(
      freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
      freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<AlbumSearch>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AlbumSearchListImpl implements _AlbumSearchList {
  const _$AlbumSearchListImpl(this.status, final List<AlbumSearch>? data)
      : _data = data;

  factory _$AlbumSearchListImpl.fromJson(Map<String, dynamic> json) =>
      _$$AlbumSearchListImplFromJson(json);

  @override
  final bool? status;
  final List<AlbumSearch>? _data;
  @override
  List<AlbumSearch>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'AlbumSearchList(status: $status, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AlbumSearchListImpl &&
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
  _$$AlbumSearchListImplCopyWith<_$AlbumSearchListImpl> get copyWith =>
      __$$AlbumSearchListImplCopyWithImpl<_$AlbumSearchListImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AlbumSearchListImplToJson(
      this,
    );
  }
}

abstract class _AlbumSearchList implements AlbumSearchList {
  const factory _AlbumSearchList(
          final bool? status, final List<AlbumSearch>? data) =
      _$AlbumSearchListImpl;

  factory _AlbumSearchList.fromJson(Map<String, dynamic> json) =
      _$AlbumSearchListImpl.fromJson;

  @override
  bool? get status;
  @override
  List<AlbumSearch>? get data;
  @override
  @JsonKey(ignore: true)
  _$$AlbumSearchListImplCopyWith<_$AlbumSearchListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
