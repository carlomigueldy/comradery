import 'package:cached_network_image/cached_network_image.dart';
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
              ? Column(
                  children: [
                    ListView.separated(
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
                    ),
                    uiUtil.verticalSpacing.large,
                    // _CreateTeamTile(onTap: onTapCreateTeam),
                  ],
                )
              : Column(
                  children: [
                    Text('No teams yet.'),
                    uiUtil.verticalSpacing.large,
                    _CreateTeamTile(onTap: onTapCreateTeam),
                  ],
                ),
          uiUtil.verticalSpacing.huge,
        ],
      ),
    );
  }
}

class _CreateTeamTile extends StatelessWidget with UiUtilMixin {
  const _CreateTeamTile({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
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
        padding: uiUtil.edgeInsets.horizontalSymmetric25,
        decoration: BoxDecoration(
          color: theme.primaryColor,
          borderRadius: uiUtil.borderRadius.large,
          image: DecorationImage(
            image: CachedNetworkImageProvider(team.photoUrl ?? PLACEHOLDER_IMG),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.05),
              BlendMode.darken,
            ),
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
