import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'conversations_tab_viewmodel.dart';

class ConversationsTabView extends StatelessWidget {
  const ConversationsTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ConversationsTabViewModel>.reactive(
      viewModelBuilder: () => ConversationsTabViewModel(),
      builder: (
        BuildContext context,
        ConversationsTabViewModel model,
        Widget? child,
      ) {
        return Center(
          child: Text(
            'ConversationsTabView',
          ),
        );
      },
    );
  }
}
