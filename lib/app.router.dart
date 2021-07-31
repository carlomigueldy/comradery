// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'ui/views/auth/views/forgot_password/forgot_password_view.dart';
import 'ui/views/auth/views/reset_password/reset_password_view.dart';
import 'ui/views/auth/views/sign_in/sign_in_view.dart';
import 'ui/views/auth/views/sign_up/sign_up_view.dart';
import 'ui/views/home/home_view.dart';
import 'ui/views/on_boarding/views/create_team/views/setup_team_profile/setup_team_profile_view.dart';
import 'ui/views/on_boarding/views/create_team/views/upload_team_photo/upload_team_photo_view.dart';
import 'ui/views/on_boarding/views/individual/views/select_goal/select_goal_view.dart';
import 'ui/views/on_boarding/views/individual/views/select_interests/select_interests_view.dart';
import 'ui/views/on_boarding/views/individual/views/setup_user_profile/setup_user_profile_view.dart';
import 'ui/views/on_boarding/views/individual/views/upload_photo/upload_photo_view.dart';
import 'ui/views/startup/startup_view.dart';

class Routes {
  static const String startupView = '/';
  static const String homeView = 'home';
  static const String signInView = 'auth/sign-in';
  static const String signUpView = 'auth/sign-up';
  static const String resetPasswordView = 'auth/reset-password';
  static const String forgotPasswordView = 'auth/forgot-password';
  static const String setupTeamProfileView = 'on-boarding/setup-team-profile';
  static const String uploadTeamPhotoView = 'on-boarding/upload-team-photo';
  static const String selectGoalView = 'on-boarding/select-goal';
  static const String uploadPhotoView = 'on-boarding/upload-photo';
  static const String selectInterestsView = 'on-boarding/select-interests';
  static const String setupUserProfileView = 'on-boarding/setup-profile';
  static const all = <String>{
    startupView,
    homeView,
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
    RouteDef(Routes.homeView, page: HomeView),
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
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const StartupView(),
        settings: data,
      );
    },
    HomeView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const HomeView(),
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
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const SetupTeamProfileView(),
        settings: data,
      );
    },
    UploadTeamPhotoView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const UploadTeamPhotoView(),
        settings: data,
      );
    },
    SelectGoalView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const SelectGoalView(),
        settings: data,
      );
    },
    UploadPhotoView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const UploadPhotoView(),
        settings: data,
      );
    },
    SelectInterestsView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const SelectInterestsView(),
        settings: data,
      );
    },
    SetupUserProfileView: (data) {
      var args = data.getArgs<SetupUserProfileViewArguments>(
        orElse: () => SetupUserProfileViewArguments(),
      );
      return CupertinoPageRoute<dynamic>(
        builder: (context) => SetupUserProfileView(key: args.key),
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
