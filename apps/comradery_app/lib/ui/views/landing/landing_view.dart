import 'package:comradery/common/utils/ui_util.dart';
import 'package:comradery/ui/widgets/dumb_widgets/app_bar/app_top_bar.dart';
import 'package:comradery/ui/widgets/dumb_widgets/button/app_button.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

import 'landing_viewmodel.dart';

class LandingView extends StatelessWidget with UiUtilMixin {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  LandingView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mediaQuery = MediaQuery.of(context);

    return ViewModelBuilder<LandingViewModel>.reactive(
      onModelReady: (model) => model.init(),
      viewModelBuilder: () => LandingViewModel(),
      builder: (
        BuildContext context,
        LandingViewModel model,
        Widget? child,
      ) {
        final appBanner = Image.asset(
          'assets/png/banner.png',
          width: 350,
        );
        final aboutUsButton = AppButton.text(
          label: 'About Us',
          onPressed: () => model.toAboutUsView(),
          textColor: Colors.black,
        );
        final loginButton = AppButton.text(
          label: 'Login',
          onPressed: () => model.toSignInView(),
        );
        final createAccountButton = AppButton(
          label: 'Create Account',
          onPressed: () => model.toSignUpView(),
        );
        final body = [
          uiUtil.verticalSpacing.veryLarge,
          Text(
            'FIND YOUR PACK',
            style: uiUtil.textStyles.heading1.copyWith(
              fontSize: 50,
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
          uiUtil.verticalSpacing.large,
          Image.asset(
            'assets/png/landing-illustration.png',
          ),
        ];
        final desktopAppBar = Row(
          children: [
            appBanner,
            Spacer(),
            aboutUsButton,
            uiUtil.horizontalSpacing.large,
            loginButton,
            uiUtil.horizontalSpacing.large,
            createAccountButton,
          ],
        );
        final desktopColumn = Column(
          children: [
            uiUtil.verticalSpacing.large,
            desktopAppBar,
            ...body,
          ],
        );
        Container container(Widget child) {
          return Container(
            color: uiUtil.colors.backgroundColor,
            padding: uiUtil.edgeInsets.horizontalSymmetric25,
            child: child,
          );
        }

        final desktop = Scaffold(
          key: _scaffoldKey,
          body: container(desktopColumn),
        );

        return Container(
          color: uiUtil.colors.backgroundColor,
          child: SafeArea(
            child: ScreenTypeLayout(
              mobile: Scaffold(
                key: _scaffoldKey,
                drawer: Drawer(
                  elevation: 0,
                  child: Container(
                    color: uiUtil.colors.backgroundColor,
                    padding: uiUtil.edgeInsets.horizontalSymmetric25,
                    child: Column(
                      children: [
                        uiUtil.verticalSpacing.large,
                        appBanner,
                        uiUtil.verticalSpacing.large,
                        aboutUsButton,
                        uiUtil.verticalSpacing.large,
                        loginButton,
                        uiUtil.verticalSpacing.large,
                        createAccountButton,
                        uiUtil.verticalSpacing.large,
                      ],
                    ),
                  ),
                ),
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
                body: container(
                  Container(
                    width: mediaQuery.size.width,
                    height: mediaQuery.size.height,
                    child: Column(
                      children: [
                        ...body,
                      ],
                    ),
                  ),
                ),
              ),
              desktop: desktop,
            ),
          ),
        );
      },
    );
  }
}
