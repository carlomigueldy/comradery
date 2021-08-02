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
      log.v('cpResponse "${cpResponse.toJson()}"');
    }

    return response;
  }

  Future<PostgrestResponse> findExistingConversation(User targetUser) async {
    return supabase
        .from('conversations')
        .select(
          'id, conversation_participant: conversation_participants (user_id, user: users (first_name, last_name, email) )',
        )
        .eq('conversation_participant.user_id', targetUser.id!)
        .eq('conversation_participant.user_id', _authService.user!.id!)
        // .or(
        //   'created_by.eq.${targetUser!.id!},created_by.eq.${_authService.user!.id}',
        // )
        .execute();
  }
}
