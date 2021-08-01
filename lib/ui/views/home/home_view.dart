import 'package:comradery/common/utils/ui_util.dart';
import 'package:comradery/ui/views/on_boarding/views/individual/views/select_interests/select_interests_view.dart';
import 'package:comradery/ui/widgets/dumb_widgets/button/app_button.dart';
import 'package:comradery/ui/widgets/dumb_widgets/dumb_widgets.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:swipe_cards/swipe_cards.dart';

import 'home_viewmodel.dart';

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
              AppLeftDrawer(),
              Expanded(
                flex: 3,
                child: AppMainContainer(),
              ),
            ],
          ),
        );
      },
    );
  }
}

class AppMainContainer extends ViewModelWidget<HomeViewModel> with UiUtilMixin {
  const AppMainContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(
    BuildContext context,
    HomeViewModel model,
  ) {
    final theme = Theme.of(context);
    final mediaQuery = MediaQuery.of(context);

    return Container(
      width: mediaQuery.size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (model.users.isNotEmpty)
            SwipeCards(
              matchEngine: model.matchEngine,
              itemBuilder: (context, index) {
                return AppMatchingCard();
              },
              onStackFinished: () {},
            ),
          uiUtil.verticalSpacing.large,
          Container(
            width: mediaQuery.size.width * 0.5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AppButton(label: 'Nope', onPressed: () {}),
                AppButton(label: 'Open Profile', onPressed: () {}),
                AppButton(label: 'Like', onPressed: () {}),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AppLeftDrawer extends ViewModelWidget<HomeViewModel> with UiUtilMixin {
  const AppLeftDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(
    BuildContext context,
    HomeViewModel model,
  ) {
    return Container(
      height: double.infinity,
      width: 325,
      decoration: BoxDecoration(
        color: Colors.grey[100],
      ),
      child: SingleChildScrollView(
        padding: uiUtil.edgeInsets.horizontalSymmetric25,
        child: Column(
          children: [
            uiUtil.verticalSpacing.large,
            ListTile(
              leading: CircleAvatar(),
              title: AppText.body('Carlo Miguel Dy'),
              subtitle: AppText.bodySmall(
                'carlomigueldy@gmail.com',
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
                  if (value == 'logout') return model.logout();
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
            uiUtil.verticalSpacing.large,
            AppButton(
              label: 'Logout',
              onPressed: () => model.logout(),
            ),
          ],
        ),
      ),
    );
  }
}

class AppMatchingCard extends StatelessWidget with UiUtilMixin {
  const AppMatchingCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      height: 575,
      width: 400,
      decoration: BoxDecoration(
        color: theme.canvasColor,
        borderRadius: uiUtil.borderRadius.large,
        image: DecorationImage(
          image: NetworkImage(PLACEHOLDER_IMG),
          fit: BoxFit.cover,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.6),
            blurRadius: 10.0,
            offset: Offset(0, 5),
          )
        ],
      ),
      child: Padding(
        padding: uiUtil.edgeInsets.horizontalSymmetric25,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              children: [
                AppText(
                  'Mary Doe',
                  style: uiUtil.textStyles.body.copyWith(
                    color: Colors.white,
                    fontSize: 32,
                  ),
                ),
              ],
            ),
            uiUtil.verticalSpacing.large,
            Align(
              alignment: Alignment.topLeft,
              child: Wrap(
                alignment: WrapAlignment.start,
                crossAxisAlignment: WrapCrossAlignment.start,
                spacing: 8.0,
                runSpacing: 4.0,
                children: [
                  AppTag(
                    text: 'Coffee',
                    size: AppTagSize.small,
                  ),
                  AppTag(
                    text: 'Coffee',
                    size: AppTagSize.small,
                  ),
                  AppTag(
                    text: 'Coffee',
                    size: AppTagSize.small,
                  ),
                ],
              ),
            ),
            uiUtil.verticalSpacing.large,
            Row(
              children: [
                AppText(
                  'Bio bio bio',
                  style: uiUtil.textStyles.body.copyWith(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            uiUtil.verticalSpacing.veryLarge,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircleAvatar(
                  child: Icon(Icons.close),
                  radius: 32,
                ),
                CircleAvatar(
                  child: Icon(Icons.favorite_rounded),
                  radius: 32,
                ),
              ],
            ),
            uiUtil.verticalSpacing.large,
          ],
        ),
      ),
    );
  }
}
