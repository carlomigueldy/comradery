import 'package:comradery/app.dart';
import 'package:comradery/common/utils/ui_util.dart';
import 'package:comradery/ui/views/app/app_viewmodel.dart';
import 'package:comradery/ui/views/app/widgets/app_view_left_drawer.dart';
import 'package:comradery/ui/widgets/dumb_widgets/app_bar/app_top_bar.dart';
import 'package:comradery/ui/widgets/dumb_widgets/button/app_button.dart';
import 'package:comradery/ui/widgets/dumb_widgets/dumb_widgets.dart';
import 'package:comradery/ui/widgets/dumb_widgets/spinner/app_spinner.dart';
import 'package:comradery/ui/widgets/feature/app_matching_card.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:swipe_cards/swipe_cards.dart';

import 'home_viewmodel.dart';

class HomeView extends StatelessWidget with UiUtilMixin {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  HomeView({
    Key? key,
  }) : super(key: key);

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

        final leftDrawer = AppViewLeftDrawer(model: model.appViewModel);

        return Container(
          color: uiUtil.colors.backgroundColor,
          child: SafeArea(
            child: Scaffold(
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
              body: Container(
                width: mediaQuery.size.width,
                height: mediaQuery.size.height,
                color: uiUtil.colors.backgroundColor,
                padding: uiUtil.edgeInsets.horizontalSymmetric10,
                child: model.isBusy
                    ? AppSpinner()
                    : model.users.isNotEmpty
                        ? _MatchLayout(
                            model: model,
                          )
                        : !model.isBusy && model.users.isEmpty
                            ? Center(
                                child: AppText(
                                  "Can't find anyone with similar interests as you at this moment.",
                                ),
                              )
                            : Container(),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _MatchLayout extends StatelessWidget with UiUtilMixin {
  const _MatchLayout({
    Key? key,
    required this.model,
  }) : super(key: key);

  final HomeViewModel model;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (model.likeUserBusy || model.nopeUserBusy) AppSpinner(),
        SwipeCards(
          matchEngine: model.matchEngine,
          itemBuilder: (context, index) {
            final user = model.users[index];

            return AppMatchingCard(
              user: user,
              onTap: () {
                model.toUserDetailView(user);
              },
              onTapNope: () {
                model.matchEngine.currentItem?.nope();
              },
              onTapLike: () {
                model.matchEngine.currentItem?.like();
              },
            );
          },
          onStackFinished: () {},
        ),
        uiUtil.verticalSpacing.large,
        // Container(
        //   // width: mediaQuery.size.width * 0.3,
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceAround,
        //     children: [
        //       AppButton.text(
        //         label: 'Nope',
        //         onPressed: () {
        //           model.matchEngine.currentItem?.nope();
        //         },
        //       ),
        //       // TODO: To remove
        //       AppButton.text(
        //         label: 'Chat',
        //         onPressed: () {
        //           model.toConversationView();
        //         },
        //       ),
        //       AppButton.text(
        //         label: 'Open Profile',
        //         onPressed: () => model.viewUserProfile(),
        //       ),
        //       AppButton.text(
        //         label: 'Like',
        //         onPressed: () {
        //           model.matchEngine.currentItem?.like();
        //         },
        //       ),
        //     ],
        //   ),
        // ),
      ],
    );
  }
}
