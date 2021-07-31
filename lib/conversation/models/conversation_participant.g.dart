// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation_participant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ConversationParticipant _$_$_ConversationParticipantFromJson(
    Map<String, dynamic> json) {
  return _$_ConversationParticipant(
    userId: json['user_id'] as String,
    user: json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>),
    conversationId: json['conversation_id'] as String,
    conversation: json['conversation'] == null
        ? null
        : Conversation.fromJson(json['conversation'] as Map<String, dynamic>),
    createdAt: json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String),
    updatedAt: json['updated_at'] == null
        ? null
        : DateTime.parse(json['updated_at'] as String),
    deletedAt: json['deleted_at'] == null
        ? null
        : DateTime.parse(json['deleted_at'] as String),
  );
}

Map<String, dynamic> _$_$_ConversationParticipantToJson(
        _$_ConversationParticipant instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'user': instance.user,
      'conversation_id': instance.conversationId,
      'conversation': instance.conversation,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'deleted_at': instance.deletedAt?.toIso8601String(),
    };
