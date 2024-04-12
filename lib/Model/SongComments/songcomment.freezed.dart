// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'songcomment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SongComment _$SongCommentFromJson(Map<String, dynamic> json) {
  return _SongComment.fromJson(json);
}

/// @nodoc
mixin _$SongComment {
  int? get id => throw _privateConstructorUsedError;
  String? get comment_text => throw _privateConstructorUsedError;
  Customer? get customer => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SongCommentCopyWith<SongComment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SongCommentCopyWith<$Res> {
  factory $SongCommentCopyWith(
          SongComment value, $Res Function(SongComment) then) =
      _$SongCommentCopyWithImpl<$Res, SongComment>;
  @useResult
  $Res call({int? id, String? comment_text, Customer? customer});

  $CustomerCopyWith<$Res>? get customer;
}

/// @nodoc
class _$SongCommentCopyWithImpl<$Res, $Val extends SongComment>
    implements $SongCommentCopyWith<$Res> {
  _$SongCommentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? comment_text = freezed,
    Object? customer = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      comment_text: freezed == comment_text
          ? _value.comment_text
          : comment_text // ignore: cast_nullable_to_non_nullable
              as String?,
      customer: freezed == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as Customer?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CustomerCopyWith<$Res>? get customer {
    if (_value.customer == null) {
      return null;
    }

    return $CustomerCopyWith<$Res>(_value.customer!, (value) {
      return _then(_value.copyWith(customer: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SongCommentImplCopyWith<$Res>
    implements $SongCommentCopyWith<$Res> {
  factory _$$SongCommentImplCopyWith(
          _$SongCommentImpl value, $Res Function(_$SongCommentImpl) then) =
      __$$SongCommentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? comment_text, Customer? customer});

  @override
  $CustomerCopyWith<$Res>? get customer;
}

/// @nodoc
class __$$SongCommentImplCopyWithImpl<$Res>
    extends _$SongCommentCopyWithImpl<$Res, _$SongCommentImpl>
    implements _$$SongCommentImplCopyWith<$Res> {
  __$$SongCommentImplCopyWithImpl(
      _$SongCommentImpl _value, $Res Function(_$SongCommentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? comment_text = freezed,
    Object? customer = freezed,
  }) {
    return _then(_$SongCommentImpl(
      freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      freezed == comment_text
          ? _value.comment_text
          : comment_text // ignore: cast_nullable_to_non_nullable
              as String?,
      freezed == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as Customer?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SongCommentImpl implements _SongComment {
  const _$SongCommentImpl(this.id, this.comment_text, this.customer);

  factory _$SongCommentImpl.fromJson(Map<String, dynamic> json) =>
      _$$SongCommentImplFromJson(json);

  @override
  final int? id;
  @override
  final String? comment_text;
  @override
  final Customer? customer;

  @override
  String toString() {
    return 'SongComment(id: $id, comment_text: $comment_text, customer: $customer)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SongCommentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.comment_text, comment_text) ||
                other.comment_text == comment_text) &&
            (identical(other.customer, customer) ||
                other.customer == customer));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, comment_text, customer);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SongCommentImplCopyWith<_$SongCommentImpl> get copyWith =>
      __$$SongCommentImplCopyWithImpl<_$SongCommentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SongCommentImplToJson(
      this,
    );
  }
}

abstract class _SongComment implements SongComment {
  const factory _SongComment(
          final int? id, final String? comment_text, final Customer? customer) =
      _$SongCommentImpl;

  factory _SongComment.fromJson(Map<String, dynamic> json) =
      _$SongCommentImpl.fromJson;

  @override
  int? get id;
  @override
  String? get comment_text;
  @override
  Customer? get customer;
  @override
  @JsonKey(ignore: true)
  _$$SongCommentImplCopyWith<_$SongCommentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
