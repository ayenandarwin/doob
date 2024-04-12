// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'songcommentlist.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SongCommentList _$SongCommentListFromJson(Map<String, dynamic> json) {
  return _SongCommentList.fromJson(json);
}

/// @nodoc
mixin _$SongCommentList {
  bool? get status => throw _privateConstructorUsedError;
  List<SongComment>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SongCommentListCopyWith<SongCommentList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SongCommentListCopyWith<$Res> {
  factory $SongCommentListCopyWith(
          SongCommentList value, $Res Function(SongCommentList) then) =
      _$SongCommentListCopyWithImpl<$Res, SongCommentList>;
  @useResult
  $Res call({bool? status, List<SongComment>? data});
}

/// @nodoc
class _$SongCommentListCopyWithImpl<$Res, $Val extends SongCommentList>
    implements $SongCommentListCopyWith<$Res> {
  _$SongCommentListCopyWithImpl(this._value, this._then);

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
              as List<SongComment>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SongCommentListImplCopyWith<$Res>
    implements $SongCommentListCopyWith<$Res> {
  factory _$$SongCommentListImplCopyWith(_$SongCommentListImpl value,
          $Res Function(_$SongCommentListImpl) then) =
      __$$SongCommentListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? status, List<SongComment>? data});
}

/// @nodoc
class __$$SongCommentListImplCopyWithImpl<$Res>
    extends _$SongCommentListCopyWithImpl<$Res, _$SongCommentListImpl>
    implements _$$SongCommentListImplCopyWith<$Res> {
  __$$SongCommentListImplCopyWithImpl(
      _$SongCommentListImpl _value, $Res Function(_$SongCommentListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? data = freezed,
  }) {
    return _then(_$SongCommentListImpl(
      freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
      freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<SongComment>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SongCommentListImpl implements _SongCommentList {
  const _$SongCommentListImpl(this.status, final List<SongComment>? data)
      : _data = data;

  factory _$SongCommentListImpl.fromJson(Map<String, dynamic> json) =>
      _$$SongCommentListImplFromJson(json);

  @override
  final bool? status;
  final List<SongComment>? _data;
  @override
  List<SongComment>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'SongCommentList(status: $status, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SongCommentListImpl &&
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
  _$$SongCommentListImplCopyWith<_$SongCommentListImpl> get copyWith =>
      __$$SongCommentListImplCopyWithImpl<_$SongCommentListImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SongCommentListImplToJson(
      this,
    );
  }
}

abstract class _SongCommentList implements SongCommentList {
  const factory _SongCommentList(
          final bool? status, final List<SongComment>? data) =
      _$SongCommentListImpl;

  factory _SongCommentList.fromJson(Map<String, dynamic> json) =
      _$SongCommentListImpl.fromJson;

  @override
  bool? get status;
  @override
  List<SongComment>? get data;
  @override
  @JsonKey(ignore: true)
  _$$SongCommentListImplCopyWith<_$SongCommentListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
