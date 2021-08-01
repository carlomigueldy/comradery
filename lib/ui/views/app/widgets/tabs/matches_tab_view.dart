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
          GridView.count(
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

              return InkWell(
                onTap: () => onTap?.call(matching),
                child: GridTile(
                  child: Container(
                    decoration: BoxDecoration(
                      color: theme.canvasColor,
                      borderRadius: uiUtil.borderRadius.large,
                      image: DecorationImage(
                        image: NetworkImage(PLACEHOLDER_IMG),
                        fit: BoxFit.cover,
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
                                  style:
                                      uiUtil.textStyles.bodySmallBold.copyWith(
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
            }),
          ),
          uiUtil.verticalSpacing.huge,
        ],
      ),
    );
  }
}
