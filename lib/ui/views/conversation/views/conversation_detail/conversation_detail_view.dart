import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'conversation_detail_viewmodel.dart';

class ConversationDetailView extends StatelessWidget {
  const ConversationDetailView({
    Key? key,
    @PathParam(
      'conversationId',
    )
        required this.conversationId,
  }) : super(key: key);

  final String conversationId;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ConversationDetailViewModel>.reactive(
      viewModelBuilder: () => ConversationDetailViewModel(),
      builder: (
        BuildContext context,
        ConversationDetailViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          body: Center(
            child: Text(
              'ConversationDetailView $conversationId',
            ),
          ),
        );
      },
    );
  }
}
