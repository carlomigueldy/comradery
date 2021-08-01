import 'package:comradery/common/utils/ui_util.dart';
import 'package:comradery/ui/views/home/home_viewmodel.dart';
import 'package:comradery/ui/widgets/dumb_widgets/button/app_button.dart';
import 'package:comradery/ui/widgets/feature/app_matching_card.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:swipe_cards/swipe_cards.dart';

class HomeViewMainContainer extends ViewModelWidget<HomeViewModel>
    with UiUtilMixin {
  const HomeViewMainContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(
    BuildContext context,
    HomeViewModel model,
  ) {
    final theme = Theme.of(context);
    final mediaQuery = MediaQuery.of(context);

    return SingleChildScrollView(
      child: Container(
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
              width: mediaQuery.size.width * 0.3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  AppButton.text(label: 'Nope', onPressed: () {}),
                  AppButton.text(label: 'Open Profile', onPressed: () {}),
                  AppButton.text(label: 'Like', onPressed: () {}),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
