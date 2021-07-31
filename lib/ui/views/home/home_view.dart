import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (
        BuildContext context,
        HomeViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          body: Center(
            child: Text(
              'HomeView',
            ),
          ),
        );
      },
    );
  }
}
