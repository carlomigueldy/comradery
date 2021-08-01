// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'user_interest.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserInterest _$UserInterestFromJson(Map<String, dynamic> json) {
  return _UserInterest.fromJson(json);
}

/// @nodoc
class _$UserInterestTearOff {
  const _$UserInterestTearOff();

  _UserInterest call(
      {String? id,
      @JsonKey(name: 'interest_id') required String interestId,
      Interest? interest,
      @JsonKey(name: 'user_id') required String userId,
      User? user,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt,
      @JsonKey(name: 'deleted_at') DateTime? deletedAt}) {
    return _UserInterest(
      id: id,
      interestId: interestId,
      interest: interest,
      userId: userId,
      user: user,
      createdAt: createdAt,
      updatedAt: updatedAt,
      deletedAt: deletedAt,
    );
  }

  UserInterest fromJson(Map<String, Object> json) {
    return UserInterest.fromJson(json);
  }
}

/// @nodoc
const $UserInterest = _$UserInterestTearOff();

/// @nodoc
mixin _$UserInterest {
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'interest_id')
  String get interestId => throw _privateConstructorUsedError;
  Interest? get interest => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String get userId => throw _privateConstructorUsedError;
  User? get user => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'deleted_at')
  DateTime? get deletedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserInterestCopyWith<UserInterest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserInterestCopyWith<$Res> {
  factory $UserInterestCopyWith(
          UserInterest value, $Res Function(UserInterest) then) =
      _$UserInterestCopyWithImpl<$Res>;
  $Res call(
      {String? id,
      @JsonKey(name: 'interest_id') String interestId,
      Interest? interest,
      @JsonKey(name: 'user_id') String userId,
      User? user,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt,
      @JsonKey(name: 'deleted_at') DateTime? deletedAt});

  $InterestCopyWith<$Res>? get interest;
  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class _$UserInterestCopyWithImpl<$Res> implements $UserInterestCopyWith<$Res> {
  _$UserInterestCopyWithImpl(this._value, this._then);

  final UserInterest _value;
  // ignore: unused_field
  final $Res Function(UserInterest) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? interestId = freezed,
    Object? interest = freezed,
    Object? userId = freezed,
    Object? user = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? deletedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      interestId: interestId == freezed
          ? _value.interestId
          : interestId // ignore: cast_nullable_to_non_nullable
              as String,
      interest: interest == freezed
          ? _value.interest
          : interest // ignore: cast_nullable_to_non_nullable
              as Interest?,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
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
  $InterestCopyWith<$Res>? get interest {
    if (_value.interest == null) {
      return null;
    }

    return $InterestCopyWith<$Res>(_value.interest!, (value) {
      return _then(_value.copyWith(interest: value));
    });
  }

  @override
  $UserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc
abstract class _$UserInterestCopyWith<$Res>
    implements $UserInterestCopyWith<$Res> {
  factory _$UserInterestCopyWith(
          _UserInterest value, $Res Function(_UserInterest) then) =
      __$UserInterestCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id,
      @JsonKey(name: 'interest_id') String interestId,
      Interest? interest,
      @JsonKey(name: 'user_id') String userId,
      User? user,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt,
      @JsonKey(name: 'deleted_at') DateTime? deletedAt});

  @override
  $InterestCopyWith<$Res>? get interest;
  @override
  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class __$UserInterestCopyWithImpl<$Res> extends _$UserInterestCopyWithImpl<$Res>
    implements _$UserInterestCopyWith<$Res> {
  __$UserInterestCopyWithImpl(
      _UserInterest _value, $Res Function(_UserInterest) _then)
      : super(_value, (v) => _then(v as _UserInterest));

  @override
  _UserInterest get _value => super._value as _UserInterest;

  @override
  $Res call({
    Object? id = freezed,
    Object? interestId = freezed,
    Object? interest = freezed,
    Object? userId = freezed,
    Object? user = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? deletedAt = freezed,
  }) {
    return _then(_UserInterest(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      interestId: interestId == freezed
          ? _value.interestId
          : interestId // ignore: cast_nullable_to_non_nullable
              as String,
      interest: interest == freezed
          ? _value.interest
          : interest // ignore: cast_nullable_to_non_nullable
              as Interest?,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
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
class _$_UserInterest extends _UserInterest {
  _$_UserInterest(
      {this.id,
      @JsonKey(name: 'interest_id') required this.interestId,
      this.interest,
      @JsonKey(name: 'user_id') required this.userId,
      this.user,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt,
      @JsonKey(name: 'deleted_at') this.deletedAt})
      : super._();

  factory _$_UserInterest.fromJson(Map<String, dynamic> json) =>
      _$_$_UserInterestFromJson(json);

  @override
  final String? id;
  @override
  @JsonKey(name: 'interest_id')
  final String interestId;
  @override
  final Interest? interest;
  @override
  @JsonKey(name: 'user_id')
  final String userId;
  @override
  final User? user;
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
    return 'UserInterest(id: $id, interestId: $interestId, interest: $interest, userId: $userId, user: $user, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UserInterest &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.interestId, interestId) ||
                const DeepCollectionEquality()
                    .equals(other.interestId, interestId)) &&
            (identical(other.interest, interest) ||
                const DeepCollectionEquality()
                    .equals(other.interest, interest)) &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)) &&
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
      const DeepCollectionEquality().hash(interestId) ^
      const DeepCollectionEquality().hash(interest) ^
      const DeepCollectionEquality().hash(userId) ^
      const DeepCollectionEquality().hash(user) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(updatedAt) ^
      const DeepCollectionEquality().hash(deletedAt);

  @JsonKey(ignore: true)
  @override
  _$UserInterestCopyWith<_UserInterest> get copyWith =>
      __$UserInterestCopyWithImpl<_UserInterest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_UserInterestToJson(this);
  }
}

abstract class _UserInterest extends UserInterest {
  factory _UserInterest(
      {String? id,
      @JsonKey(name: 'interest_id') required String interestId,
      Interest? interest,
      @JsonKey(name: 'user_id') required String userId,
      User? user,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt,
      @JsonKey(name: 'deleted_at') DateTime? deletedAt}) = _$_UserInterest;
  _UserInterest._() : super._();

  factory _UserInterest.fromJson(Map<String, dynamic> json) =
      _$_UserInterest.fromJson;

  @override
  String? get id => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'interest_id')
  String get interestId => throw _privateConstructorUsedError;
  @override
  Interest? get interest => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'user_id')
  String get userId => throw _privateConstructorUsedError;
  @override
  User? get user => throw _privateConstructorUsedError;
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
  _$UserInterestCopyWith<_UserInterest> get copyWith =>
      throw _privateConstructorUsedError;
}
