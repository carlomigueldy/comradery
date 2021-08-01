import 'package:comradery/common/utils/ui_util.dart';
import 'package:comradery/ui/views/home/widgets/home_view_main_container.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';
import 'widgets/home_view_left_drawer.dart';

class HomeView extends StatelessWidget with UiUtilMixin {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      onModelReady: (model) => model.init(),
      viewModelBuilder: () => HomeViewModel(),
      builder: (
        BuildContext context,
        HomeViewModel model,
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
                child: HomeViewLeftDrawer(model: model),
              ),
              Expanded(
                flex: 3,
                child: HomeViewMainContainer(),
              ),
            ],
          ),
        );
      },
    );
  }
}
