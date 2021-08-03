import 'package:comradery/common/services/app_snackbar_service.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

export 'app.locator.dart';
export 'app.router.dart';

// services
import 'conversation/services/conversation_message_service.dart';
import 'conversation/services/conversation_participant_service.dart';
import 'conversation/services/conversation_service.dart';
import 'interest/services/interest_service.dart';
import 'matching/services/matching_service.dart';
import 'notification/services/notification_service.dart';
import 'team/services/team_member_service.dart';
import 'team/services/team_request_service.dart';
import 'team/services/team_service.dart';
import 'ui/views/about/about_view.dart';
import 'ui/views/app/app_viewmodel.dart';
import 'ui/views/landing/landing_view.dart';
import 'user/services/user_interest_service.dart';
import 'auth/services/auth_service.dart';
import 'common/services/local_storage_service.dart';
import 'common/services/theme_service.dart';
import 'user/services/user_service.dart';

// views
import 'ui/views/app/app_view.dart';
import 'ui/views/startup/startup_view.dart';

// routes
import 'ui/views/auth/auth_routes.dart' as auth;
import 'ui/views/on_boarding/on_boarding_routes.dart' as on_boarding;
import 'ui/views/team/team_routes.dart' as team;
import 'ui/views/conversation/conversation_routes.dart' as conversation;
import 'ui/views/user/user_routes.dart' as user;
import 'ui/views/app/app_routes.dart' as app;

class AppRouterId {
  static const appView = 1;
}

@StackedApp(
  routes: [
    MaterialRoute(
      page: StartupView,
      initial: true,
      path: '/',
    ),
    MaterialRoute(
      page: LandingView,
      path: '/home',
    ),
    MaterialRoute(
      page: AboutView,
      path: '/about',
    ),
    MaterialRoute(
      page: AppView,
      path: 'app',
      children: [
        ...app.routes,
        ...team.routes,
        ...conversation.routes,
        ...user.routes,
      ],
    ),
    ...auth.routes,
    ...on_boarding.routes,
  ],
  dependencies: [
    // core services
    LazySingleton(classType: AuthService),
    LazySingleton(classType: LocalStorageService),
    LazySingleton(classType: ThemeService),
    LazySingleton(classType: AppSnackbarService),

    // feature services
    LazySingleton(classType: UserService),
    LazySingleton(classType: UserInterestService),
    LazySingleton(classType: ConversationService),
    LazySingleton(classType: ConversationMessageService),
    LazySingleton(classType: ConversationParticipantService),
    LazySingleton(classType: TeamService),
    LazySingleton(classType: TeamMemberService),
    LazySingleton(classType: TeamRequestService),
    LazySingleton(classType: NotificationService),
    LazySingleton(classType: MatchingService),
    LazySingleton(classType: InterestService),

    // stacked services
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: SnackbarService),

    // viewmodels
    LazySingleton(classType: AppViewModel)
  ],
  logger: StackedLogger(
    logHelperName: 'stackedLogger',
  ),
)
class AppSetup {}
