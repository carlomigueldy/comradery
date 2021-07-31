import 'package:comradery/app.locator.dart';
import 'package:comradery/app.router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'common/services/theme_service.dart';

void main() async {
  await dotenv.load(fileName: 'dotenv');
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
          title: 'Comradery App',
          debugShowCheckedModeBanner: false,
          themeMode: model.themeService.themeMode,
          theme: model.themeService.light(),
          darkTheme: model.themeService.dark(),
          scrollBehavior: ScrollBehavior().copyWith(
            physics: BouncingScrollPhysics(),
          ),
          navigatorKey: StackedService.navigatorKey,
          onGenerateRoute: StackedRouter().onGenerateRoute,
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
