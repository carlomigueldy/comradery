// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_interest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserInterest _$_$_UserInterestFromJson(Map<String, dynamic> json) {
  return _$_UserInterest(
    id: json['id'] as String?,
    interestId: json['interest_id'] as String,
    interest: json['interest'] == null
        ? null
        : Interest.fromJson(json['interest'] as Map<String, dynamic>),
    userId: json['user_id'] as String,
    user: json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>),
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

Map<String, dynamic> _$_$_UserInterestToJson(_$_UserInterest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'interest_id': instance.interestId,
      'interest': instance.interest,
      'user_id': instance.userId,
      'user': instance.user,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'deleted_at': instance.deletedAt?.toIso8601String(),
    };
