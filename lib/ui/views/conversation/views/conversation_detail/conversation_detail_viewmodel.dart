import 'package:comradery/app.dart';
import 'package:comradery/common/supabase/supabase_client.dart';
import 'package:comradery/conversation/models/conversation.dart';
import 'package:comradery/conversation/services/conversation_service.dart';
import 'package:logger/logger.dart';
import 'package:postgrest/postgrest.dart';
import 'package:stacked/stacked.dart';

class ConversationDetailViewModel extends BaseViewModel {
  final log = Logger();

  final _conversationService = locator<ConversationService>();

  ConversationDetailViewModel({
    required this.conversationId,
  });

  final String conversationId;

  Conversation? _conversation;
  Conversation? get conversation => _conversation;
  String get _fetchConversationKey => '_fetchConversationKey';
  bool get fetchConversationBusy => busy(_fetchConversationKey);

  Future<void> init() async {
    await Future.wait([fetchConversation()]);
  }

  Future<void> fetchConversation() async {
    final response = await runBusyFuture<PostgrestResponse>(
      supabase
          .from(_conversationService.table)
          .select(
            '*, conversation_participants: conversation_participants (*, user: users (*))',
          )
          .eq('id', conversationId)
          .single()
          .execute(),
      busyObject: _fetchConversationKey,
      throwException: true,
    );
    log.v('response "${response.toJson()}"');
    log.i(response.toJson());

    if (response.error != null) {
      log.e(response.error?.message);
      return;
    }

    _conversation = Conversation.fromJson(response.data);
    notifyListeners();
  }
}
