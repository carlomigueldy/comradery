import 'package:comradery/common/utils/ui_util.dart';
import 'package:comradery/ui/views/app/widgets/tabs/conversations_tab_view_layout_builder.dart';
import 'package:comradery/ui/widgets/dumb_widgets/dumb_widgets.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'conversations_tab_viewmodel.dart';

class ConversationsTabView extends StatelessWidget with UiUtilMixin {
  const ConversationsTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ViewModelBuilder<ConversationsTabViewModel>.reactive(
      // onModelReady: (model) => model.init(),
      viewModelBuilder: () => ConversationsTabViewModel(),
      builder: (
        BuildContext context,
        ConversationsTabViewModel model,
        Widget? child,
      ) {
        return Container(
          padding: uiUtil.edgeInsets.horizontalSymmetric25,
          child: model.appViewModel.fetchMyConversationsBusy
              ? AppSpinner()
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      uiUtil.verticalSpacing.large,
                      Row(
                        children: [
                          Text(
                            'Conversations',
                            style: uiUtil.textStyles.heading3.copyWith(
                              color: theme.primaryColor,
                            ),
                          ),
                        ],
                      ),
                      uiUtil.verticalSpacing.large,
                      ConversationsTabViewLayoutBuilder(
                        conversations: model.appViewModel.conversations,
                        authUser: model.appViewModel.authUser!,
                      ),
                      uiUtil.verticalSpacing.huge,
                    ],
                  ),
                ),
        );
      },
    );
  }
}
