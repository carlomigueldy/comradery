import 'package:comradery/common/utils/ui_util.dart';
import 'package:comradery/ui/widgets/dumb_widgets/button/app_button.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'landing_viewmodel.dart';

class LandingView extends StatelessWidget with UiUtilMixin {
  const LandingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ViewModelBuilder<LandingViewModel>.reactive(
      onModelReady: (model) => model.init(),
      viewModelBuilder: () => LandingViewModel(),
      builder: (
        BuildContext context,
        LandingViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          body: Container(
            color: uiUtil.colors.backgroundColor,
            padding: uiUtil.edgeInsets.horizontalSymmetric25,
            child: Column(
              children: [
                uiUtil.verticalSpacing.large,
                Row(
                  children: [
                    Image.asset(
                      'assets/png/banner.png',
                      width: 350,
                    ),
                    Spacer(),
                    AppButton.text(
                      label: 'About Us',
                      onPressed: () => model.toAboutUsView(),
                      textColor: Colors.black,
                    ),
                    uiUtil.horizontalSpacing.large,
                    AppButton.text(
                      label: 'Login',
                      onPressed: () => model.toSignInView(),
                    ),
                    uiUtil.horizontalSpacing.large,
                    AppButton(
                      label: 'Create Account',
                      onPressed: () => model.toSignUpView(),
                    ),
                  ],
                ),
                uiUtil.verticalSpacing.veryLarge,
                Text(
                  'FIND YOUR PACK',
                  style: uiUtil.textStyles.heading1.copyWith(
                    fontSize: 64,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                uiUtil.verticalSpacing.large,
                Container(
                  width: 150,
                  child: AppButton(
                    label: 'Get Started',
                    onPressed: () => model.toSignUpView(),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
