import 'package:comradery/app.locator.dart';
import 'package:comradery/app.router.dart';
import 'package:comradery/ui/views/on_boarding/views/individual/views/setup_user_profile/setup_user_profile_view.dart';
// import 'package:comradery/ui/views/on_boarding/views/individual/views/select_goal/select_goal_view.dart';
// import 'package:comradery/ui/views/on_boarding/views/individual/views/select_interests/select_interests_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:url_strategy/url_strategy.dart';

import 'common/services/theme_service.dart';

void main() async {
  await dotenv.load(fileName: 'dotenv');
  setPathUrlStrategy();
  setupLocator();
  locator<ThemeService>().init();
  runApp(ComraderyAppView());
}

class ComraderyAppView extends StatelessWidget {
  const ComraderyAppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ComraderyAppViewModel>.reactive(
      viewModelBuilder: () => ComraderyAppViewModel(),
      builder: (
        BuildContext context,
        ComraderyAppViewModel model,
        Widget? child,
      ) {
        return MaterialApp(
          title: 'Comradery',
          debugShowCheckedModeBanner: false,
          themeMode: model.themeService.themeMode,
          theme: model.themeService.light(),
          darkTheme: model.themeService.dark(),
          scrollBehavior: ScrollBehavior().copyWith(
            physics: BouncingScrollPhysics(),
          ),
          navigatorKey: StackedService.navigatorKey,
          onGenerateRoute: StackedRouter().onGenerateRoute,
          // home: SetupUserProfileView(),
        );
      },
    );
  }
}

class ComraderyAppViewModel extends ReactiveViewModel {
  final themeService = locator<ThemeService>();

  @override
  List<ReactiveServiceMixin> get reactiveServices => [themeService];
}
