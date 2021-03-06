import 'package:comradery/app.dart';
import 'package:comradery/auth/services/auth_service.dart';
import 'package:comradery/common/supabase/supabase_client.dart';
import 'package:comradery/common/supabase/supabase_service.dart';
import 'package:comradery/conversation/models/conversation.dart';
import 'package:comradery/conversation/models/conversation_participant.dart';
import 'package:comradery/user/models/user.dart';
import 'package:postgrest/postgrest.dart';

class ConversationService extends SupabaseService {
  final _authService = locator<AuthService>();

  @override
  String get table => 'conversations';

  /// Starts a conversation with a target user.
  Future<PostgrestResponse> startConversation(User targetUser) async {
    final response = await create(
      Conversation(
        createdBy: _authService.user!.id!,
      ).toPayload(),
    );
    log.v(
      'ConversationService.startConversation response "${response.toJson()}"',
    );

    if (response.error == null) {
      final conversation = Conversation.fromJson(response.data.first);

      // conversation participants
      final cpResponse =
          await supabase.from('conversation_participants').insert([
        ConversationParticipant(
          userId: targetUser.id!,
          conversationId: conversation.id!,
        ).toPayload(),
        ConversationParticipant(
          userId: _authService.user!.id!,
          conversationId: conversation.id!,
        ).toPayload(),
      ]).execute();
      log.v('ConversationService_cpResponse "${cpResponse.toJson()}"');

      if (cpResponse.error != null) {
        log.e(
            'ConversationService_cpResponse.error "${cpResponse.error?.message}"');
      }
    }

    if (response.error != null) {
      log.e('ConversationService_response.error "${response.error?.message}"');
    }

    return response;
  }

  // Future<PostgrestResponse> findExistingConversation(User targetUser) async {
  //   return await supabase
  //       .from('conversations')
  //       .select(
  //         'id, conversation_participants: conversation_participants (user_id)',
  //       )
  //       .in_('conversation_participants.user_id', [
  //         targetUser.id!,
  //         _authService.user!.id!,
  //       ])
  //       .limit(1)
  //       .single()
  //       .execute();
  // }
}
