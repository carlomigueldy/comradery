import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'select_interests_viewmodel.dart';

class SelectInterestsView extends StatelessWidget {
  const SelectInterestsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SelectInterestsViewModel>.reactive(
      viewModelBuilder: () => SelectInterestsViewModel(),
      builder: (
        BuildContext context,
        SelectInterestsViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          body: Center(
            child: Text(
              'SelectInterestsView',
            ),
          ),
        );
      },
    );
  }
}
