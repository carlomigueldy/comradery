import 'package:comradery/ui/views/app/views/notifications/notifications_view.dart';
import 'package:stacked/stacked_annotations.dart';

import 'views/home/home_view.dart';

const routes = [
  CupertinoRoute(
    page: HomeView,
    path: '/home',
  ),
  CupertinoRoute(
    page: NotificationsView,
    path: '/notifications',
  ),
];
