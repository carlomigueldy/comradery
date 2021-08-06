// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'ui/views/about/about_view.dart';
import 'ui/views/app/views/home/home_view.dart';
import 'ui/views/auth/views/forgot_password/forgot_password_view.dart';
import 'ui/views/auth/views/reset_password/reset_password_view.dart';
import 'ui/views/auth/views/sign_in/sign_in_view.dart';
import 'ui/views/auth/views/sign_up/sign_up_view.dart';
import 'ui/views/conversation/views/conversation_detail/conversation_detail_view.dart';
import 'ui/views/landing/landing_view.dart';
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
  static const String landingView = '/landing';
  static const String aboutView = '/about';
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
    landingView,
    aboutView,
    homeView,
    _teamDetailView,
    _welcomeToTeamView,
    _conversationDetailView,
    _userDetailView,
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
    RouteDef(Routes.landingView, page: LandingView),
    RouteDef(Routes.aboutView, page: AboutView),
    RouteDef(Routes.homeView, page: HomeView),
    RouteDef(Routes._teamDetailView, page: TeamDetailView),
    RouteDef(Routes._welcomeToTeamView, page: WelcomeToTeamView),
    RouteDef(Routes._conversationDetailView, page: ConversationDetailView),
    RouteDef(Routes._userDetailView, page: UserDetailView),
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
      var args = data.getArgs<StartupViewArguments>(
        orElse: () => StartupViewArguments(),
      );
      return CupertinoPageRoute<dynamic>(
        builder: (context) => StartupView(
          key: args.key,
          accessToken: data.queryParams['access_token'].optString(),
          expiresIn: data.queryParams['expires_in'].optString(),
          providerToken: data.queryParams['provider_token'].optString(),
          refreshToken: data.queryParams['refresh_token'].optString(),
          tokenType: data.queryParams['token_type'].optString(),
        ),
        settings: data,
      );
    },
    LandingView: (data) {
      var args = data.getArgs<LandingViewArguments>(
        orElse: () => LandingViewArguments(),
      );
      return CupertinoPageRoute<dynamic>(
        builder: (context) => LandingView(key: args.key),
        settings: data,
      );
    },
    AboutView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const AboutView(),
        settings: data,
      );
    },
    HomeView: (data) {
      var args = data.getArgs<HomeViewArguments>(
        orElse: () => HomeViewArguments(),
      );
      return CupertinoPageRoute<dynamic>(
        builder: (context) => HomeView(key: args.key),
        settings: data,
      );
    },
    TeamDetailView: (data) {
      var args = data.getArgs<TeamDetailViewArguments>(
        orElse: () => TeamDetailViewArguments(),
      );
      return CupertinoPageRoute<dynamic>(
        builder: (context) => TeamDetailView(
          key: args.key,
          teamId: data.pathParams['teamId'].getString(),
        ),
        settings: data,
      );
    },
    WelcomeToTeamView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const WelcomeToTeamView(),
        settings: data,
      );
    },
    ConversationDetailView: (data) {
      var args = data.getArgs<ConversationDetailViewArguments>(
        orElse: () => ConversationDetailViewArguments(),
      );
      return CupertinoPageRoute<dynamic>(
        builder: (context) => ConversationDetailView(
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
      return CupertinoPageRoute<dynamic>(
        builder: (context) => UserDetailView(
          key: args.key,
          userId: data.pathParams['userId'].optString(),
        ),
        settings: data,
      );
    },
    SignInView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const SignInView(),
        settings: data,
      );
    },
    SignUpView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const SignUpView(),
        settings: data,
      );
    },
    ResetPasswordView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const ResetPasswordView(),
        settings: data,
      );
    },
    ForgotPasswordView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const ForgotPasswordView(),
        settings: data,
      );
    },
    SetupTeamProfileView: (data) {
      var args = data.getArgs<SetupTeamProfileViewArguments>(
        orElse: () => SetupTeamProfileViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => SetupTeamProfileView(
          key: args.key,
          onBoarding: args.onBoarding,
        ),
        settings: data,
      );
    },
    UploadTeamPhotoView: (data) {
      var args = data.getArgs<UploadTeamPhotoViewArguments>(
        orElse: () => UploadTeamPhotoViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => UploadTeamPhotoView(
          key: args.key,
          onBoarding: args.onBoarding,
        ),
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

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// StartupView arguments holder class
class StartupViewArguments {
  final Key? key;
  StartupViewArguments({this.key});
}

/// LandingView arguments holder class
class LandingViewArguments {
  final Key? key;
  LandingViewArguments({this.key});
}

/// HomeView arguments holder class
class HomeViewArguments {
  final Key? key;
  HomeViewArguments({this.key});
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

/// SetupTeamProfileView arguments holder class
class SetupTeamProfileViewArguments {
  final Key? key;
  final bool onBoarding;
  SetupTeamProfileViewArguments({this.key, this.onBoarding = true});
}

/// UploadTeamPhotoView arguments holder class
class UploadTeamPhotoViewArguments {
  final Key? key;
  final bool onBoarding;
  UploadTeamPhotoViewArguments({this.key, this.onBoarding = true});
}

/// SetupUserProfileView arguments holder class
class SetupUserProfileViewArguments {
  final Key? key;
  SetupUserProfileViewArguments({this.key});
}
