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
            flex: 5,
            child: TabBarView(
              controller: tabController,
              children: [
                _MatchesTabView(),
                _MessagesTabView(),
                _MyTeamsTabView(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MyTeamsTabView extends StatelessWidget with UiUtilMixin {
  const _MyTeamsTabView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: uiUtil.edgeInsets.horizontalSymmetric25,
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: 25,
        itemBuilder: (context, index) {
          return Container(
            height: 175,
            decoration: BoxDecoration(
              color: theme.primaryColor,
              borderRadius: uiUtil.borderRadius.large,
              image: DecorationImage(
                image: NetworkImage(PLACEHOLDER_IMG),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
                child: AppText.bodyBold(
              'Team $index',
              style: uiUtil.textStyles.bodyBold.copyWith(
                color: Colors.white,
              ),
            )),
          );
        },
        separatorBuilder: (context, index) {
          return uiUtil.verticalSpacing.large;
        },
      ),
    );
  }
}

class _MessagesTabView extends StatelessWidget with UiUtilMixin {
  const _MessagesTabView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListView.separated(
      shrinkWrap: true,
      itemCount: 25,
      itemBuilder: (context, index) {
        return _MessageListTile(
          onTap: () {},
          onLongPress: () {},
        );
      },
      separatorBuilder: (context, index) {
        return uiUtil.verticalSpacing.large;
      },
    );
  }
}

class _MessageListTile extends StatefulWidget {
  const _MessageListTile({
    Key? key,
    this.onTap,
    this.onLongPress,
  }) : super(key: key);

  final Function()? onTap;
  final Function()? onLongPress;

  @override
  __MessageListTileState createState() => __MessageListTileState();
}

class __MessageListTileState extends State<_MessageListTile> with UiUtilMixin {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: widget.onTap,
      onLongPress: widget.onLongPress,
      child: Container(
        padding: uiUtil.edgeInsets.horizontalSymmetric25,
        decoration: BoxDecoration(
          // color: Colors.white,
          borderRadius: uiUtil.borderRadius.large,
        ),
        child: Row(
          children: [
            uiUtil.horizontalSpacing.normal,
            CircleAvatar(
              backgroundColor: theme.primaryColor,
              backgroundImage: NetworkImage(COMRADE_DOGE_IMG),
              radius: 24,
            ),
            uiUtil.horizontalSpacing.large,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText.body('User'),
                  Row(
                    children: [
                      Flexible(
                        child: AppText.bodySmall(
                          'textdasdaseqwnjenqwlkeqwnlekqwnlewq',
                          style: uiUtil.textStyles.bodySmall.copyWith(
                            color: uiUtil.colors.mediumGray,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
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
                color: theme.canvasColor,
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
