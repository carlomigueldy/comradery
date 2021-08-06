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
    this.onTapCreateTeam,
  }) : super(key: key);

  final List<Team> teams;
  final Function(Team)? onTap;
  final Function()? onTapCreateTeam;

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

                    return AppTeamCard(
                      onTap: () => onTap?.call(team),
                      team: team,
                    );
                  },
                  separatorBuilder: (context, index) {
                    return uiUtil.verticalSpacing.large;
                  },
                )
              : Column(
                  children: [
                    Text('No teams yet.'),
                    uiUtil.verticalSpacing.large,
                    InkWell(
                      onTap: onTapCreateTeam,
                      child: Container(
                        height: 125,
                        decoration: BoxDecoration(
                          color: Colors.green.withOpacity(0.2),
                          borderRadius: uiUtil.borderRadius.large,
                          border: Border.all(
                            color: Colors.green,
                            width: 2.0,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add_rounded,
                              color: Colors.green,
                            ),
                            uiUtil.horizontalSpacing.normal,
                            AppText.bodyBold(
                              'Create Team',
                              style: uiUtil.textStyles.bodyBold.copyWith(
                                color: Colors.green,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
          uiUtil.verticalSpacing.huge,
        ],
      ),
    );
  }
}

class AppTeamCard extends StatelessWidget with UiUtilMixin {
  const AppTeamCard({
    Key? key,
    required this.team,
    this.onTap,
  }) : super(key: key);

  final Function()? onTap;
  final Team team;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: onTap,
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
  }
}
