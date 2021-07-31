import 'package:comradery/common/utils/ui_util.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'startup_viewmodel.dart';

class StartupView extends StatefulWidget {
  const StartupView({Key? key}) : super(key: key);
  @override
  _StartupViewState createState() => _StartupViewState();
}

class _StartupViewState extends State<StartupView> with UiUtilMixin {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StartupViewModel>.reactive(
      onModelReady: (model) => model.init(),
      viewModelBuilder: () => StartupViewModel(),
      builder: (
        BuildContext context,
        StartupViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          body: Center(
            child: Text(
              'Comradery App',
              style: uiUtil.textStyles.body.copyWith(
                fontSize: 24,
              ),
            ),
          ),
        );
      },
    );
  }
}
