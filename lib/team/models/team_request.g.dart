// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TeamRequest _$_$_TeamRequestFromJson(Map<String, dynamic> json) {
  return _$_TeamRequest(
    userId: json['user_id'] as String,
    user: json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>),
    teamId: json['team_id'] as String,
    team: json['team'] == null
        ? null
        : Team.fromJson(json['team'] as Map<String, dynamic>),
    type: _$enumDecode(_$TeamRequestTypeEnumMap, json['type']),
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

Map<String, dynamic> _$_$_TeamRequestToJson(_$_TeamRequest instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'user': instance.user,
      'team_id': instance.teamId,
      'team': instance.team,
      'type': _$TeamRequestTypeEnumMap[instance.type],
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

const _$TeamRequestTypeEnumMap = {
  TeamRequestType.invite: 'invite',
  TeamRequestType.joinRequest: 'join_request',
};
