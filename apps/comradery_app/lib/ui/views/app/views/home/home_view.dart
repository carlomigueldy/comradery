import 'package:comradery/common/utils/ui_util.dart';
import 'package:comradery/ui/views/app/views/home/tabs/main_tab/main_tab_view.dart';
import 'package:comradery/ui/views/app/widgets/app_view_left_drawer.dart';
import 'package:comradery/ui/widgets/dumb_widgets/app_bar/app_top_bar.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';
import 'tabs/conversations_tab/conversations_tab_view.dart';
import 'tabs/my_matches_tab/my_matches_tab_view.dart';
import 'tabs/my_teams_tab/my_teams_tab_view.dart';
import 'tabs/profile/profile_tab_view.dart';

class HomeView extends StatelessWidget with UiUtilMixin {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  HomeView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mediaQuery = MediaQuery.of(context);

    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (
        BuildContext context,
        HomeViewModel model,
        Widget? child,
      ) {
        final leftDrawer = AppViewLeftDrawer(model: model.appViewModel);

        return Container(
          color: theme.scaffoldBackgroundColor,
          child: SafeArea(
            child: Scaffold(
              key: _scaffoldKey,
              drawer: leftDrawer,
              // appBar: AppTopBar(
              //   leading: IconButton(
              //     icon: Icon(
              //       Icons.menu_rounded,
              //       color: theme.primaryColor,
              //     ),
              //     onPressed: () {
              //       _scaffoldKey.currentState?.openDrawer();
              //     },
              //   ),
              //   title: 'Comradery',
              //   action: Padding(
              //     padding: uiUtil.edgeInsets.horizontalSymmetric5,
              //     child: IconButton(
              //       icon: Icon(
              //         Icons.notifications,
              //         color: theme.primaryColor,
              //       ),
              //       onPressed: () => model.toNotificationsView(),
              //     ),
              //   ),
              // ),
              body: viewByIndex(model.currentIndex),
              bottomNavigationBar: Theme(
                data: theme.copyWith(
                  canvasColor: theme.scaffoldBackgroundColor,
                ),
                child: BottomNavigationBar(
                  onTap: model.setIndex,
                  backgroundColor: theme.scaffoldBackgroundColor,
                  currentIndex: model.currentIndex,
                  fixedColor: theme.primaryColor,
                  unselectedItemColor: uiUtil.colors.black,
                  showUnselectedLabels: false,
                  showSelectedLabels: false,
                  items: [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.message_rounded),
                      label: 'Conversations',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.military_tech),
                      label: 'My Matches',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.dangerous),
                      label: 'My Teams',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.account_circle_rounded),
                      label: 'Profile',
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget viewByIndex(int index) {
    switch (index) {
      case 0:
        return MainTabView();

      case 1:
        return ConversationsTabView();

      case 2:
        return MyMatchesTabView();

      case 3:
        return MyTeamsTabView();

      case 4:
        return ProfileTabView();

      default:
        return MainTabView();
    }
  }
}
