import 'package:comradery/common/utils/ui_util.dart';
import 'package:comradery/ui/widgets/dumb_widgets/button/app_button.dart';
import 'package:comradery/ui/widgets/dumb_widgets/dumb_widgets.dart';
import 'package:comradery/ui/widgets/dumb_widgets/spinner/app_spinner.dart';
import 'package:comradery/ui/widgets/feature/app_matching_card.dart';
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
          body: Container(
            width: mediaQuery.size.width,
            height: mediaQuery.size.height,
            color: uiUtil.colors.backgroundColor,
            child: model.isBusy
                ? AppSpinner()
                : model.users.isNotEmpty
                    ? _MatchLayout(
                        model: model,
                      )
                    : Center(
                        child: AppText(
                          "Can't find anyone with similar interests as you at this moment.",
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
    return SingleChildScrollView(
      child: Column(
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
          Container(
            // width: mediaQuery.size.width * 0.3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AppButton.text(
                  label: 'Nope',
                  onPressed: () {
                    model.matchEngine.currentItem?.nope();
                  },
                ),
                // TODO: To remove
                AppButton.text(
                  label: 'Chat',
                  onPressed: () {
                    model.toConversationView();
                  },
                ),
                AppButton.text(
                  label: 'Open Profile',
                  onPressed: () => model.viewUserProfile(),
                ),
                AppButton.text(
                  label: 'Like',
                  onPressed: () {
                    model.matchEngine.currentItem?.like();
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
