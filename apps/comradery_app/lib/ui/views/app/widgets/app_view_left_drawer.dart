import 'package:comradery/common/constants/constants.dart';
import 'package:comradery/common/utils/ui_util.dart';
import 'package:comradery/ui/placeholders/placeholder_images.dart';
import 'package:comradery/ui/widgets/dumb_widgets/dumb_widgets.dart';
import 'package:flutter/material.dart';

import '../app_viewmodel.dart';
import 'tabs/matches_tab_view_layout_builder.dart';
import 'tabs/conversations_tab_view_layout_builder.dart';
import 'tabs/my_teams_tab_view_layout_builder.dart';

class AppViewLeftDrawer extends StatefulWidget {
  const AppViewLeftDrawer({
    Key? key,
    required this.model,
  }) : super(key: key);

  final AppViewModel model;

  @override
  _AppViewLeftDrawerState createState() => _AppViewLeftDrawerState();
}

class _AppViewLeftDrawerState extends State<AppViewLeftDrawer>
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
        // color: uiUtil.colors.veryLightGrey,
        color: kcBackgroundColor,
      ),
      child: Column(
        children: [
          Container(
            height: 175,
            child: Padding(
              padding: uiUtil.edgeInsets.horizontalSymmetric25,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/png/banner.png',
                        width: 225,
                      ),
                    ],
                  ),
                  // Row(
                  //   children: [
                  //     Image.asset(
                  //       'assets/png/logo.png',
                  //       width: 50,
                  //       height: 50,
                  //     ),
                  //   ],
                  // ),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: theme.primaryColor,
                      backgroundImage: NetworkImage(
                        widget.model.authUser?.photoUrl ?? PLACEHOLDER_IMG,
                      ),
                    ),
                    title: AppText.body('${widget.model.userFullName}'),
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
                        child: AppText.bodySmallBold(
                          'Matches',
                          style: uiUtil.textStyles.bodySmallBold.copyWith(
                            fontSize: 12,
                          ),
                        ),
                      ),
                      Tab(
                        child: AppText.bodySmallBold(
                          'Messages',
                          style: uiUtil.textStyles.bodySmallBold.copyWith(
                            fontSize: 12,
                          ),
                        ),
                      ),
                      Tab(
                        child: AppText.bodySmallBold(
                          'My Teams',
                          style: uiUtil.textStyles.bodySmallBold.copyWith(
                            fontSize: 12,
                          ),
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
                MatchesTabViewLayoutBuilder(
                  matchings: widget.model.filteredMatchings,
                  onTap: (value) {
                    widget.model.toUserDetailView(value.createdBy);
                  },
                ),
                ConversationsTabViewLayoutBuilder(
                  conversations: widget.model.conversations,
                  authUser: widget.model.authUser!,
                  onTap: (value) {
                    widget.model.toConversationDetailView(value.id!);
                  },
                ),
                MyTeamsTabViewLayoutBuilder(
                  teams: widget.model.myTeams,
                  onTapCreateTeam: () => widget.model.createTeam(),
                  onTap: (value) {
                    widget.model.toTeamDetailView(value.id!);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
