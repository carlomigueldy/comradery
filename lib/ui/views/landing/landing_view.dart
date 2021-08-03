import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'landing_viewmodel.dart';

class LandingView extends StatelessWidget {
  const LandingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LandingViewModel>.reactive(
      viewModelBuilder: () => LandingViewModel(),
      builder: (
        BuildContext context,
        LandingViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          body: Center(
            child: Text(
              'LandingView',
            ),
          ),
        );
      },
    );
  }
}
