import 'package:comradery/common/utils/ui_util.dart';
import 'package:comradery/ui/widgets/dumb_widgets/button/app_button.dart';
import 'package:comradery/ui/widgets/dumb_widgets/dumb_widgets.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'select_interests_viewmodel.dart';

class SelectInterestsView extends StatelessWidget with UiUtilMixin {
  const SelectInterestsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SelectInterestsViewModel>.reactive(
      viewModelBuilder: () => SelectInterestsViewModel(),
      builder: (
        BuildContext context,
        SelectInterestsViewModel model,
        Widget? child,
      ) {
        final theme = Theme.of(context);

        return Scaffold(
          body: Center(
            child: Container(
              // width: double.infinity,
              width: 450,
              child: SingleChildScrollView(
                padding: uiUtil.edgeInsets.horizontalSymmetric25,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // uiUtil.verticalSpacing.large,
                    Column(
                      children: [
                        Row(children: [
                          AppText(
                            'What are your interests?',
                            style: uiUtil.textStyles.body.copyWith(
                              fontSize: 32,
                            ),
                          ),
                        ]),
                        uiUtil.verticalSpacing.normal,
                        Row(children: [
                          AppText(
                            'Select at least 3',
                            style: uiUtil.textStyles.body.copyWith(
                              fontSize: 18,
                            ),
                          ),
                        ]),
                        uiUtil.verticalSpacing.large,
                        AppTextField(
                          name: 'search',
                          label: 'Search...',
                        ),
                      ],
                    ),
                    uiUtil.verticalSpacing.veryLarge,
                    Wrap(
                      spacing: 8.0,
                      runSpacing: 8.0,
                      children: [
                        AppTag(
                          text: 'Agriculture',
                          selected: true,
                        ),
                        AppTag(text: 'Artificial Intelligence'),
                        AppTag(text: 'Supabase'),
                        AppTag(text: 'Finance'),
                        AppTag(text: 'Blockchain'),
                        AppTag(
                          text: 'UI/UX',
                          selected: true,
                        ),
                        AppTag(text: 'Finance'),
                        AppTag(text: 'Firebase'),
                        AppTag(text: 'Postgres'),
                      ],
                    ),
                    uiUtil.verticalSpacing.veryLarge,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        AppButton(
                          label: 'Continue',
                          onPressed: () => model.toHomeView(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

enum AppTagSize {
  small,
  normal,
}

class AppTag extends StatelessWidget with UiUtilMixin {
  const AppTag({
    Key? key,
    required this.text,
    this.selected = false,
    this.size = AppTagSize.normal,
  }) : super(key: key);

  final AppTagSize size;
  final String text;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: uiUtil.edgeInsets.all10,
      decoration: BoxDecoration(
        color: selected ? theme.primaryColor : theme.accentColor,
        borderRadius: uiUtil.borderRadius.circle,
      ),
      child: AppText(
        text,
        style: uiUtil.textStyles.body.copyWith(
          color: selected ? Colors.white : theme.textTheme.bodyText1?.color,
          fontSize: size == AppTagSize.small
              ? uiUtil.textStyles.bodySmall.fontSize
              : uiUtil.textStyles.body.fontSize,
        ),
      ),
    );
  }
}
