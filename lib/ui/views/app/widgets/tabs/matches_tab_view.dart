import 'package:cached_network_image/cached_network_image.dart';
import 'package:comradery/common/utils/ui_util.dart';
import 'package:comradery/matching/models/matching.dart';
import 'package:comradery/ui/placeholders/placeholder_images.dart';
import 'package:comradery/ui/widgets/dumb_widgets/dumb_widgets.dart';
import 'package:flutter/material.dart';

class MatchesTabView extends StatelessWidget with UiUtilMixin {
  const MatchesTabView({
    Key? key,
    required this.matchings,
    this.onTap,
  }) : super(key: key);

  final List<Matching> matchings;
  final Function(Matching)? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    const itemHeight = 768;
    const itemWidth = 1250 / 2;

    return SingleChildScrollView(
      padding: uiUtil.edgeInsets.horizontalSymmetric25,
      child: Column(
        children: [
          uiUtil.verticalSpacing.large,
          matchings.isNotEmpty
              ? GridView.count(
                  childAspectRatio: (itemWidth / itemHeight),
                  controller: ScrollController(keepScrollOffset: false),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 3,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                  children: List.generate(matchings.length, (index) {
                    final matching = matchings[index];

                    return AppUserMatchingGridTile(
                      onTap: () => onTap?.call(matching),
                      matching: matching,
                    );
                  }),
                )
              : Container(
                  child: Text(
                    'No matchings yet.',
                  ),
                ),
          uiUtil.verticalSpacing.huge,
        ],
      ),
    );
  }
}

class AppUserMatchingGridTile extends StatelessWidget with UiUtilMixin {
  const AppUserMatchingGridTile({
    Key? key,
    this.onTap,
    required this.matching,
  }) : super(key: key);

  final Function()? onTap;
  final Matching matching;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: onTap,
      child: GridTile(
        child: Container(
          decoration: BoxDecoration(
            color: theme.primaryColor,
            borderRadius: uiUtil.borderRadius.large,
            image: DecorationImage(
              image: NetworkImage(
                matching.targetUser?.photoUrl ?? PLACEHOLDER_IMG,
              ),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.05),
                BlendMode.darken,
              ),
            ),
          ),
          child: Padding(
            padding: uiUtil.edgeInsets.horizontalSymmetric10,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Flexible(
                      child: AppText(
                        '${matching.createdByUser?.fullName}',
                        style: uiUtil.textStyles.bodySmallBold.copyWith(
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                uiUtil.verticalSpacing.normal,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
