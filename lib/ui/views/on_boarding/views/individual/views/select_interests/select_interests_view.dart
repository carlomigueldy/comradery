import 'package:comradery/common/utils/ui_util.dart';
import 'package:comradery/ui/widgets/dumb_widgets/button/app_button.dart';
import 'package:comradery/ui/widgets/dumb_widgets/dumb_widgets.dart';
import 'package:comradery/ui/widgets/feature/app_tag.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'select_interests_viewmodel.dart';

class SelectInterestsView extends StatelessWidget with UiUtilMixin {
  const SelectInterestsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mediaQuery = MediaQuery.of(context);

    return ViewModelBuilder<SelectInterestsViewModel>.reactive(
      onModelReady: (model) => model.init(),
      viewModelBuilder: () => SelectInterestsViewModel(),
      builder: (
        BuildContext context,
        SelectInterestsViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          body: Container(
            color: uiUtil.colors.backgroundColor,
            padding: uiUtil.edgeInsets.horizontalSymmetric25,
            width: mediaQuery.size.width,
            height: mediaQuery.size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                uiUtil.verticalSpacing.large,
                Container(
                  width: mediaQuery.size.width * 0.5,
                  child: Column(
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
                        onChanged: (value) {
                          EasyDebounce.debounce(
                            model.textSearchDebounceKey,
                            Duration(milliseconds: 500),
                            () => model.onQueryChange(value),
                          );
                        },
                      ),
                      uiUtil.verticalSpacing.veryLarge,
                      Container(
                        height: 200,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(color: uiUtil.colors.black),
                          borderRadius: uiUtil.borderRadius.large,
                        ),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Container(
                            padding: uiUtil.edgeInsets.all10,
                            child: Wrap(
                              spacing: 8.0,
                              runSpacing: 8.0,
                              children: model.fetchInterestsBusy ||
                                      model.textSearchBusy
                                  ? [AppSpinner()]
                                  : model.interests.map((interest) {
                                      return AppTag(
                                        text: interest.name,
                                        onTap: () =>
                                            model.onSelectInterest(interest),
                                        selected: model.selectedInterests
                                            .contains(interest),
                                      );
                                    }).toList(),
                            ),
                          ),
                        ),
                      ),
                      uiUtil.verticalSpacing.veryLarge,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          AppButton(
                            label: 'Continue',
                            onPressed: () => model.onTapContinue(),
                            busy: model.insertUserInterestsBusy,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
