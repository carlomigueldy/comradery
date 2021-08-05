import 'package:comradery/app.dart';
import 'package:comradery/common/utils/ui_util.dart';
import 'package:comradery/ui/widgets/dumb_widgets/app_bar/app_top_bar.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'app_viewmodel.dart';
import 'widgets/app_view_left_drawer.dart';

class AppView extends StatelessWidget with UiUtilMixin {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  AppView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AppViewModel>.reactive(
      onModelReady: (model) => model.init(),
      initialiseSpecialViewModelsOnce: true,
      fireOnModelReadyOnce: true,
      disposeViewModel: false,
      viewModelBuilder: () => locator<AppViewModel>(),
      builder: (
        BuildContext context,
        AppViewModel model,
        Widget? child,
      ) {
        final theme = Theme.of(context);
        final mediaQuery = MediaQuery.of(context);

        final navigatorKey = StackedService.nestedNavigationKey(
          AppRouterId.appView,
        );

        final leftDrawer = AppViewLeftDrawer(model: model);

        final desktop = Scaffold(
          key: _scaffoldKey,
          body: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    uiUtil.boxShadows.small,
                  ],
                ),
                child: leftDrawer,
              ),
              Expanded(
                flex: 3,
                child: Container(),
                // ExtendedNavigator<AppViewRouter>(
                //   router: AppViewRouter(),
                //   navigatorKey: StackedService.nestedNavigationKey(
                //     AppRouterId.appView,
                //   ),
                //   initialRoute: AppViewRoutes.homeView,
                // ),
              ),
            ],
          ),
        );

        print(
          'ModalRoute.of(context)?.settings.name "${ModalRoute.of(context)?.settings.name}"',
        );

        print(
          'ModalRoute.of(context)?.settings "${ModalRoute.of(context)?.settings}"',
        );

        return SafeArea(
          child: ScreenTypeLayout(
            mobile: Scaffold(
              key: _scaffoldKey,
              drawer: leftDrawer,
              appBar: AppTopBar(
                leading: IconButton(
                  icon: Icon(
                    Icons.menu_rounded,
                    color: theme.primaryColor,
                  ),
                  onPressed: () {
                    _scaffoldKey.currentState?.openDrawer();
                  },
                ),
                title: 'Comradery',
              ),
              body: Container(),
              // ExtendedNavigator<AppViewRouter>(
              //   router: AppViewRouter(),
              //   navigatorKey: navigatorKey,
              //   initialRoute: AppViewRoutes.homeView,
              // ),
            ),
            desktop: desktop,
            tablet: desktop,
          ),
        );
      },
    );
  }
}
