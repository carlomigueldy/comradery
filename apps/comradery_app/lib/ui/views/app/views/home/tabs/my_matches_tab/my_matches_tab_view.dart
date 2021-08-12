import 'package:comradery/common/utils/ui_util.dart';
import 'package:comradery/ui/views/app/widgets/tabs/matches_tab_view_layout_builder.dart';
import 'package:comradery/ui/widgets/dumb_widgets/dumb_widgets.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'my_matches_tab_viewmodel.dart';

class MyMatchesTabView extends StatelessWidget with UiUtilMixin {
  const MyMatchesTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ViewModelBuilder<MyMatchesTabViewModel>.reactive(
      // onModelReady: (model) => model.appViewModel.fetchMyMatchings(),
      viewModelBuilder: () => MyMatchesTabViewModel(),
      builder: (
        BuildContext context,
        MyMatchesTabViewModel model,
        Widget? child,
      ) {
        return Container(
          padding: uiUtil.edgeInsets.horizontalSymmetric25,
          // color: uiUtil.colors.backgroundColor,
          child: model.isBusy
              ? AppSpinner()
              : Container(
                  child: Column(
                    children: [
                      uiUtil.verticalSpacing.large,
                      Row(
                        children: [
                          Text(
                            'My Matches',
                            style: uiUtil.textStyles.heading3.copyWith(
                              color: theme.primaryColor,
                            ),
                          ),
                        ],
                      ),
                      uiUtil.verticalSpacing.large,
                      MatchesTabViewLayoutBuilder(
                        matchings: model.appViewModel.filteredMatchings,
                        onTap: (value) {
                          model.appViewModel.toUserDetailView(value.createdBy);
                        },
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
