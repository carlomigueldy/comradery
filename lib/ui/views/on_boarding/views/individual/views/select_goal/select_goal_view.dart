import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'select_goal_viewmodel.dart';

class SelectGoalView extends StatelessWidget {
  const SelectGoalView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SelectGoalViewModel>.reactive(
      viewModelBuilder: () => SelectGoalViewModel(),
      builder: (
        BuildContext context,
        SelectGoalViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          body: Center(
            child: Text(
              'SelectGoalView',
            ),
          ),
        );
      },
    );
  }
}
