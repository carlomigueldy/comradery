import 'package:comradery/team/models/team.dart';
import 'package:comradery/user/models/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'team_request.freezed.dart';
part 'team_request.g.dart';

enum TeamRequestType {
  @JsonValue('invite')
  invite,
  @JsonValue('join_request')
  joinRequest,
}

@freezed
class TeamRequest with _$TeamRequest {
  const TeamRequest._();

  factory TeamRequest({
    @JsonKey(
      name: 'user_id',
    )
        required String userId,
    User? user,
    @JsonKey(
      name: 'team_id',
    )
        required String teamId,
    Team? team,
    required TeamRequestType type,
    @JsonKey(
      name: 'created_by',
    )
        required String createdBy,
    @JsonKey(
      name: 'created_by_user',
    )
        User? createdByUser,
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
  }) = _TeamRequest;

  factory TeamRequest.fromJson(Map<String, dynamic> json) =>
      _$TeamRequestFromJson(json);

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
    json.remove('user');
    json.remove('team');
    json.remove('created_by_user');
    return json;
  }
}
