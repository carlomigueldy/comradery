// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ConversationMessage _$_$_ConversationMessageFromJson(
    Map<String, dynamic> json) {
  return _$_ConversationMessage(
    id: json['id'] as String?,
    conversationId: json['conversation_id'] as String,
    conversation: json['conversation'] == null
        ? null
        : Conversation.fromJson(json['conversation'] as Map<String, dynamic>),
    content: json['content'] as String,
    type: _$enumDecode(_$ConversationMessageTypeEnumMap, json['type']),
    createdBy: json['created_by'] as String,
    createdByUser: json['created_by_user'] == null
        ? null
        : User.fromJson(json['created_by_user'] as Map<String, dynamic>),
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

Map<String, dynamic> _$_$_ConversationMessageToJson(
        _$_ConversationMessage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'conversation_id': instance.conversationId,
      'conversation': instance.conversation,
      'content': instance.content,
      'type': _$ConversationMessageTypeEnumMap[instance.type],
      'created_by': instance.createdBy,
      'created_by_user': instance.createdByUser,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'deleted_at': instance.deletedAt?.toIso8601String(),
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

const _$ConversationMessageTypeEnumMap = {
  ConversationMessageType.text: 'text',
  ConversationMessageType.giphy: 'giphy',
  ConversationMessageType.photo: 'photo',
  ConversationMessageType.video: 'video',
};
