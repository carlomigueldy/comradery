import 'package:comradery/common/utils/ui_util.dart';
import 'package:comradery/ui/widgets/dumb_widgets/dumb_widgets.dart';
import 'package:comradery/ui/widgets/feature/app_matching_card.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:swipe_cards/swipe_cards.dart';

import 'main_tab_viewmodel.dart';

class MainTabView extends StatelessWidget with UiUtilMixin {
  const MainTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mediaQuery = MediaQuery.of(context);

    return ViewModelBuilder<MainTabViewModel>.reactive(
      onModelReady: (model) => model.init(),
      viewModelBuilder: () => MainTabViewModel(),
      builder: (
        BuildContext context,
        MainTabViewModel model,
        Widget? child,
      ) {
        return Container(
          width: mediaQuery.size.width,
          height: mediaQuery.size.height,
          // color: uiUtil.colors.backgroundColor,
          padding: uiUtil.edgeInsets.horizontalSymmetric10,
          child: model.isBusy
              ? AppSpinner()
              : model.users.isNotEmpty
                  ? _MatchLayout(
                      model: model,
                    )
                  : !model.isBusy && model.users.isEmpty
                      ? Padding(
                          padding: uiUtil.edgeInsets.horizontalSymmetric15,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              AppText(
                                "Can't find anyone with similar interests as you at this moment.",
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        )
                      : Container(),
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

  final MainTabViewModel model;

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
                // model.toUserDetailView(user);
              },
              onTapNope: () {
                model.matchEngine.currentItem?.nope();
              },
              onTapLike: () {
                model.matchEngine.currentItem?.like();
              },
            );
          },
          onStackFinished: () {
            model.init();
          },
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
