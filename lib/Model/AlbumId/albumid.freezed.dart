// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'albumid.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AlbumId _$AlbumIdFromJson(Map<String, dynamic> json) {
  return _AlbumId.fromJson(json);
}

/// @nodoc
mixin _$AlbumId {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  String? get cover_photo => throw _privateConstructorUsedError;
  List<dynamic> get album_artists => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  List<Songs>? get songs => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AlbumIdCopyWith<AlbumId> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlbumIdCopyWith<$Res> {
  factory $AlbumIdCopyWith(AlbumId value, $Res Function(AlbumId) then) =
      _$AlbumIdCopyWithImpl<$Res, AlbumId>;
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? type,
      String? cover_photo,
      List<dynamic> album_artists,
      String? status,
      List<Songs>? songs});
}

/// @nodoc
class _$AlbumIdCopyWithImpl<$Res, $Val extends AlbumId>
    implements $AlbumIdCopyWith<$Res> {
  _$AlbumIdCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? type = freezed,
    Object? cover_photo = freezed,
    Object? album_artists = null,
    Object? status = freezed,
    Object? songs = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      cover_photo: freezed == cover_photo
          ? _value.cover_photo
          : cover_photo // ignore: cast_nullable_to_non_nullable
              as String?,
      album_artists: null == album_artists
          ? _value.album_artists
          : album_artists // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      songs: freezed == songs
          ? _value.songs
          : songs // ignore: cast_nullable_to_non_nullable
              as List<Songs>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AlbumIdImplCopyWith<$Res> implements $AlbumIdCopyWith<$Res> {
  factory _$$AlbumIdImplCopyWith(
          _$AlbumIdImpl value, $Res Function(_$AlbumIdImpl) then) =
      __$$AlbumIdImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? type,
      String? cover_photo,
      List<dynamic> album_artists,
      String? status,
      List<Songs>? songs});
}

/// @nodoc
class __$$AlbumIdImplCopyWithImpl<$Res>
    extends _$AlbumIdCopyWithImpl<$Res, _$AlbumIdImpl>
    implements _$$AlbumIdImplCopyWith<$Res> {
  __$$AlbumIdImplCopyWithImpl(
      _$AlbumIdImpl _value, $Res Function(_$AlbumIdImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? type = freezed,
    Object? cover_photo = freezed,
    Object? album_artists = null,
    Object? status = freezed,
    Object? songs = freezed,
  }) {
    return _then(_$AlbumIdImpl(
      freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      freezed == cover_photo
          ? _value.cover_photo
          : cover_photo // ignore: cast_nullable_to_non_nullable
              as String?,
      null == album_artists
          ? _value._album_artists
          : album_artists // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      freezed == songs
          ? _value._songs
          : songs // ignore: cast_nullable_to_non_nullable
              as List<Songs>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AlbumIdImpl implements _AlbumId {
  const _$AlbumIdImpl(this.id, this.name, this.type, this.cover_photo,
      final List<dynamic> album_artists, this.status, final List<Songs>? songs)
      : _album_artists = album_artists,
        _songs = songs;

  factory _$AlbumIdImpl.fromJson(Map<String, dynamic> json) =>
      _$$AlbumIdImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? type;
  @override
  final String? cover_photo;
  final List<dynamic> _album_artists;
  @override
  List<dynamic> get album_artists {
    if (_album_artists is EqualUnmodifiableListView) return _album_artists;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_album_artists);
  }

  @override
  final String? status;
  final List<Songs>? _songs;
  @override
  List<Songs>? get songs {
    final value = _songs;
    if (value == null) return null;
    if (_songs is EqualUnmodifiableListView) return _songs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'AlbumId(id: $id, name: $name, type: $type, cover_photo: $cover_photo, album_artists: $album_artists, status: $status, songs: $songs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AlbumIdImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.cover_photo, cover_photo) ||
                other.cover_photo == cover_photo) &&
            const DeepCollectionEquality()
                .equals(other._album_artists, _album_artists) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._songs, _songs));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      type,
      cover_photo,
      const DeepCollectionEquality().hash(_album_artists),
      status,
      const DeepCollectionEquality().hash(_songs));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AlbumIdImplCopyWith<_$AlbumIdImpl> get copyWith =>
      __$$AlbumIdImplCopyWithImpl<_$AlbumIdImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AlbumIdImplToJson(
      this,
    );
  }
}

abstract class _AlbumId implements AlbumId {
  const factory _AlbumId(
      final int? id,
      final String? name,
      final String? type,
      final String? cover_photo,
      final List<dynamic> album_artists,
      final String? status,
      final List<Songs>? songs) = _$AlbumIdImpl;

  factory _AlbumId.fromJson(Map<String, dynamic> json) = _$AlbumIdImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  String? get type;
  @override
  String? get cover_photo;
  @override
  List<dynamic> get album_artists;
  @override
  String? get status;
  @override
  List<Songs>? get songs;
  @override
  @JsonKey(ignore: true)
  _$$AlbumIdImplCopyWith<_$AlbumIdImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
