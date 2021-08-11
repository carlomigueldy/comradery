import 'package:comradery/common/utils/ui_util.dart';
import 'package:comradery/ui/views/app/widgets/tabs/matches_tab_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'my_matches_tab_viewmodel.dart';

class MyMatchesTabView extends StatelessWidget with UiUtilMixin {
  const MyMatchesTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ViewModelBuilder<MyMatchesTabViewModel>.reactive(
      onModelReady: (model) => model.init(),
      viewModelBuilder: () => MyMatchesTabViewModel(),
      builder: (
        BuildContext context,
        MyMatchesTabViewModel model,
        Widget? child,
      ) {
        return Container(
          padding: uiUtil.edgeInsets.horizontalSymmetric25,
          // color: uiUtil.colors.backgroundColor,
          child: MatchesTabViewLayoutBuilder(
            matchings: model.filteredMatchings,
            onTap: (value) {
              model.toUserDetailView(value.createdBy);
            },
          ),
        );
      },
    );
  }
}
