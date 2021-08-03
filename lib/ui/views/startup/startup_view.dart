import 'package:comradery/common/utils/ui_util.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'startup_viewmodel.dart';

class StartupView extends StatefulWidget {
  const StartupView({
    Key? key,
    @QueryParam('access_token') this.accessToken,
  }) : super(key: key);

  final String? accessToken;

  @override
  _StartupViewState createState() => _StartupViewState();
}

class _StartupViewState extends State<StartupView> with UiUtilMixin {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StartupViewModel>.reactive(
      onModelReady: (model) => model.init(),
      viewModelBuilder: () => StartupViewModel(
        accessToken: widget.accessToken,
      ),
      builder: (
        BuildContext context,
        StartupViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          body: Container(
            color: uiUtil.colors.backgroundColor,
            child: Center(
              child: Image.asset(
                'assets/png/banner.png',
                height: 300,
                width: 300,
              ),
            ),
          ),
        );
      },
    );
  }
}
