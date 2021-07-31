import 'package:comradery/user/models/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

import 'conversation.dart';

part 'conversation_message.freezed.dart';
part 'conversation_message.g.dart';

enum ConversationMessageType {
  @JsonValue('text')
  text,

  @JsonValue('giphy')
  giphy,

  @JsonValue('photo')
  photo,

  @JsonValue('video')
  video,
}

@freezed
class ConversationMessage with _$ConversationMessage {
  const ConversationMessage._();

  factory ConversationMessage({
    String? id,
    @JsonKey(
      name: 'conversation_id',
    )
        required String conversationId,
    Conversation? conversation,
    required String content,
    required ConversationMessageType type,
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
  }) = _ConversationMessage;

  factory ConversationMessage.fromJson(Map<String, dynamic> json) =>
      _$ConversationMessageFromJson(json);

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
    json.remove('created_by_user');
    json.remove('conversation');
    return json;
  }
}
