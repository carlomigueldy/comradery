// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'matching.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Matching _$MatchingFromJson(Map<String, dynamic> json) {
  return _Matching.fromJson(json);
}

/// @nodoc
class _$MatchingTearOff {
  const _$MatchingTearOff();

  _Matching call(
      {String? id,
      @JsonKey(name: 'target_user_id') required String targetUserId,
      @JsonKey(name: 'target_user') User? targetUser,
      bool liked = false,
      @JsonKey(name: 'created_by') required String createdBy,
      @JsonKey(name: 'created_by_user') User? createdByUser,
      @JsonKey(name: 'read_at') DateTime? readAt,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt,
      @JsonKey(name: 'deleted_at') DateTime? deletedAt}) {
    return _Matching(
      id: id,
      targetUserId: targetUserId,
      targetUser: targetUser,
      liked: liked,
      createdBy: createdBy,
      createdByUser: createdByUser,
      readAt: readAt,
      createdAt: createdAt,
      updatedAt: updatedAt,
      deletedAt: deletedAt,
    );
  }

  Matching fromJson(Map<String, Object> json) {
    return Matching.fromJson(json);
  }
}

/// @nodoc
const $Matching = _$MatchingTearOff();

/// @nodoc
mixin _$Matching {
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'target_user_id')
  String get targetUserId => throw _privateConstructorUsedError;
  @JsonKey(name: 'target_user')
  User? get targetUser => throw _privateConstructorUsedError;
  bool get liked => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_by')
  String get createdBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_by_user')
  User? get createdByUser => throw _privateConstructorUsedError;
  @JsonKey(name: 'read_at')
  DateTime? get readAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'deleted_at')
  DateTime? get deletedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MatchingCopyWith<Matching> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchingCopyWith<$Res> {
  factory $MatchingCopyWith(Matching value, $Res Function(Matching) then) =
      _$MatchingCopyWithImpl<$Res>;
  $Res call(
      {String? id,
      @JsonKey(name: 'target_user_id') String targetUserId,
      @JsonKey(name: 'target_user') User? targetUser,
      bool liked,
      @JsonKey(name: 'created_by') String createdBy,
      @JsonKey(name: 'created_by_user') User? createdByUser,
      @JsonKey(name: 'read_at') DateTime? readAt,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt,
      @JsonKey(name: 'deleted_at') DateTime? deletedAt});

  $UserCopyWith<$Res>? get targetUser;
  $UserCopyWith<$Res>? get createdByUser;
}

/// @nodoc
class _$MatchingCopyWithImpl<$Res> implements $MatchingCopyWith<$Res> {
  _$MatchingCopyWithImpl(this._value, this._then);

  final Matching _value;
  // ignore: unused_field
  final $Res Function(Matching) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? targetUserId = freezed,
    Object? targetUser = freezed,
    Object? liked = freezed,
    Object? createdBy = freezed,
    Object? createdByUser = freezed,
    Object? readAt = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? deletedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      targetUserId: targetUserId == freezed
          ? _value.targetUserId
          : targetUserId // ignore: cast_nullable_to_non_nullable
              as String,
      targetUser: targetUser == freezed
          ? _value.targetUser
          : targetUser // ignore: cast_nullable_to_non_nullable
              as User?,
      liked: liked == freezed
          ? _value.liked
          : liked // ignore: cast_nullable_to_non_nullable
              as bool,
      createdBy: createdBy == freezed
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      createdByUser: createdByUser == freezed
          ? _value.createdByUser
          : createdByUser // ignore: cast_nullable_to_non_nullable
              as User?,
      readAt: readAt == freezed
          ? _value.readAt
          : readAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deletedAt: deletedAt == freezed
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }

  @override
  $UserCopyWith<$Res>? get targetUser {
    if (_value.targetUser == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.targetUser!, (value) {
      return _then(_value.copyWith(targetUser: value));
    });
  }

  @override
  $UserCopyWith<$Res>? get createdByUser {
    if (_value.createdByUser == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.createdByUser!, (value) {
      return _then(_value.copyWith(createdByUser: value));
    });
  }
}

/// @nodoc
abstract class _$MatchingCopyWith<$Res> implements $MatchingCopyWith<$Res> {
  factory _$MatchingCopyWith(_Matching value, $Res Function(_Matching) then) =
      __$MatchingCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id,
      @JsonKey(name: 'target_user_id') String targetUserId,
      @JsonKey(name: 'target_user') User? targetUser,
      bool liked,
      @JsonKey(name: 'created_by') String createdBy,
      @JsonKey(name: 'created_by_user') User? createdByUser,
      @JsonKey(name: 'read_at') DateTime? readAt,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt,
      @JsonKey(name: 'deleted_at') DateTime? deletedAt});

  @override
  $UserCopyWith<$Res>? get targetUser;
  @override
  $UserCopyWith<$Res>? get createdByUser;
}

/// @nodoc
class __$MatchingCopyWithImpl<$Res> extends _$MatchingCopyWithImpl<$Res>
    implements _$MatchingCopyWith<$Res> {
  __$MatchingCopyWithImpl(_Matching _value, $Res Function(_Matching) _then)
      : super(_value, (v) => _then(v as _Matching));

  @override
  _Matching get _value => super._value as _Matching;

  @override
  $Res call({
    Object? id = freezed,
    Object? targetUserId = freezed,
    Object? targetUser = freezed,
    Object? liked = freezed,
    Object? createdBy = freezed,
    Object? createdByUser = freezed,
    Object? readAt = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? deletedAt = freezed,
  }) {
    return _then(_Matching(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      targetUserId: targetUserId == freezed
          ? _value.targetUserId
          : targetUserId // ignore: cast_nullable_to_non_nullable
              as String,
      targetUser: targetUser == freezed
          ? _value.targetUser
          : targetUser // ignore: cast_nullable_to_non_nullable
              as User?,
      liked: liked == freezed
          ? _value.liked
          : liked // ignore: cast_nullable_to_non_nullable
              as bool,
      createdBy: createdBy == freezed
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      createdByUser: createdByUser == freezed
          ? _value.createdByUser
          : createdByUser // ignore: cast_nullable_to_non_nullable
              as User?,
      readAt: readAt == freezed
          ? _value.readAt
          : readAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deletedAt: deletedAt == freezed
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Matching extends _Matching {
  _$_Matching(
      {this.id,
      @JsonKey(name: 'target_user_id') required this.targetUserId,
      @JsonKey(name: 'target_user') this.targetUser,
      this.liked = false,
      @JsonKey(name: 'created_by') required this.createdBy,
      @JsonKey(name: 'created_by_user') this.createdByUser,
      @JsonKey(name: 'read_at') this.readAt,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt,
      @JsonKey(name: 'deleted_at') this.deletedAt})
      : super._();

  factory _$_Matching.fromJson(Map<String, dynamic> json) =>
      _$_$_MatchingFromJson(json);

  @override
  final String? id;
  @override
  @JsonKey(name: 'target_user_id')
  final String targetUserId;
  @override
  @JsonKey(name: 'target_user')
  final User? targetUser;
  @JsonKey(defaultValue: false)
  @override
  final bool liked;
  @override
  @JsonKey(name: 'created_by')
  final String createdBy;
  @override
  @JsonKey(name: 'created_by_user')
  final User? createdByUser;
  @override
  @JsonKey(name: 'read_at')
  final DateTime? readAt;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;
  @override
  @JsonKey(name: 'deleted_at')
  final DateTime? deletedAt;

  @override
  String toString() {
    return 'Matching(id: $id, targetUserId: $targetUserId, targetUser: $targetUser, liked: $liked, createdBy: $createdBy, createdByUser: $createdByUser, readAt: $readAt, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Matching &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.targetUserId, targetUserId) ||
                const DeepCollectionEquality()
                    .equals(other.targetUserId, targetUserId)) &&
            (identical(other.targetUser, targetUser) ||
                const DeepCollectionEquality()
                    .equals(other.targetUser, targetUser)) &&
            (identical(other.liked, liked) ||
                const DeepCollectionEquality().equals(other.liked, liked)) &&
            (identical(other.createdBy, createdBy) ||
                const DeepCollectionEquality()
                    .equals(other.createdBy, createdBy)) &&
            (identical(other.createdByUser, createdByUser) ||
                const DeepCollectionEquality()
                    .equals(other.createdByUser, createdByUser)) &&
            (identical(other.readAt, readAt) ||
                const DeepCollectionEquality().equals(other.readAt, readAt)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.updatedAt, updatedAt) ||
                const DeepCollectionEquality()
                    .equals(other.updatedAt, updatedAt)) &&
            (identical(other.deletedAt, deletedAt) ||
                const DeepCollectionEquality()
                    .equals(other.deletedAt, deletedAt)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(targetUserId) ^
      const DeepCollectionEquality().hash(targetUser) ^
      const DeepCollectionEquality().hash(liked) ^
      const DeepCollectionEquality().hash(createdBy) ^
      const DeepCollectionEquality().hash(createdByUser) ^
      const DeepCollectionEquality().hash(readAt) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(updatedAt) ^
      const DeepCollectionEquality().hash(deletedAt);

  @JsonKey(ignore: true)
  @override
  _$MatchingCopyWith<_Matching> get copyWith =>
      __$MatchingCopyWithImpl<_Matching>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_MatchingToJson(this);
  }
}

abstract class _Matching extends Matching {
  factory _Matching(
      {String? id,
      @JsonKey(name: 'target_user_id') required String targetUserId,
      @JsonKey(name: 'target_user') User? targetUser,
      bool liked,
      @JsonKey(name: 'created_by') required String createdBy,
      @JsonKey(name: 'created_by_user') User? createdByUser,
      @JsonKey(name: 'read_at') DateTime? readAt,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt,
      @JsonKey(name: 'deleted_at') DateTime? deletedAt}) = _$_Matching;
  _Matching._() : super._();

  factory _Matching.fromJson(Map<String, dynamic> json) = _$_Matching.fromJson;

  @override
  String? get id => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'target_user_id')
  String get targetUserId => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'target_user')
  User? get targetUser => throw _privateConstructorUsedError;
  @override
  bool get liked => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'created_by')
  String get createdBy => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'created_by_user')
  User? get createdByUser => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'read_at')
  DateTime? get readAt => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'deleted_at')
  DateTime? get deletedAt => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$MatchingCopyWith<_Matching> get copyWith =>
      throw _privateConstructorUsedError;
}
