// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'matching.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Matching _$_$_MatchingFromJson(Map<String, dynamic> json) {
  return _$_Matching(
    id: json['id'] as String?,
    userId: json['user_id'] as String,
    targetUser: json['target_user'] == null
        ? null
        : User.fromJson(json['target_user'] as Map<String, dynamic>),
    liked: json['liked'] as bool? ?? false,
    createdBy: json['created_by'] as String,
    createdByUser: json['created_by_user'] == null
        ? null
        : User.fromJson(json['created_by_user'] as Map<String, dynamic>),
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

Map<String, dynamic> _$_$_MatchingToJson(_$_Matching instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'target_user': instance.targetUser,
      'liked': instance.liked,
      'created_by': instance.createdBy,
      'created_by_user': instance.createdByUser,
      'read_at': instance.readAt?.toIso8601String(),
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'deleted_at': instance.deletedAt?.toIso8601String(),
    };
