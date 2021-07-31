// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Team _$_$_TeamFromJson(Map<String, dynamic> json) {
  return _$_Team(
    id: json['id'] as String?,
    name: json['name'] as String,
    photoUrl: json['photo_url'] as String?,
    description: json['description'] as String?,
    externalLinksJson: json['external_links_json'] as Map<String, dynamic>?,
    welcomeToTeamJson: json['welcome_to_team_json'] as Map<String, dynamic>?,
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

Map<String, dynamic> _$_$_TeamToJson(_$_Team instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'photo_url': instance.photoUrl,
      'description': instance.description,
      'external_links_json': instance.externalLinksJson,
      'welcome_to_team_json': instance.welcomeToTeamJson,
      'created_by': instance.createdBy,
      'created_by_user': instance.createdByUser,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'deleted_at': instance.deletedAt?.toIso8601String(),
    };
