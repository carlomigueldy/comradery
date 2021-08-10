import 'package:comradery/common/utils/ui_util.dart';
import 'package:comradery/ui/widgets/dumb_widgets/button/app_button.dart';
import 'package:comradery/ui/widgets/dumb_widgets/dumb_widgets.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

import 'select_goal_viewmodel.dart';

class SelectGoalView extends StatefulWidget {
  const SelectGoalView({Key? key}) : super(key: key);

  @override
  _SelectGoalViewState createState() => _SelectGoalViewState();
}

class _SelectGoalViewState extends State<SelectGoalView> with UiUtilMixin {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mediaQuery = MediaQuery.of(context);

    final containerWidth = mediaQuery.size.width * 0.4;

    return ViewModelBuilder<SelectGoalViewModel>.reactive(
      viewModelBuilder: () => SelectGoalViewModel(),
      builder: (
        BuildContext context,
        SelectGoalViewModel model,
        Widget? child,
      ) {
        final column = Column(
          children: [
            _GoalListTile(
              title: 'I want to find a team with similar interests',
              groupValue: model.goal,
              onChanged: (Goal? value) {
                if (value != null) model.onSelectGoal(value);
              },
              value: Goal.findTeam,
              selected: model.goal == Goal.findTeam,
            ),
            uiUtil.verticalSpacing.large,
            _GoalListTile(
              title: 'I want to find individuals with similar interests',
              groupValue: model.goal,
              onChanged: (Goal? value) {
                if (value != null) model.onSelectGoal(value);
              },
              value: Goal.findIndividuals,
              selected: model.goal == Goal.findIndividuals,
            ),
            uiUtil.verticalSpacing.veryLarge,
            uiUtil.verticalSpacing.veryLarge,
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  child: AppButton(
                    label: 'Continue',
                    onPressed: () => model.proceed(),
                  ),
                ),
              ],
            ),
          ],
        );
        return Scaffold(
          body: Container(
            width: double.infinity,
            color: uiUtil.colors.backgroundColor,
            child: Padding(
              padding: uiUtil.edgeInsets.horizontalSymmetric25,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  uiUtil.verticalSpacing.large,
                  AppText.body(
                    "What's your goal?",
                    style: uiUtil.textStyles.body.copyWith(
                      fontSize: 32,
                    ),
                  ),
                  uiUtil.verticalSpacing.veryLarge,
                  uiUtil.verticalSpacing.veryLarge,
                  ScreenTypeLayout(
                    mobile: column,
                    desktop: SizedBox(
                      width: containerWidth,
                      child: column,
                    ),
                    tablet: SizedBox(
                      width: containerWidth,
                      child: column,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _GoalListTile<T> extends StatelessWidget with UiUtilMixin {
  const _GoalListTile({
    Key? key,
    required this.title,
    required this.value,
    this.groupValue,
    this.onChanged,
    this.selected = false,
  }) : super(key: key);

  final String title;
  final T value;
  final T? groupValue;
  final Function(T?)? onChanged;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        color:
            selected ? theme.primaryColor : theme.primaryColor.withOpacity(0.1),
        borderRadius: uiUtil.borderRadius.large,
      ),
      child: RadioListTile<T>(
        title: AppText.body(
          title,
          style: uiUtil.textStyles.body.copyWith(
            color: selected ? Colors.white : null,
          ),
        ),
        groupValue: groupValue,
        onChanged: onChanged,
        value: value,
        contentPadding: uiUtil.edgeInsets.all15,
        activeColor: Colors.white,
      ),
    );
  }
}
