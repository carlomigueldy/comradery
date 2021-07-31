import 'package:stacked/stacked_annotations.dart';

// services
import 'auth/services/auth_service.dart';

// views
import 'ui/views/home/home_view.dart';
import 'ui/views/startup/startup_view.dart';

// routes
import 'ui/views/auth/auth_routes.dart' as auth;

@StackedApp(
  routes: [
    CupertinoRoute(page: StartupView, initial: true),
    CupertinoRoute(page: HomeView),
    ...auth.routes,
  ],
  dependencies: [
    LazySingleton(classType: AuthService),
  ],
)
class AppSetup {}
