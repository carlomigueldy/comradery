import 'package:comradery/common/utils/ui_util.dart';
import 'package:comradery/ui/widgets/dumb_widgets/dumb_widgets.dart';
import 'package:comradery/ui/widgets/dumb_widgets/spinner/app_spinner.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'conversation_detail_viewmodel.dart';

class ConversationDetailView extends StatelessWidget with UiUtilMixin {
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
    final mediaQuery = MediaQuery.of(context);
    final theme = Theme.of(context);

    return ViewModelBuilder<ConversationDetailViewModel>.reactive(
      onModelReady: (model) => model.init(),
      viewModelBuilder: () => ConversationDetailViewModel(
        conversationId: conversationId,
      ),
      builder: (
        BuildContext context,
        ConversationDetailViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          appBar: AppBar(
            title: model.fetchConversationBusy
                ? AppSpinner()
                : Text(model.conversation?.name ?? '-'),
          ),
          body: Row(
            children: [
              Expanded(
                child: Container(
                  height: mediaQuery.size.height,
                  child: Stack(
                    children: [
                      SingleChildScrollView(
                        padding: uiUtil.edgeInsets.horizontalSymmetric25,
                        child: Column(
                          children: [
                            uiUtil.verticalSpacing.large,
                            ListView.separated(
                              shrinkWrap: true,
                              itemCount: 30,
                              physics: NeverScrollableScrollPhysics(),
                              reverse: true,
                              itemBuilder: (context, index) {
                                return Row(
                                  mainAxisAlignment: index % 2 == 0
                                      ? MainAxisAlignment.end
                                      : MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: Text('$index'),
                                    ),
                                  ],
                                );
                              },
                              separatorBuilder: (context, index) {
                                return uiUtil.verticalSpacing.large;
                              },
                            ),
                            uiUtil.verticalSpacing.veryLarge,
                            uiUtil.verticalSpacing.veryLarge,
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 25,
                        left: 25,
                        right: 25,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: uiUtil.borderRadius.large,
                            boxShadow: [
                              uiUtil.boxShadows.small,
                            ],
                          ),
                          child: AppTextField(
                            name: 'message',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: 300,
                color: Colors.blue,
              ),
            ],
          ),
        );
      },
    );
  }
}
