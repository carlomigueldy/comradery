// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'ui/views/app/app_view.dart';
import 'ui/views/app/views/home/home_view.dart';
import 'ui/views/auth/views/forgot_password/forgot_password_view.dart';
import 'ui/views/auth/views/reset_password/reset_password_view.dart';
import 'ui/views/auth/views/sign_in/sign_in_view.dart';
import 'ui/views/auth/views/sign_up/sign_up_view.dart';
import 'ui/views/conversation/views/conversation_detail/conversation_detail_view.dart';
import 'ui/views/on_boarding/views/create_team/views/setup_team_profile/setup_team_profile_view.dart';
import 'ui/views/on_boarding/views/create_team/views/upload_team_photo/upload_team_photo_view.dart';
import 'ui/views/on_boarding/views/individual/views/select_goal/select_goal_view.dart';
import 'ui/views/on_boarding/views/individual/views/select_interests/select_interests_view.dart';
import 'ui/views/on_boarding/views/individual/views/setup_user_profile/setup_user_profile_view.dart';
import 'ui/views/on_boarding/views/individual/views/upload_photo/upload_photo_view.dart';
import 'ui/views/startup/startup_view.dart';
import 'ui/views/team/views/team_detail/team_detail_view.dart';
import 'ui/views/team/views/welcome_to_team/welcome_to_team_view.dart';
import 'ui/views/user/views/user_detail/user_detail_view.dart';

class Routes {
  static const String startupView = '/';
  static const String appView = 'app';
  static const String signInView = '/auth/sign-in';
  static const String signUpView = '/auth/sign-up';
  static const String resetPasswordView = '/auth/reset-password';
  static const String forgotPasswordView = '/auth/forgot-password';
  static const String setupTeamProfileView = '/on-boarding/setup-team-profile';
  static const String uploadTeamPhotoView = '/on-boarding/upload-team-photo';
  static const String selectGoalView = '/on-boarding/select-goal';
  static const String uploadPhotoView = '/on-boarding/upload-photo';
  static const String selectInterestsView = '/on-boarding/select-interests';
  static const String setupUserProfileView = '/on-boarding/setup-profile';
  static const all = <String>{
    startupView,
    appView,
    signInView,
    signUpView,
    resetPasswordView,
    forgotPasswordView,
    setupTeamProfileView,
    uploadTeamPhotoView,
    selectGoalView,
    uploadPhotoView,
    selectInterestsView,
    setupUserProfileView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.startupView, page: StartupView),
    RouteDef(
      Routes.appView,
      page: AppView,
      generator: AppViewRouter(),
    ),
    RouteDef(Routes.signInView, page: SignInView),
    RouteDef(Routes.signUpView, page: SignUpView),
    RouteDef(Routes.resetPasswordView, page: ResetPasswordView),
    RouteDef(Routes.forgotPasswordView, page: ForgotPasswordView),
    RouteDef(Routes.setupTeamProfileView, page: SetupTeamProfileView),
    RouteDef(Routes.uploadTeamPhotoView, page: UploadTeamPhotoView),
    RouteDef(Routes.selectGoalView, page: SelectGoalView),
    RouteDef(Routes.uploadPhotoView, page: UploadPhotoView),
    RouteDef(Routes.selectInterestsView, page: SelectInterestsView),
    RouteDef(Routes.setupUserProfileView, page: SetupUserProfileView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    StartupView: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const StartupView(),
        settings: data,
      );
    },
    AppView: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const AppView(),
        settings: data,
      );
    },
    SignInView: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const SignInView(),
        settings: data,
      );
    },
    SignUpView: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const SignUpView(),
        settings: data,
      );
    },
    ResetPasswordView: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const ResetPasswordView(),
        settings: data,
      );
    },
    ForgotPasswordView: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const ForgotPasswordView(),
        settings: data,
      );
    },
    SetupTeamProfileView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const SetupTeamProfileView(),
        settings: data,
      );
    },
    UploadTeamPhotoView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const UploadTeamPhotoView(),
        settings: data,
      );
    },
    SelectGoalView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const SelectGoalView(),
        settings: data,
      );
    },
    UploadPhotoView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const UploadPhotoView(),
        settings: data,
      );
    },
    SelectInterestsView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const SelectInterestsView(),
        settings: data,
      );
    },
    SetupUserProfileView: (data) {
      var args = data.getArgs<SetupUserProfileViewArguments>(
        orElse: () => SetupUserProfileViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => SetupUserProfileView(key: args.key),
        settings: data,
      );
    },
  };
}

class AppViewRoutes {
  static const String homeView = '/home';
  static const String _teamDetailView = '/teams/:teamId';
  static String teamDetailView({@required dynamic teamId}) => '/teams/$teamId';
  static const String _welcomeToTeamView = '/teams/:teamId/welcome';
  static String welcomeToTeamView({@required dynamic teamId}) =>
      '/teams/$teamId/welcome';
  static const String _conversationDetailView =
      '/conversations/:conversationId';
  static String conversationDetailView({@required dynamic conversationId}) =>
      '/conversations/$conversationId';
  static const String _userDetailView = '/users/:userId';
  static String userDetailView({@required dynamic userId}) => '/users/$userId';
  static const all = <String>{
    homeView,
    _teamDetailView,
    _welcomeToTeamView,
    _conversationDetailView,
    _userDetailView,
  };
}

class AppViewRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(AppViewRoutes.homeView, page: HomeView),
    RouteDef(AppViewRoutes._teamDetailView, page: TeamDetailView),
    RouteDef(AppViewRoutes._welcomeToTeamView, page: WelcomeToTeamView),
    RouteDef(AppViewRoutes._conversationDetailView,
        page: ConversationDetailView),
    RouteDef(AppViewRoutes._userDetailView, page: UserDetailView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    HomeView: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const HomeView(),
        settings: data,
      );
    },
    TeamDetailView: (data) {
      var args = data.getArgs<TeamDetailViewArguments>(
        orElse: () => TeamDetailViewArguments(),
      );
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) => TeamDetailView(
          key: args.key,
          teamId: data.pathParams['teamId'].getString(),
        ),
        settings: data,
      );
    },
    WelcomeToTeamView: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const WelcomeToTeamView(),
        settings: data,
      );
    },
    ConversationDetailView: (data) {
      var args = data.getArgs<ConversationDetailViewArguments>(
        orElse: () => ConversationDetailViewArguments(),
      );
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            ConversationDetailView(
          key: args.key,
          conversationId: data.pathParams['conversationId'].getString(),
        ),
        settings: data,
      );
    },
    UserDetailView: (data) {
      var args = data.getArgs<UserDetailViewArguments>(
        orElse: () => UserDetailViewArguments(),
      );
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) => UserDetailView(
          key: args.key,
          userId: data.pathParams['userId'].optString(),
        ),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// SetupUserProfileView arguments holder class
class SetupUserProfileViewArguments {
  final Key? key;
  SetupUserProfileViewArguments({this.key});
}

/// TeamDetailView arguments holder class
class TeamDetailViewArguments {
  final Key? key;
  TeamDetailViewArguments({this.key});
}

/// ConversationDetailView arguments holder class
class ConversationDetailViewArguments {
  final Key? key;
  ConversationDetailViewArguments({this.key});
}

/// UserDetailView arguments holder class
class UserDetailViewArguments {
  final Key? key;
  UserDetailViewArguments({this.key});
}
