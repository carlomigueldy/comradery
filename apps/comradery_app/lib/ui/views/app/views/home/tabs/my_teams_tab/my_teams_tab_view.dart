import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'my_teams_tab_viewmodel.dart';

class MyTeamsTabView extends StatelessWidget {
  const MyTeamsTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MyTeamsTabViewModel>.reactive(
      viewModelBuilder: () => MyTeamsTabViewModel(),
      builder: (
        BuildContext context,
        MyTeamsTabViewModel model,
        Widget? child,
      ) {
        return Center(
          child: Text(
            'MyTeamsTabView',
          ),
        );
      },
    );
  }
}
