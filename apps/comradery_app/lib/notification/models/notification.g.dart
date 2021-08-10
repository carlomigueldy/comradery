// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Notification _$_$_NotificationFromJson(Map<String, dynamic> json) {
  return _$_Notification(
    id: json['id'] as String?,
    userId: json['user_id'] as String,
    user: json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>),
    notifiableId: json['notifiable_id'] as String,
    notifiableType: json['notifiable_type'] as String,
    type: _$enumDecode(_$NotificationTypeEnumMap, json['type']),
    readAt: json['read_at'] == null
        ? null
        : DateTime.parse(json['read_at'] as String),
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

Map<String, dynamic> _$_$_NotificationToJson(_$_Notification instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'user': instance.user,
      'notifiable_id': instance.notifiableId,
      'notifiable_type': instance.notifiableType,
      'type': _$NotificationTypeEnumMap[instance.type],
      'read_at': instance.readAt?.toIso8601String(),
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

const _$NotificationTypeEnumMap = {
  NotificationType.teamJoinRequestAccepted: 'team_join_request_accepted',
  NotificationType.teamJoinRequestRejected: 'team_join_request_rejected',
  NotificationType.teamInviteAccepted: 'team_invite_accepted',
  NotificationType.teamInviteRejected: 'team_invite_rejected',
  NotificationType.newMatch: 'new_match',
};
