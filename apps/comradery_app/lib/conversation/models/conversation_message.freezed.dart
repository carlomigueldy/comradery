// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'conversation_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ConversationMessage _$ConversationMessageFromJson(Map<String, dynamic> json) {
  return _ConversationMessage.fromJson(json);
}

/// @nodoc
class _$ConversationMessageTearOff {
  const _$ConversationMessageTearOff();

  _ConversationMessage call(
      {String? id,
      @JsonKey(name: 'conversation_id') required String conversationId,
      Conversation? conversation,
      required String content,
      required ConversationMessageType type,
      @JsonKey(name: 'created_by') required String createdBy,
      @JsonKey(name: 'created_by_user') User? createdByUser,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt,
      @JsonKey(name: 'deleted_at') DateTime? deletedAt}) {
    return _ConversationMessage(
      id: id,
      conversationId: conversationId,
      conversation: conversation,
      content: content,
      type: type,
      createdBy: createdBy,
      createdByUser: createdByUser,
      createdAt: createdAt,
      updatedAt: updatedAt,
      deletedAt: deletedAt,
    );
  }

  ConversationMessage fromJson(Map<String, Object> json) {
    return ConversationMessage.fromJson(json);
  }
}

/// @nodoc
const $ConversationMessage = _$ConversationMessageTearOff();

/// @nodoc
mixin _$ConversationMessage {
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'conversation_id')
  String get conversationId => throw _privateConstructorUsedError;
  Conversation? get conversation => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  ConversationMessageType get type => throw _privateConstructorUsedError;
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
  $ConversationMessageCopyWith<ConversationMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConversationMessageCopyWith<$Res> {
  factory $ConversationMessageCopyWith(
          ConversationMessage value, $Res Function(ConversationMessage) then) =
      _$ConversationMessageCopyWithImpl<$Res>;
  $Res call(
      {String? id,
      @JsonKey(name: 'conversation_id') String conversationId,
      Conversation? conversation,
      String content,
      ConversationMessageType type,
      @JsonKey(name: 'created_by') String createdBy,
      @JsonKey(name: 'created_by_user') User? createdByUser,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt,
      @JsonKey(name: 'deleted_at') DateTime? deletedAt});

  $ConversationCopyWith<$Res>? get conversation;
  $UserCopyWith<$Res>? get createdByUser;
}

/// @nodoc
class _$ConversationMessageCopyWithImpl<$Res>
    implements $ConversationMessageCopyWith<$Res> {
  _$ConversationMessageCopyWithImpl(this._value, this._then);

  final ConversationMessage _value;
  // ignore: unused_field
  final $Res Function(ConversationMessage) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? conversationId = freezed,
    Object? conversation = freezed,
    Object? content = freezed,
    Object? type = freezed,
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
      conversationId: conversationId == freezed
          ? _value.conversationId
          : conversationId // ignore: cast_nullable_to_non_nullable
              as String,
      conversation: conversation == freezed
          ? _value.conversation
          : conversation // ignore: cast_nullable_to_non_nullable
              as Conversation?,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ConversationMessageType,
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
  $ConversationCopyWith<$Res>? get conversation {
    if (_value.conversation == null) {
      return null;
    }

    return $ConversationCopyWith<$Res>(_value.conversation!, (value) {
      return _then(_value.copyWith(conversation: value));
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
abstract class _$ConversationMessageCopyWith<$Res>
    implements $ConversationMessageCopyWith<$Res> {
  factory _$ConversationMessageCopyWith(_ConversationMessage value,
          $Res Function(_ConversationMessage) then) =
      __$ConversationMessageCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id,
      @JsonKey(name: 'conversation_id') String conversationId,
      Conversation? conversation,
      String content,
      ConversationMessageType type,
      @JsonKey(name: 'created_by') String createdBy,
      @JsonKey(name: 'created_by_user') User? createdByUser,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt,
      @JsonKey(name: 'deleted_at') DateTime? deletedAt});

  @override
  $ConversationCopyWith<$Res>? get conversation;
  @override
  $UserCopyWith<$Res>? get createdByUser;
}

/// @nodoc
class __$ConversationMessageCopyWithImpl<$Res>
    extends _$ConversationMessageCopyWithImpl<$Res>
    implements _$ConversationMessageCopyWith<$Res> {
  __$ConversationMessageCopyWithImpl(
      _ConversationMessage _value, $Res Function(_ConversationMessage) _then)
      : super(_value, (v) => _then(v as _ConversationMessage));

  @override
  _ConversationMessage get _value => super._value as _ConversationMessage;

  @override
  $Res call({
    Object? id = freezed,
    Object? conversationId = freezed,
    Object? conversation = freezed,
    Object? content = freezed,
    Object? type = freezed,
    Object? createdBy = freezed,
    Object? createdByUser = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? deletedAt = freezed,
  }) {
    return _then(_ConversationMessage(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      conversationId: conversationId == freezed
          ? _value.conversationId
          : conversationId // ignore: cast_nullable_to_non_nullable
              as String,
      conversation: conversation == freezed
          ? _value.conversation
          : conversation // ignore: cast_nullable_to_non_nullable
              as Conversation?,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ConversationMessageType,
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
class _$_ConversationMessage extends _ConversationMessage {
  _$_ConversationMessage(
      {this.id,
      @JsonKey(name: 'conversation_id') required this.conversationId,
      this.conversation,
      required this.content,
      required this.type,
      @JsonKey(name: 'created_by') required this.createdBy,
      @JsonKey(name: 'created_by_user') this.createdByUser,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt,
      @JsonKey(name: 'deleted_at') this.deletedAt})
      : super._();

  factory _$_ConversationMessage.fromJson(Map<String, dynamic> json) =>
      _$_$_ConversationMessageFromJson(json);

  @override
  final String? id;
  @override
  @JsonKey(name: 'conversation_id')
  final String conversationId;
  @override
  final Conversation? conversation;
  @override
  final String content;
  @override
  final ConversationMessageType type;
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
    return 'ConversationMessage(id: $id, conversationId: $conversationId, conversation: $conversation, content: $content, type: $type, createdBy: $createdBy, createdByUser: $createdByUser, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ConversationMessage &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.conversationId, conversationId) ||
                const DeepCollectionEquality()
                    .equals(other.conversationId, conversationId)) &&
            (identical(other.conversation, conversation) ||
                const DeepCollectionEquality()
                    .equals(other.conversation, conversation)) &&
            (identical(other.content, content) ||
                const DeepCollectionEquality()
                    .equals(other.content, content)) &&
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
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(conversationId) ^
      const DeepCollectionEquality().hash(conversation) ^
      const DeepCollectionEquality().hash(content) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(createdBy) ^
      const DeepCollectionEquality().hash(createdByUser) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(updatedAt) ^
      const DeepCollectionEquality().hash(deletedAt);

  @JsonKey(ignore: true)
  @override
  _$ConversationMessageCopyWith<_ConversationMessage> get copyWith =>
      __$ConversationMessageCopyWithImpl<_ConversationMessage>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ConversationMessageToJson(this);
  }
}

abstract class _ConversationMessage extends ConversationMessage {
  factory _ConversationMessage(
          {String? id,
          @JsonKey(name: 'conversation_id') required String conversationId,
          Conversation? conversation,
          required String content,
          required ConversationMessageType type,
          @JsonKey(name: 'created_by') required String createdBy,
          @JsonKey(name: 'created_by_user') User? createdByUser,
          @JsonKey(name: 'created_at') DateTime? createdAt,
          @JsonKey(name: 'updated_at') DateTime? updatedAt,
          @JsonKey(name: 'deleted_at') DateTime? deletedAt}) =
      _$_ConversationMessage;
  _ConversationMessage._() : super._();

  factory _ConversationMessage.fromJson(Map<String, dynamic> json) =
      _$_ConversationMessage.fromJson;

  @override
  String? get id => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'conversation_id')
  String get conversationId => throw _privateConstructorUsedError;
  @override
  Conversation? get conversation => throw _privateConstructorUsedError;
  @override
  String get content => throw _privateConstructorUsedError;
  @override
  ConversationMessageType get type => throw _privateConstructorUsedError;
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
  _$ConversationMessageCopyWith<_ConversationMessage> get copyWith =>
      throw _privateConstructorUsedError;
}
