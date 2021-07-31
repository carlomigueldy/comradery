import 'package:comradery/user/models/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'notification.freezed.dart';
part 'notification.g.dart';

enum NotificationType {
  @JsonValue('team_join_request_accepted')
  teamJoinRequestAccepted,
  @JsonValue('team_join_request_rejected')
  teamJoinRequestRejected,
  @JsonValue('team_invite_accepted')
  teamInviteAccepted,
  @JsonValue('team_invite_rejected')
  teamInviteRejected,
  @JsonValue('new_match')
  newMatch
}

@freezed
class Notification with _$Notification {
  const Notification._();

  factory Notification({
    String? id,
    @JsonKey(
      name: 'user_id',
    )
        required String userId,
    User? user,
    @JsonKey(
      name: 'notifiable_id',
    )
        required String notifiableId,
    @JsonKey(
      name: 'notifiable_type',
    )
        required String notifiableType,
    required NotificationType type,
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
  }) = _Notification;

  factory Notification.fromJson(Map<String, dynamic> json) =>
      _$NotificationFromJson(json);

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
    return json;
  }
}
