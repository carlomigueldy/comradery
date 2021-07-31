import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

export 'app.locator.dart';
export 'app.router.dart';

// services
import 'auth/services/auth_service.dart';
import 'common/services/local_storage_service.dart';
import 'common/services/theme_service.dart';
import 'user/services/user_service.dart';

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
    // core services
    LazySingleton(classType: AuthService),
    LazySingleton(classType: LocalStorageService),
    LazySingleton(classType: ThemeService),

    // feature services
    LazySingleton(classType: UserService),

    // stacked services
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: SnackbarService),
  ],
)
class AppSetup {}
