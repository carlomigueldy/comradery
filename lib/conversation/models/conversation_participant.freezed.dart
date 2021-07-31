// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'conversation_participant.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ConversationParticipant _$ConversationParticipantFromJson(
    Map<String, dynamic> json) {
  return _ConversationParticipant.fromJson(json);
}

/// @nodoc
class _$ConversationParticipantTearOff {
  const _$ConversationParticipantTearOff();

  _ConversationParticipant call(
      {@JsonKey(name: 'user_id') required String userId,
      User? user,
      @JsonKey(name: 'conversation_id') required String conversationId,
      Conversation? conversation,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt,
      @JsonKey(name: 'deleted_at') DateTime? deletedAt}) {
    return _ConversationParticipant(
      userId: userId,
      user: user,
      conversationId: conversationId,
      conversation: conversation,
      createdAt: createdAt,
      updatedAt: updatedAt,
      deletedAt: deletedAt,
    );
  }

  ConversationParticipant fromJson(Map<String, Object> json) {
    return ConversationParticipant.fromJson(json);
  }
}

/// @nodoc
const $ConversationParticipant = _$ConversationParticipantTearOff();

/// @nodoc
mixin _$ConversationParticipant {
  @JsonKey(name: 'user_id')
  String get userId => throw _privateConstructorUsedError;
  User? get user => throw _privateConstructorUsedError;
  @JsonKey(name: 'conversation_id')
  String get conversationId => throw _privateConstructorUsedError;
  Conversation? get conversation => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'deleted_at')
  DateTime? get deletedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConversationParticipantCopyWith<ConversationParticipant> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConversationParticipantCopyWith<$Res> {
  factory $ConversationParticipantCopyWith(ConversationParticipant value,
          $Res Function(ConversationParticipant) then) =
      _$ConversationParticipantCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'user_id') String userId,
      User? user,
      @JsonKey(name: 'conversation_id') String conversationId,
      Conversation? conversation,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt,
      @JsonKey(name: 'deleted_at') DateTime? deletedAt});

  $UserCopyWith<$Res>? get user;
  $ConversationCopyWith<$Res>? get conversation;
}

/// @nodoc
class _$ConversationParticipantCopyWithImpl<$Res>
    implements $ConversationParticipantCopyWith<$Res> {
  _$ConversationParticipantCopyWithImpl(this._value, this._then);

  final ConversationParticipant _value;
  // ignore: unused_field
  final $Res Function(ConversationParticipant) _then;

  @override
  $Res call({
    Object? userId = freezed,
    Object? user = freezed,
    Object? conversationId = freezed,
    Object? conversation = freezed,
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
      conversationId: conversationId == freezed
          ? _value.conversationId
          : conversationId // ignore: cast_nullable_to_non_nullable
              as String,
      conversation: conversation == freezed
          ? _value.conversation
          : conversation // ignore: cast_nullable_to_non_nullable
              as Conversation?,
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
  $ConversationCopyWith<$Res>? get conversation {
    if (_value.conversation == null) {
      return null;
    }

    return $ConversationCopyWith<$Res>(_value.conversation!, (value) {
      return _then(_value.copyWith(conversation: value));
    });
  }
}

/// @nodoc
abstract class _$ConversationParticipantCopyWith<$Res>
    implements $ConversationParticipantCopyWith<$Res> {
  factory _$ConversationParticipantCopyWith(_ConversationParticipant value,
          $Res Function(_ConversationParticipant) then) =
      __$ConversationParticipantCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'user_id') String userId,
      User? user,
      @JsonKey(name: 'conversation_id') String conversationId,
      Conversation? conversation,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt,
      @JsonKey(name: 'deleted_at') DateTime? deletedAt});

  @override
  $UserCopyWith<$Res>? get user;
  @override
  $ConversationCopyWith<$Res>? get conversation;
}

/// @nodoc
class __$ConversationParticipantCopyWithImpl<$Res>
    extends _$ConversationParticipantCopyWithImpl<$Res>
    implements _$ConversationParticipantCopyWith<$Res> {
  __$ConversationParticipantCopyWithImpl(_ConversationParticipant _value,
      $Res Function(_ConversationParticipant) _then)
      : super(_value, (v) => _then(v as _ConversationParticipant));

  @override
  _ConversationParticipant get _value =>
      super._value as _ConversationParticipant;

  @override
  $Res call({
    Object? userId = freezed,
    Object? user = freezed,
    Object? conversationId = freezed,
    Object? conversation = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? deletedAt = freezed,
  }) {
    return _then(_ConversationParticipant(
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      conversationId: conversationId == freezed
          ? _value.conversationId
          : conversationId // ignore: cast_nullable_to_non_nullable
              as String,
      conversation: conversation == freezed
          ? _value.conversation
          : conversation // ignore: cast_nullable_to_non_nullable
              as Conversation?,
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
class _$_ConversationParticipant extends _ConversationParticipant {
  _$_ConversationParticipant(
      {@JsonKey(name: 'user_id') required this.userId,
      this.user,
      @JsonKey(name: 'conversation_id') required this.conversationId,
      this.conversation,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt,
      @JsonKey(name: 'deleted_at') this.deletedAt})
      : super._();

  factory _$_ConversationParticipant.fromJson(Map<String, dynamic> json) =>
      _$_$_ConversationParticipantFromJson(json);

  @override
  @JsonKey(name: 'user_id')
  final String userId;
  @override
  final User? user;
  @override
  @JsonKey(name: 'conversation_id')
  final String conversationId;
  @override
  final Conversation? conversation;
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
    return 'ConversationParticipant(userId: $userId, user: $user, conversationId: $conversationId, conversation: $conversation, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ConversationParticipant &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)) &&
            (identical(other.conversationId, conversationId) ||
                const DeepCollectionEquality()
                    .equals(other.conversationId, conversationId)) &&
            (identical(other.conversation, conversation) ||
                const DeepCollectionEquality()
                    .equals(other.conversation, conversation)) &&
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
      const DeepCollectionEquality().hash(conversationId) ^
      const DeepCollectionEquality().hash(conversation) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(updatedAt) ^
      const DeepCollectionEquality().hash(deletedAt);

  @JsonKey(ignore: true)
  @override
  _$ConversationParticipantCopyWith<_ConversationParticipant> get copyWith =>
      __$ConversationParticipantCopyWithImpl<_ConversationParticipant>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ConversationParticipantToJson(this);
  }
}

abstract class _ConversationParticipant extends ConversationParticipant {
  factory _ConversationParticipant(
          {@JsonKey(name: 'user_id') required String userId,
          User? user,
          @JsonKey(name: 'conversation_id') required String conversationId,
          Conversation? conversation,
          @JsonKey(name: 'created_at') DateTime? createdAt,
          @JsonKey(name: 'updated_at') DateTime? updatedAt,
          @JsonKey(name: 'deleted_at') DateTime? deletedAt}) =
      _$_ConversationParticipant;
  _ConversationParticipant._() : super._();

  factory _ConversationParticipant.fromJson(Map<String, dynamic> json) =
      _$_ConversationParticipant.fromJson;

  @override
  @JsonKey(name: 'user_id')
  String get userId => throw _privateConstructorUsedError;
  @override
  User? get user => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'conversation_id')
  String get conversationId => throw _privateConstructorUsedError;
  @override
  Conversation? get conversation => throw _privateConstructorUsedError;
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
  _$ConversationParticipantCopyWith<_ConversationParticipant> get copyWith =>
      throw _privateConstructorUsedError;
}
