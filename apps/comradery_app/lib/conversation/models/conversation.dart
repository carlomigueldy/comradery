import 'package:comradery/conversation/models/conversation_participant.dart';
import 'package:comradery/user/models/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'conversation.freezed.dart';
part 'conversation.g.dart';

enum ConversationType {
  @JsonValue('private')
  private,
  @JsonValue('team')
  team,
}

@freezed
class Conversation with _$Conversation {
  const Conversation._();

  factory Conversation({
    String? id,
    String? name,
    @Default(ConversationType.private)
        ConversationType type,
    @JsonKey(
      name: 'conversation_participants',
    )
        List<ConversationParticipant>? participants,
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
  }) = _Conversation;

  factory Conversation.fromJson(Map<String, dynamic> json) =>
      _$ConversationFromJson(json);

  String get formattedCreatedAt {
    return DateFormat('EEEE M/d/y').format(createdAt!);
  }

  String get formattedUpdatedAt {
    return DateFormat('EEEE M/d/y').format(updatedAt!);
  }

  String get formattedDeletedAt {
    return DateFormat('EEEE M/d/y').format(deletedAt!);
  }

  String get participantNames {
    if (participants == null) return 'Unknown';

    return participants!.map((e) => e.user?.fullName ?? '').toList().join(', ');
  }

  List<String> get participantIds {
    if (participants == null) return [];

    return participants!.map((e) => e.userId).toList();
  }

  Map<String, dynamic> toPayload() {
    final json = toJson();
    json.remove('id');
    json.remove('created_at');
    json.remove('updated_at');
    json.remove('deleted_at');
    json.remove('created_by_user');
    json.remove('conversation_participants');
    return json;
  }
}
