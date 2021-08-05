import 'package:comradery/app.dart';
import 'package:comradery/auth/services/auth_service.dart';
import 'package:comradery/common/services/app_snackbar_service.dart';
import 'package:comradery/conversation/models/conversation.dart';
import 'package:comradery/conversation/services/conversation_service.dart';
import 'package:comradery/ui/views/app/app_viewmodel.dart';
import 'package:comradery/user/models/user.dart';
import 'package:comradery/user/services/user_service.dart';
import 'package:logger/logger.dart';
import 'package:postgrest/postgrest.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class UserDetailViewModel extends BaseViewModel {
  final log = Logger();
  final _appViewModel = locator<AppViewModel>();
  final _userService = locator<UserService>();
  final _conversationService = locator<ConversationService>();
  final _snackbarService = locator<AppSnackbarService>();
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
    final conversation = _appViewModel.findConversationFromUser(user!);

    if (conversation != null) {
      // navigate to conversation view
      return _router.replaceWith(
        Routes.conversationDetailView(conversationId: conversation.id),
        id: AppRouterId.appView,
      );
    }

    return await _createConversation();
  }

  Future<void> _createConversation() async {
    // create converastion
    final response = await runBusyFuture<PostgrestResponse>(
      _conversationService.startConversation(user!),
      busyObject: _createConversationKey,
      throwException: true,
    );
    log.v('startConversation-response "${response.toJson()}"');
    if (response.error != null) {
      _snackbarService.showError();
      return log.e(
        'startConversation_response.error?.message "${response.error?.message}"',
      );
    }

    final conversation = Conversation.fromJson(response.data.first);

    // navigate to conversation view
    return _router.replaceWith(
      Routes.conversationDetailView(conversationId: conversation.id!),
      id: AppRouterId.appView,
    );
  }

  // Future<String?> existingConversation() async {
  //   final response = await runBusyFuture<PostgrestResponse>(
  //     _conversationService.findExistingConversation(user!),
  //     busyObject: _checkExistingConversationKey,
  //     throwException: true,
  //   );
  //   // log.v('response "${response.toJson()}"');
  //   log.v(response.toJson());

  //   if (response.error != null) {
  //     log.e(
  //       'existingConversation_response.error?.message "${response.error?.message}"',
  //     );
  //     return null;
  //   }

  //   if (response.data.length == 0) return null;

  //   try {
  //     return response.data['id'];
  //   } catch (e) {
  //     return null;
  //   }
  //   // return response.data.first['id'];
  // }
}
