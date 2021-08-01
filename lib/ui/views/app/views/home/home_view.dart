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
          body: model.isBusy
              ? AppSpinner()
              : SingleChildScrollView(
                  child: Container(
                    width: mediaQuery.size.width,
                    height: mediaQuery.size.height,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: model.users.isNotEmpty
                          ? [
                              if (model.likeUserBusy || model.nopeUserBusy)
                                AppSpinner(),
                              SwipeCards(
                                matchEngine: model.matchEngine,
                                itemBuilder: (context, index) {
                                  return AppMatchingCard(
                                    onTapNope: () {
                                      model.nopeUser();
                                    },
                                    onTapLike: () {
                                      model.likeUser();
                                    },
                                  );
                                },
                                onStackFinished: () {},
                              ),
                              uiUtil.verticalSpacing.large,
                              Container(
                                // width: mediaQuery.size.width * 0.3,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    AppButton.text(
                                        label: 'Nope',
                                        onPressed: () {
                                          model.nopeUser();
                                        }),
                                    // TODO: To remove
                                    AppButton.text(
                                        label: 'Chat',
                                        onPressed: () {
                                          model.toConversationView();
                                        }),
                                    AppButton.text(
                                      label: 'Open Profile',
                                      onPressed: () => model.viewUserProfile(),
                                    ),
                                    AppButton.text(
                                        label: 'Like',
                                        onPressed: () {
                                          model.likeUser();
                                        }),
                                  ],
                                ),
                              ),
                            ]
                          : [
                              AppText(
                                "Can't find anyone with similar interests as you at this moment.",
                              ),
                            ],
                    ),
                  ),
                ),
        );
      },
    );
  }
}
