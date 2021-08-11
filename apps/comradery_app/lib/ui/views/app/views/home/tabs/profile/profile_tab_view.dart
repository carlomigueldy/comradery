import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'profile_tab_viewmodel.dart';

class ProfileTabView extends StatelessWidget {
  const ProfileTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileTabViewModel>.reactive(
      viewModelBuilder: () => ProfileTabViewModel(),
      builder: (
        BuildContext context,
        ProfileTabViewModel model,
        Widget? child,
      ) {
        return Center(
          child: Text(
            'ProfileTabView',
          ),
        );
      },
    );
  }
}
