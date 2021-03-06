// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Conversation _$_$_ConversationFromJson(Map<String, dynamic> json) {
  return _$_Conversation(
    id: json['id'] as String?,
    name: json['name'] as String?,
    type: _$enumDecodeNullable(_$ConversationTypeEnumMap, json['type']) ??
        ConversationType.private,
    participants: (json['conversation_participants'] as List<dynamic>?)
        ?.map(
            (e) => ConversationParticipant.fromJson(e as Map<String, dynamic>))
        .toList(),
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

Map<String, dynamic> _$_$_ConversationToJson(_$_Conversation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': _$ConversationTypeEnumMap[instance.type],
      'conversation_participants': instance.participants,
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

K? _$enumDecodeNullable<K, V>(
  Map<K, V> enumValues,
  dynamic source, {
  K? unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<K, V>(enumValues, source, unknownValue: unknownValue);
}

const _$ConversationTypeEnumMap = {
  ConversationType.private: 'private',
  ConversationType.team: 'team',
};
