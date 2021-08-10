// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'team_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TeamRequest _$TeamRequestFromJson(Map<String, dynamic> json) {
  return _TeamRequest.fromJson(json);
}

/// @nodoc
class _$TeamRequestTearOff {
  const _$TeamRequestTearOff();

  _TeamRequest call(
      {@JsonKey(name: 'user_id') required String userId,
      User? user,
      @JsonKey(name: 'team_id') required String teamId,
      Team? team,
      required TeamRequestType type,
      @JsonKey(name: 'created_by') required String createdBy,
      @JsonKey(name: 'created_by_user') User? createdByUser,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt,
      @JsonKey(name: 'deleted_at') DateTime? deletedAt}) {
    return _TeamRequest(
      userId: userId,
      user: user,
      teamId: teamId,
      team: team,
      type: type,
      createdBy: createdBy,
      createdByUser: createdByUser,
      createdAt: createdAt,
      updatedAt: updatedAt,
      deletedAt: deletedAt,
    );
  }

  TeamRequest fromJson(Map<String, Object> json) {
    return TeamRequest.fromJson(json);
  }
}

/// @nodoc
const $TeamRequest = _$TeamRequestTearOff();

/// @nodoc
mixin _$TeamRequest {
  @JsonKey(name: 'user_id')
  String get userId => throw _privateConstructorUsedError;
  User? get user => throw _privateConstructorUsedError;
  @JsonKey(name: 'team_id')
  String get teamId => throw _privateConstructorUsedError;
  Team? get team => throw _privateConstructorUsedError;
  TeamRequestType get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_by')
  String get createdBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_by_user')
  User? get createdByUser => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'deleted_at')
  DateTime? get deletedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TeamRequestCopyWith<TeamRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TeamRequestCopyWith<$Res> {
  factory $TeamRequestCopyWith(
          TeamRequest value, $Res Function(TeamRequest) then) =
      _$TeamRequestCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'user_id') String userId,
      User? user,
      @JsonKey(name: 'team_id') String teamId,
      Team? team,
      TeamRequestType type,
      @JsonKey(name: 'created_by') String createdBy,
      @JsonKey(name: 'created_by_user') User? createdByUser,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt,
      @JsonKey(name: 'deleted_at') DateTime? deletedAt});

  $UserCopyWith<$Res>? get user;
  $TeamCopyWith<$Res>? get team;
  $UserCopyWith<$Res>? get createdByUser;
}

/// @nodoc
class _$TeamRequestCopyWithImpl<$Res> implements $TeamRequestCopyWith<$Res> {
  _$TeamRequestCopyWithImpl(this._value, this._then);

  final TeamRequest _value;
  // ignore: unused_field
  final $Res Function(TeamRequest) _then;

  @override
  $Res call({
    Object? userId = freezed,
    Object? user = freezed,
    Object? teamId = freezed,
    Object? team = freezed,
    Object? type = freezed,
    Object? createdBy = freezed,
    Object? createdByUser = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? deletedAt = freezed,
  }) {
    return _then(_value.copyWith(
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      teamId: teamId == freezed
          ? _value.teamId
          : teamId // ignore: cast_nullable_to_non_nullable
              as String,
      team: team == freezed
          ? _value.team
          : team // ignore: cast_nullable_to_non_nullable
              as Team?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TeamRequestType,
      createdBy: createdBy == freezed
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      createdByUser: createdByUser == freezed
          ? _value.createdByUser
          : createdByUser // ignore: cast_nullable_to_non_nullable
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
  $UserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value));
    });
  }

  @override
  $TeamCopyWith<$Res>? get team {
    if (_value.team == null) {
      return null;
    }

    return $TeamCopyWith<$Res>(_value.team!, (value) {
      return _then(_value.copyWith(team: value));
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
abstract class _$TeamRequestCopyWith<$Res>
    implements $TeamRequestCopyWith<$Res> {
  factory _$TeamRequestCopyWith(
          _TeamRequest value, $Res Function(_TeamRequest) then) =
      __$TeamRequestCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'user_id') String userId,
      User? user,
      @JsonKey(name: 'team_id') String teamId,
      Team? team,
      TeamRequestType type,
      @JsonKey(name: 'created_by') String createdBy,
      @JsonKey(name: 'created_by_user') User? createdByUser,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt,
      @JsonKey(name: 'deleted_at') DateTime? deletedAt});

  @override
  $UserCopyWith<$Res>? get user;
  @override
  $TeamCopyWith<$Res>? get team;
  @override
  $UserCopyWith<$Res>? get createdByUser;
}

/// @nodoc
class __$TeamRequestCopyWithImpl<$Res> extends _$TeamRequestCopyWithImpl<$Res>
    implements _$TeamRequestCopyWith<$Res> {
  __$TeamRequestCopyWithImpl(
      _TeamRequest _value, $Res Function(_TeamRequest) _then)
      : super(_value, (v) => _then(v as _TeamRequest));

  @override
  _TeamRequest get _value => super._value as _TeamRequest;

  @override
  $Res call({
    Object? userId = freezed,
    Object? user = freezed,
    Object? teamId = freezed,
    Object? team = freezed,
    Object? type = freezed,
    Object? createdBy = freezed,
    Object? createdByUser = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? deletedAt = freezed,
  }) {
    return _then(_TeamRequest(
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      teamId: teamId == freezed
          ? _value.teamId
          : teamId // ignore: cast_nullable_to_non_nullable
              as String,
      team: team == freezed
          ? _value.team
          : team // ignore: cast_nullable_to_non_nullable
              as Team?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TeamRequestType,
      createdBy: createdBy == freezed
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      createdByUser: createdByUser == freezed
          ? _value.createdByUser
          : createdByUser // ignore: cast_nullable_to_non_nullable
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
class _$_TeamRequest extends _TeamRequest {
  _$_TeamRequest(
      {@JsonKey(name: 'user_id') required this.userId,
      this.user,
      @JsonKey(name: 'team_id') required this.teamId,
      this.team,
      required this.type,
      @JsonKey(name: 'created_by') required this.createdBy,
      @JsonKey(name: 'created_by_user') this.createdByUser,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt,
      @JsonKey(name: 'deleted_at') this.deletedAt})
      : super._();

  factory _$_TeamRequest.fromJson(Map<String, dynamic> json) =>
      _$_$_TeamRequestFromJson(json);

  @override
  @JsonKey(name: 'user_id')
  final String userId;
  @override
  final User? user;
  @override
  @JsonKey(name: 'team_id')
  final String teamId;
  @override
  final Team? team;
  @override
  final TeamRequestType type;
  @override
  @JsonKey(name: 'created_by')
  final String createdBy;
  @override
  @JsonKey(name: 'created_by_user')
  final User? createdByUser;
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
    return 'TeamRequest(userId: $userId, user: $user, teamId: $teamId, team: $team, type: $type, createdBy: $createdBy, createdByUser: $createdByUser, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TeamRequest &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)) &&
            (identical(other.teamId, teamId) ||
                const DeepCollectionEquality().equals(other.teamId, teamId)) &&
            (identical(other.team, team) ||
                const DeepCollectionEquality().equals(other.team, team)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.createdBy, createdBy) ||
                const DeepCollectionEquality()
                    .equals(other.createdBy, createdBy)) &&
            (identical(other.createdByUser, createdByUser) ||
                const DeepCollectionEquality()
                    .equals(other.createdByUser, createdByUser)) &&
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
      const DeepCollectionEquality().hash(userId) ^
      const DeepCollectionEquality().hash(user) ^
      const DeepCollectionEquality().hash(teamId) ^
      const DeepCollectionEquality().hash(team) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(createdBy) ^
      const DeepCollectionEquality().hash(createdByUser) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(updatedAt) ^
      const DeepCollectionEquality().hash(deletedAt);

  @JsonKey(ignore: true)
  @override
  _$TeamRequestCopyWith<_TeamRequest> get copyWith =>
      __$TeamRequestCopyWithImpl<_TeamRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_TeamRequestToJson(this);
  }
}

abstract class _TeamRequest extends TeamRequest {
  factory _TeamRequest(
      {@JsonKey(name: 'user_id') required String userId,
      User? user,
      @JsonKey(name: 'team_id') required String teamId,
      Team? team,
      required TeamRequestType type,
      @JsonKey(name: 'created_by') required String createdBy,
      @JsonKey(name: 'created_by_user') User? createdByUser,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt,
      @JsonKey(name: 'deleted_at') DateTime? deletedAt}) = _$_TeamRequest;
  _TeamRequest._() : super._();

  factory _TeamRequest.fromJson(Map<String, dynamic> json) =
      _$_TeamRequest.fromJson;

  @override
  @JsonKey(name: 'user_id')
  String get userId => throw _privateConstructorUsedError;
  @override
  User? get user => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'team_id')
  String get teamId => throw _privateConstructorUsedError;
  @override
  Team? get team => throw _privateConstructorUsedError;
  @override
  TeamRequestType get type => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'created_by')
  String get createdBy => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'created_by_user')
  User? get createdByUser => throw _privateConstructorUsedError;
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
  _$TeamRequestCopyWith<_TeamRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
