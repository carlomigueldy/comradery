import 'package:comradery/common/utils/ui_util.dart';
import 'package:comradery/ui/placeholders/placeholder_images.dart';
import 'package:comradery/ui/views/home/home_viewmodel.dart';
import 'package:comradery/ui/widgets/dumb_widgets/dumb_widgets.dart';
import 'package:flutter/material.dart';

import 'tabs/matches_tab_view.dart';
import 'tabs/messages_tab_view.dart';
import 'tabs/my_teams_tab_view.dart';

class HomeViewLeftDrawer extends StatefulWidget {
  const HomeViewLeftDrawer({
    Key? key,
    required this.model,
  }) : super(key: key);

  final HomeViewModel model;

  @override
  _HomeViewLeftDrawerState createState() => _HomeViewLeftDrawerState();
}

class _HomeViewLeftDrawerState extends State<HomeViewLeftDrawer>
    with UiUtilMixin, SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    final mediaQuery = MediaQuery.of(context);
    final theme = Theme.of(context);

    const itemHeight = 768;
    const itemWidth = 1250 / 2;

    return Container(
      height: double.infinity,
      width: 375,
      decoration: BoxDecoration(
        color: Colors.grey[100],
      ),
      child: Column(
        children: [
          uiUtil.verticalSpacing.large,
          Expanded(
            flex: 1,
            child: Padding(
              padding: uiUtil.edgeInsets.horizontalSymmetric25,
              child: Column(
                children: [
                  Row(
                    children: [
                      AppText.heading1('Comradery'),
                    ],
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: theme.primaryColor,
                      backgroundImage: NetworkImage(COMRADE_DOGE_IMG),
                    ),
                    title: AppText.body('John Doe'),
                    subtitle: AppText.bodySmall(
                      '${widget.model.userEmail}',
                      style: uiUtil.textStyles.bodySmall.copyWith(
                        fontSize: 12,
                      ),
                    ),
                    contentPadding: const EdgeInsets.all(0),
                    trailing: PopupMenuButton(
                      padding: uiUtil.edgeInsets.horizontalSymmetric25,
                      shape: RoundedRectangleBorder(
                        borderRadius: uiUtil.borderRadius.large,
                      ),
                      child: Icon(Icons.more_horiz_rounded),
                      onSelected: (value) {
                        if (value == 'logout') return widget.model.logout();
                      },
                      itemBuilder: (BuildContext context) {
                        return [
                          PopupMenuItem(
                            child: AppText('Settings'),
                            value: 'settings',
                          ),
                          PopupMenuItem(
                            child: AppText('Logout'),
                            value: 'logout',
                          ),
                        ];
                      },
                    ),
                  ),
                  TabBar(
                    controller: tabController,
                    labelColor: Colors.black,
                    indicatorColor: theme.primaryColor,
                    tabs: [
                      Tab(
                        child: AppText.bodySmall(
                          'Matches',
                        ),
                      ),
                      Tab(
                        child: AppText.bodySmall(
                          'Messages',
                        ),
                      ),
                      Tab(
                        child: AppText.bodySmall(
                          'My Teams',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: TabBarView(
              controller: tabController,
              children: [
                MatchesTabView(),
                MessagesTabView(),
                MyTeamsTabView(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
