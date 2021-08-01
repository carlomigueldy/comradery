import 'package:comradery/ui/widgets/dumb_widgets/dumb_widgets.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'user_detail_viewmodel.dart';

class UserDetailView extends StatelessWidget {
  const UserDetailView({
    Key? key,
    @PathParam('userId') this.userId,
  }) : super(key: key);

  final String? userId;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<UserDetailViewModel>.reactive(
      viewModelBuilder: () => UserDetailViewModel(),
      builder: (
        BuildContext context,
        UserDetailViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          appBar: AppBar(
            title: AppText.body('$userId'),
          ),
          body: Center(
            child: Text(
              'UserDetailView $userId',
            ),
          ),
        );
      },
    );
  }
}
