import 'package:stacked/stacked_annotations.dart';

import 'views/forgot_password/forgot_password_view.dart';
import 'views/reset_password/reset_password_view.dart';
import 'views/sign_in/sign_in_view.dart';
import 'views/sign_up/sign_up_view.dart';

const routes = [
  CupertinoRoute(
    page: SignInView,
    path: '/auth/sign-in',
  ),
  CupertinoRoute(
    page: SignUpView,
    path: '/auth/sign-up',
  ),
  CupertinoRoute(
    page: ResetPasswordView,
    path: '/auth/reset-password',
  ),
  CupertinoRoute(
    page: ForgotPasswordView,
    path: '/auth/forgot-password',
  ),
];
