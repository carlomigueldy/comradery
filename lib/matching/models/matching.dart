import 'package:comradery/user/models/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'matching.freezed.dart';
part 'matching.g.dart';

@freezed
class Matching with _$Matching {
  const Matching._();

  factory Matching({
    String? id,
    @JsonKey(
      name: 'target_user_id',
    )
        required String targetUserId,
    @JsonKey(
      name: 'target_user',
    )
        User? targetUser,
    @Default(false)
        bool liked,
    @JsonKey(
      name: 'created_by',
    )
        required String createdBy,
    @JsonKey(
      name: 'read_at',
    )
        DateTime? readAt,
    @JsonKey(
      name: 'created_at',
    )
        DateTime? createdAt,
    @JsonKey(
      name: 'updated_at',
    )
        DateTime? updatedAt,
    @JsonKey(
      name: 'deleted_at',
    )
        DateTime? deletedAt,
  }) = _Matching;

  factory Matching.fromJson(Map<String, dynamic> json) =>
      _$MatchingFromJson(json);

  String get formattedCreatedAt {
    return DateFormat('EEEE M/d/y').format(createdAt!);
  }

  String get formattedUpdatedAt {
    return DateFormat('EEEE M/d/y').format(updatedAt!);
  }

  String get formattedDeletedAt {
    return DateFormat('EEEE M/d/y').format(deletedAt!);
  }

  Map<String, dynamic> toPayload() {
    final json = toJson();
    json.remove('id');
    json.remove('created_at');
    json.remove('updated_at');
    json.remove('deleted_at');
    json.remove('target_user');
    json.remove('created_by_user');
    return json;
  }
}
