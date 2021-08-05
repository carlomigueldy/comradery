import 'package:comradery/common/utils/ui_util.dart';
import 'package:comradery/team/models/team.dart';
import 'package:comradery/ui/placeholders/placeholder_images.dart';
import 'package:comradery/ui/widgets/dumb_widgets/dumb_widgets.dart';
import 'package:flutter/material.dart';

class MyTeamsTabView extends StatelessWidget with UiUtilMixin {
  const MyTeamsTabView({
    Key? key,
    required this.teams,
    this.onTap,
  }) : super(key: key);

  final List<Team> teams;
  final Function(Team)? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SingleChildScrollView(
      padding: uiUtil.edgeInsets.horizontalSymmetric25,
      child: Column(
        children: [
          uiUtil.verticalSpacing.large,
          teams.isNotEmpty
              ? ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: teams.length,
                  itemBuilder: (context, index) {
                    final team = teams[index];

                    return InkWell(
                      onTap: () => onTap?.call(team),
                      child: Container(
                        height: 175,
                        decoration: BoxDecoration(
                          color: theme.canvasColor,
                          borderRadius: uiUtil.borderRadius.large,
                          image: DecorationImage(
                            image: NetworkImage(PLACEHOLDER_IMG),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Center(
                            child: AppText.bodyBold(
                          team.name,
                          style: uiUtil.textStyles.bodyBold.copyWith(
                            color: Colors.white,
                          ),
                        )),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return uiUtil.verticalSpacing.large;
                  },
                )
              : Text('No teams yet.'),
          uiUtil.verticalSpacing.huge,
        ],
      ),
    );
  }
}
