// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team_member.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TeamMember _$_$_TeamMemberFromJson(Map<String, dynamic> json) {
  return _$_TeamMember(
    userId: json['user_id'] as String,
    user: json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>),
    teamId: json['team_id'] as String,
    team: json['team'] == null
        ? null
        : Team.fromJson(json['team'] as Map<String, dynamic>),
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

Map<String, dynamic> _$_$_TeamMemberToJson(_$_TeamMember instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'user': instance.user,
      'team_id': instance.teamId,
      'team': instance.team,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'deleted_at': instance.deletedAt?.toIso8601String(),
    };
