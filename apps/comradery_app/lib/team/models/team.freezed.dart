// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'team.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Team _$TeamFromJson(Map<String, dynamic> json) {
  return _Team.fromJson(json);
}

/// @nodoc
class _$TeamTearOff {
  const _$TeamTearOff();

  _Team call(
      {String? id,
      required String name,
      @JsonKey(name: 'photo_url')
          String? photoUrl,
      String? description,
      @JsonKey(name: 'external_links_json')
          Map<String, dynamic>? externalLinksJson,
      @JsonKey(name: 'welcome_to_team_json')
          Map<String, dynamic>? welcomeToTeamJson,
      @JsonKey(name: 'created_by')
          required String createdBy,
      @JsonKey(name: 'created_by_user')
          User? createdByUser,
      @JsonKey(name: 'created_at')
          DateTime? createdAt,
      @JsonKey(name: 'updated_at')
          DateTime? updatedAt,
      @JsonKey(name: 'deleted_at')
          DateTime? deletedAt}) {
    return _Team(
      id: id,
      name: name,
      photoUrl: photoUrl,
      description: description,
      externalLinksJson: externalLinksJson,
      welcomeToTeamJson: welcomeToTeamJson,
      createdBy: createdBy,
      createdByUser: createdByUser,
      createdAt: createdAt,
      updatedAt: updatedAt,
      deletedAt: deletedAt,
    );
  }

  Team fromJson(Map<String, Object> json) {
    return Team.fromJson(json);
  }
}

/// @nodoc
const $Team = _$TeamTearOff();

/// @nodoc
mixin _$Team {
  String? get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'photo_url')
  String? get photoUrl => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'external_links_json')
  Map<String, dynamic>? get externalLinksJson =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'welcome_to_team_json')
  Map<String, dynamic>? get welcomeToTeamJson =>
      throw _privateConstructorUsedError;
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
  $TeamCopyWith<Team> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TeamCopyWith<$Res> {
  factory $TeamCopyWith(Team value, $Res Function(Team) then) =
      _$TeamCopyWithImpl<$Res>;
  $Res call(
      {String? id,
      String name,
      @JsonKey(name: 'photo_url')
          String? photoUrl,
      String? description,
      @JsonKey(name: 'external_links_json')
          Map<String, dynamic>? externalLinksJson,
      @JsonKey(name: 'welcome_to_team_json')
          Map<String, dynamic>? welcomeToTeamJson,
      @JsonKey(name: 'created_by')
          String createdBy,
      @JsonKey(name: 'created_by_user')
          User? createdByUser,
      @JsonKey(name: 'created_at')
          DateTime? createdAt,
      @JsonKey(name: 'updated_at')
          DateTime? updatedAt,
      @JsonKey(name: 'deleted_at')
          DateTime? deletedAt});

  $UserCopyWith<$Res>? get createdByUser;
}

/// @nodoc
class _$TeamCopyWithImpl<$Res> implements $TeamCopyWith<$Res> {
  _$TeamCopyWithImpl(this._value, this._then);

  final Team _value;
  // ignore: unused_field
  final $Res Function(Team) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? photoUrl = freezed,
    Object? description = freezed,
    Object? externalLinksJson = freezed,
    Object? welcomeToTeamJson = freezed,
    Object? createdBy = freezed,
    Object? createdByUser = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? deletedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrl: photoUrl == freezed
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      externalLinksJson: externalLinksJson == freezed
          ? _value.externalLinksJson
          : externalLinksJson // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      welcomeToTeamJson: welcomeToTeamJson == freezed
          ? _value.welcomeToTeamJson
          : welcomeToTeamJson // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
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
abstract class _$TeamCopyWith<$Res> implements $TeamCopyWith<$Res> {
  factory _$TeamCopyWith(_Team value, $Res Function(_Team) then) =
      __$TeamCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id,
      String name,
      @JsonKey(name: 'photo_url')
          String? photoUrl,
      String? description,
      @JsonKey(name: 'external_links_json')
          Map<String, dynamic>? externalLinksJson,
      @JsonKey(name: 'welcome_to_team_json')
          Map<String, dynamic>? welcomeToTeamJson,
      @JsonKey(name: 'created_by')
          String createdBy,
      @JsonKey(name: 'created_by_user')
          User? createdByUser,
      @JsonKey(name: 'created_at')
          DateTime? createdAt,
      @JsonKey(name: 'updated_at')
          DateTime? updatedAt,
      @JsonKey(name: 'deleted_at')
          DateTime? deletedAt});

  @override
  $UserCopyWith<$Res>? get createdByUser;
}

/// @nodoc
class __$TeamCopyWithImpl<$Res> extends _$TeamCopyWithImpl<$Res>
    implements _$TeamCopyWith<$Res> {
  __$TeamCopyWithImpl(_Team _value, $Res Function(_Team) _then)
      : super(_value, (v) => _then(v as _Team));

  @override
  _Team get _value => super._value as _Team;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? photoUrl = freezed,
    Object? description = freezed,
    Object? externalLinksJson = freezed,
    Object? welcomeToTeamJson = freezed,
    Object? createdBy = freezed,
    Object? createdByUser = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? deletedAt = freezed,
  }) {
    return _then(_Team(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrl: photoUrl == freezed
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      externalLinksJson: externalLinksJson == freezed
          ? _value.externalLinksJson
          : externalLinksJson // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      welcomeToTeamJson: welcomeToTeamJson == freezed
          ? _value.welcomeToTeamJson
          : welcomeToTeamJson // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
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
class _$_Team extends _Team {
  _$_Team(
      {this.id,
      required this.name,
      @JsonKey(name: 'photo_url') this.photoUrl,
      this.description,
      @JsonKey(name: 'external_links_json') this.externalLinksJson,
      @JsonKey(name: 'welcome_to_team_json') this.welcomeToTeamJson,
      @JsonKey(name: 'created_by') required this.createdBy,
      @JsonKey(name: 'created_by_user') this.createdByUser,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt,
      @JsonKey(name: 'deleted_at') this.deletedAt})
      : super._();

  factory _$_Team.fromJson(Map<String, dynamic> json) =>
      _$_$_TeamFromJson(json);

  @override
  final String? id;
  @override
  final String name;
  @override
  @JsonKey(name: 'photo_url')
  final String? photoUrl;
  @override
  final String? description;
  @override
  @JsonKey(name: 'external_links_json')
  final Map<String, dynamic>? externalLinksJson;
  @override
  @JsonKey(name: 'welcome_to_team_json')
  final Map<String, dynamic>? welcomeToTeamJson;
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
    return 'Team(id: $id, name: $name, photoUrl: $photoUrl, description: $description, externalLinksJson: $externalLinksJson, welcomeToTeamJson: $welcomeToTeamJson, createdBy: $createdBy, createdByUser: $createdByUser, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Team &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.photoUrl, photoUrl) ||
                const DeepCollectionEquality()
                    .equals(other.photoUrl, photoUrl)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.externalLinksJson, externalLinksJson) ||
                const DeepCollectionEquality()
                    .equals(other.externalLinksJson, externalLinksJson)) &&
            (identical(other.welcomeToTeamJson, welcomeToTeamJson) ||
                const DeepCollectionEquality()
                    .equals(other.welcomeToTeamJson, welcomeToTeamJson)) &&
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
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(photoUrl) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(externalLinksJson) ^
      const DeepCollectionEquality().hash(welcomeToTeamJson) ^
      const DeepCollectionEquality().hash(createdBy) ^
      const DeepCollectionEquality().hash(createdByUser) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(updatedAt) ^
      const DeepCollectionEquality().hash(deletedAt);

  @JsonKey(ignore: true)
  @override
  _$TeamCopyWith<_Team> get copyWith =>
      __$TeamCopyWithImpl<_Team>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_TeamToJson(this);
  }
}

abstract class _Team extends Team {
  factory _Team(
      {String? id,
      required String name,
      @JsonKey(name: 'photo_url')
          String? photoUrl,
      String? description,
      @JsonKey(name: 'external_links_json')
          Map<String, dynamic>? externalLinksJson,
      @JsonKey(name: 'welcome_to_team_json')
          Map<String, dynamic>? welcomeToTeamJson,
      @JsonKey(name: 'created_by')
          required String createdBy,
      @JsonKey(name: 'created_by_user')
          User? createdByUser,
      @JsonKey(name: 'created_at')
          DateTime? createdAt,
      @JsonKey(name: 'updated_at')
          DateTime? updatedAt,
      @JsonKey(name: 'deleted_at')
          DateTime? deletedAt}) = _$_Team;
  _Team._() : super._();

  factory _Team.fromJson(Map<String, dynamic> json) = _$_Team.fromJson;

  @override
  String? get id => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'photo_url')
  String? get photoUrl => throw _privateConstructorUsedError;
  @override
  String? get description => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'external_links_json')
  Map<String, dynamic>? get externalLinksJson =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'welcome_to_team_json')
  Map<String, dynamic>? get welcomeToTeamJson =>
      throw _privateConstructorUsedError;
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
  _$TeamCopyWith<_Team> get copyWith => throw _privateConstructorUsedError;
}
