import 'package:comradery/common/utils/ui_util.dart';
import 'package:comradery/ui/placeholders/placeholder_images.dart';
import 'package:comradery/ui/views/home/home_viewmodel.dart';
import 'package:comradery/ui/widgets/dumb_widgets/dumb_widgets.dart';
import 'package:flutter/material.dart';

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
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: theme.primaryColor,
                    ),
                    title: AppText.body('John Doe'),
                    subtitle: AppText.bodySmall(
                      'john.doe@gmail.com',
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
            flex: 5,
            child: TabBarView(
              controller: tabController,
              children: [
                _MatchesTabView(),
                _MatchesTabView(),
                _MatchesTabView(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MatchesTabView extends StatelessWidget with UiUtilMixin {
  const _MatchesTabView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    const itemHeight = 768;
    const itemWidth = 1250 / 2;

    return SingleChildScrollView(
      padding: uiUtil.edgeInsets.horizontalSymmetric25,
      child: GridView.count(
        childAspectRatio: (itemWidth / itemHeight),
        controller: ScrollController(keepScrollOffset: false),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: 3,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
        children: List.generate(25, (index) {
          return GridTile(
            child: Container(
              decoration: BoxDecoration(
                color: theme.primaryColor,
                borderRadius: uiUtil.borderRadius.large,
                image: DecorationImage(
                  image: NetworkImage(PLACEHOLDER_IMG),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: uiUtil.edgeInsets.horizontalSymmetric10,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Flexible(
                          child: AppText(
                            'Name $index',
                            style: uiUtil.textStyles.bodySmallBold.copyWith(
                              color: Colors.white,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    uiUtil.verticalSpacing.normal,
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
