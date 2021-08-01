// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import 'auth/services/auth_service.dart';
import 'common/services/local_storage_service.dart';
import 'common/services/theme_service.dart';
import 'conversation/services/conversation_message_service.dart';
import 'conversation/services/conversation_participant_service.dart';
import 'conversation/services/conversation_service.dart';
import 'interest/services/interest_service.dart';
import 'matching/services/matching_service.dart';
import 'notification/services/notification_service.dart';
import 'team/services/team_member_service.dart';
import 'team/services/team_request_service.dart';
import 'team/services/team_service.dart';
import 'user/services/user_service.dart';

final locator = StackedLocator.instance;

void setupLocator({String? environment, EnvironmentFilter? environmentFilter}) {
// Register environments
  locator.registerEnvironment(
      environment: environment, environmentFilter: environmentFilter);

// Register dependencies
  locator.registerLazySingleton(() => AuthService());
  locator.registerLazySingleton(() => LocalStorageService());
  locator.registerLazySingleton(() => ThemeService());
  locator.registerLazySingleton(() => UserService());
  locator.registerLazySingleton(() => ConversationService());
  locator.registerLazySingleton(() => ConversationMessageService());
  locator.registerLazySingleton(() => ConversationParticipantService());
  locator.registerLazySingleton(() => TeamService());
  locator.registerLazySingleton(() => TeamMemberService());
  locator.registerLazySingleton(() => TeamRequestService());
  locator.registerLazySingleton(() => NotificationService());
  locator.registerLazySingleton(() => MatchingService());
  locator.registerLazySingleton(() => InterestService());
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => BottomSheetService());
  locator.registerLazySingleton(() => SnackbarService());
}
