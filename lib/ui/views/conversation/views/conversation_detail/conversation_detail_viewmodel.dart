import 'package:comradery/app.dart';
import 'package:comradery/auth/services/auth_service.dart';
import 'package:comradery/common/supabase/supabase_client.dart';
import 'package:comradery/conversation/models/conversation.dart';
import 'package:comradery/conversation/models/conversation_message.dart';
import 'package:comradery/conversation/models/conversation_participant.dart';
import 'package:comradery/conversation/services/conversation_message_service.dart';
import 'package:comradery/conversation/services/conversation_service.dart';
import 'package:comradery/team/models/team_request.dart';
import 'package:comradery/team/services/team_request_service.dart';
import 'package:comradery/user/models/user.dart' as user;
import 'package:flutter/src/widgets/framework.dart';
import 'package:logger/logger.dart';
import 'package:postgrest/postgrest.dart';
import 'package:stacked/stacked.dart';
import 'package:supabase/supabase.dart';

class ConversationDetailViewModel extends BaseViewModel {
  final log = Logger();
  final _authService = locator<AuthService>();

  final _conversationService = locator<ConversationService>();
  final _messageService = locator<ConversationMessageService>();
  final _teamRequestService = locator<TeamRequestService>();

  ConversationDetailViewModel({
    required this.conversationId,
  });

  final String conversationId;

  String? _inputMessage = '';
  String? get inputMessage => _inputMessage;

  void onInputMessageChange(String? value) {
    // log.v('value "$value"');
    _inputMessage = value;
    notifyListeners();
  }

  Conversation? _conversation;
  Conversation? get conversation => _conversation;
  bool get hasConversation => _conversation != null;
  String get _fetchConversationKey => '_fetchConversationKey';
  bool get fetchConversationBusy => busy(_fetchConversationKey);

  ConversationType? get conversationType => _conversation?.type;

  List<ConversationMessage> _messages = [];
  List<ConversationMessage> get messages => _messages;
  String get _fetchMessagesKey => '_fetchMessagesKey';
  bool get fetchMessagesBusy => busy(_fetchMessagesKey);

  String get _sendMessageKey => '_sendMessageKey';
  bool get sendMessageBusy => busy(_sendMessageKey);

  List<user.User> _participants = [];
  List<user.User> get participants => _participants;
  String get _fetchParticipantsKey => '_fetchParticipantsKey';
  bool get fetchParticipantsBusy => busy(_fetchParticipantsKey);

  user.User? get _otherUser => participants
      .where((element) => element.id != _authService.user!.id!)
      .toList()
      .first;
  String get otherUserFullName => _otherUser?.fullName ?? '-';

  String get authUserId => _authService.user!.id!;
  String get authUserFullName => _authService.user!.fullName;

  Future<void> init() async {
    await fetchConversation();
    await fetchParticipants();
    await fetchMessages();

    supabase
        .from('conversation_messages:conversation_id=eq.$conversationId')
        .on(SupabaseEventTypes.insert, (payload) {
      log.v(
        'SupabaseEventTypes.insert: payload.newRecord "${payload.newRecord}"',
      );
      _messages.add(ConversationMessage.fromJson(payload.newRecord));
      notifyListeners();
    }).subscribe();
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
    log.v('fetchConversation_response "${response.toJson()}"');
    // log.i(response.toJson());

    if (response.error != null) {
      log.e(response.error?.message);
      return;
    }

    _conversation = Conversation.fromJson(response.data);
    notifyListeners();
  }

  Future<void> fetchParticipants() async {
    final response = await runBusyFuture<PostgrestResponse>(
      supabase
          .from('conversation_participants')
          .select(
            '*, user: users (*)',
          )
          .eq('conversation_id', conversationId)
          .execute(),
      busyObject: _fetchParticipantsKey,
      throwException: true,
    );
    log.v('fetchParticipants_response "${response.toJson()}"');

    if (response.error != null) {
      log.e(response.error?.message);
      return;
    }

    _participants = (response.data as List).map((e) {
      // log.v('e "${e['user']}"');

      return user.User.fromJson(e['user']);
    }).toList();
    notifyListeners();
  }

  Future<void> fetchMessages() async {
    final response = await runBusyFuture<PostgrestResponse>(
      supabase
          .from('conversation_messages')
          .select()
          .eq('conversation_id', conversationId)
          .execute(),
      busyObject: _fetchMessagesKey,
      throwException: true,
    );
    // log.v('fetchMessages_response "${response.toJson()}"');
    // log.i(response.toJson());

    if (response.error != null) {
      log.e(response.error?.message);
      return;
    }

    _messages = (response.data as List<dynamic>)
        .map((e) => ConversationMessage.fromJson(e))
        .toList();
    notifyListeners();
  }

  Future<void> sendMessage() async {
    if (_inputMessage == null || _inputMessage?.isEmpty == true) {
      return;
    }

    final response = await runBusyFuture<PostgrestResponse>(
      supabase
          .from('conversation_messages')
          .insert(
            ConversationMessage(
              content: _inputMessage!,
              type: ConversationMessageType.text,
              conversationId: conversationId,
              createdBy: authUserId,
            ).toPayload(),
          )
          .execute(),
      busyObject: _sendMessageKey,
      throwException: true,
    );
    log.v('sendMessage_response "${response.toJson()}"');
    // log.i(response.toJson());

    if (response.error != null) {
      log.e(response.error?.message);
      return;
    }

    _inputMessage = '';
    notifyListeners();
  }

  void inviteToTeam() {
    log.v('Invited to team');
    _teamRequestService.create(
      TeamRequest(
        userId: _otherUser!.id!,
        teamId: 'teamId',
        type: TeamRequestType.invite,
        createdBy: _authService.user!.id!,
      ).toPayload(),
    );
  }

  void requestToJoinTeam() {
    log.v('Requested to join team');
  }
}
