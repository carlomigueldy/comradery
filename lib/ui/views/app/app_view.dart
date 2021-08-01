import 'package:comradery/app.dart';
import 'package:comradery/common/utils/ui_util.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'app_viewmodel.dart';
import 'widgets/app_view_left_drawer.dart';

class AppView extends StatelessWidget with UiUtilMixin {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AppViewModel>.reactive(
      viewModelBuilder: () => AppViewModel(),
      builder: (
        BuildContext context,
        AppViewModel model,
        Widget? child,
      ) {
        final theme = Theme.of(context);
        final mediaQuery = MediaQuery.of(context);

        return Scaffold(
          body: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    uiUtil.boxShadows.small,
                  ],
                ),
                child: AppViewLeftDrawer(model: model),
              ),
              Expanded(
                flex: 3,
                child: ExtendedNavigator(
                  router: AppViewRouter(),
                  navigatorKey:
                      StackedService.nestedNavigationKey(RouterId.appView),
                  initialRoute: AppViewRoutes.homeView,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
