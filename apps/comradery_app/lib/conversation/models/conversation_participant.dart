import 'package:comradery/user/models/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

import 'conversation.dart';

part 'conversation_participant.freezed.dart';
part 'conversation_participant.g.dart';

@freezed
class ConversationParticipant with _$ConversationParticipant {
  const ConversationParticipant._();

  factory ConversationParticipant({
    @JsonKey(
      name: 'user_id',
    )
        required String userId,
    User? user,
    @JsonKey(
      name: 'conversation_id',
    )
        required String conversationId,
    Conversation? conversation,
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
  }) = _ConversationParticipant;

  factory ConversationParticipant.fromJson(Map<String, dynamic> json) =>
      _$ConversationParticipantFromJson(json);

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
    json.remove('conversation');
    json.remove('user');
    return json;
  }
}
