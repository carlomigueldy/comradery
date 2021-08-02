import 'package:comradery/app.dart';
import 'package:comradery/auth/services/auth_service.dart';
import 'package:comradery/common/supabase/supabase_client.dart';
import 'package:comradery/conversation/models/conversation.dart';
import 'package:comradery/conversation/models/conversation_participant.dart';
import 'package:comradery/conversation/services/conversation_participant_service.dart';
import 'package:comradery/conversation/services/conversation_service.dart';
import 'package:comradery/user/models/user.dart';
import 'package:comradery/user/services/user_service.dart';
import 'package:logger/logger.dart';
import 'package:postgrest/postgrest.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class UserDetailViewModel extends BaseViewModel {
  final log = Logger();
  final _authService = locator<AuthService>();
  final _userService = locator<UserService>();
  final _conversationService = locator<ConversationService>();
  final _router = locator<NavigationService>();

  UserDetailViewModel({
    required this.userId,
  });

  final String? userId;

  User? _user;
  User? get user => _user;
  String get _fetchUserKey => '_fetchUserKey';
  bool get fetchUserBusy => busy(_fetchUserKey);

  String get _createConversationKey => '_createConversationKey';
  bool get createConversationBusy => busy(_createConversationKey);

  String get _createConversationParticipantsKey =>
      '_createConversationParticipantsKey';
  bool get createConversationParticipantsBusy =>
      busy(_createConversationParticipantsKey);

  String get _checkExistingConversationKey => '_checkExistingConversationKey';
  bool get checkExistingConversationBusy => busy(_checkExistingConversationKey);

  Future<void> init() async {
    await Future.wait([
      fetchUser(),
    ]);
  }

  Future<void> fetchUser() async {
    final response = await runBusyFuture<PostgrestResponse>(
      _userService.find(userId!),
      busyObject: _fetchUserKey,
      throwException: true,
    );

    if (response.error != null) {
      log.e(response.error?.message);
      return;
    }

    _user = User.fromJson(response.data);
    notifyListeners();
  }

  Future<void> startConversation() async {
    final conversationId = await existingConversation();

    if (conversationId != null) {
      // navigate to conversation view
      return _router.replaceWith(
        AppViewRoutes.conversationDetailView(conversationId: conversationId),
        id: AppRouterId.appView,
      );
    }

    // create converastion
    final response = await runBusyFuture<PostgrestResponse>(
      _conversationService.startConversation(user!),
      busyObject: _createConversationKey,
      throwException: true,
    );
    log.v('response "${response.toJson()}"');
    final conversation = Conversation.fromJson(response.data.first);

    // navigate to conversation view
    _router.replaceWith(
      AppViewRoutes.conversationDetailView(conversationId: conversation.id!),
      id: AppRouterId.appView,
    );
  }

  Future<String?> existingConversation() async {
    final response = await runBusyFuture<PostgrestResponse>(
      _conversationService.findExistingConversation(user!),
      busyObject: _checkExistingConversationKey,
      throwException: true,
    );
    log.v('response "${response.toJson()}"');

    if (response.data.length == 0) return null;

    final data = (response.data as List<dynamic>);

    try {
      return data
          .where((e) => e['conversation_participant'].length > 0)
          .toList()
          .first['id'];
    } catch (e) {
      return null;
    }
    // return response.data.first['id'];
  }
}
