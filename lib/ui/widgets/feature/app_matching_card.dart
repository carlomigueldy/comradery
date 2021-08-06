import 'package:cached_network_image/cached_network_image.dart';
import 'package:comradery/common/utils/ui_util.dart';
import 'package:comradery/ui/placeholders/placeholder_images.dart';
import 'package:comradery/ui/widgets/dumb_widgets/dumb_widgets.dart';
import 'package:comradery/user/models/user.dart';
import 'package:flutter/material.dart';

import 'app_tag.dart';

class AppMatchingCard extends StatelessWidget with UiUtilMixin {
  const AppMatchingCard({
    Key? key,
    required this.user,
    this.onTapNope,
    this.onTapLike,
    this.onTap,
    this.onLongPress,
    this.showActionButtons = true,
  }) : super(key: key);

  final User user;
  final Function()? onTapNope;
  final Function()? onTapLike;
  final Function()? onTap;
  final Function()? onLongPress;
  final bool showActionButtons;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: onTap,
      onLongPress: onLongPress,
      child: Container(
        height: 575,
        width: 400,
        decoration: BoxDecoration(
          color: theme.primaryColor,
          borderRadius: uiUtil.borderRadius.large,
          image: DecorationImage(
            image: CachedNetworkImageProvider(
              user.photoUrl ?? PLACEHOLDER_IMG,
            ),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.05), BlendMode.darken),
          ),
          boxShadow: [
            uiUtil.boxShadows.small,
          ],
        ),
        child: Padding(
          padding: uiUtil.edgeInsets.horizontalSymmetric25,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  AppText(
                    '${user.firstName}',
                    style: uiUtil.textStyles.body.copyWith(
                      color: Colors.white,
                      fontSize: 32,
                    ),
                  ),
                ],
              ),
              uiUtil.verticalSpacing.large,
              Align(
                alignment: Alignment.topLeft,
                child: Wrap(
                  alignment: WrapAlignment.start,
                  crossAxisAlignment: WrapCrossAlignment.start,
                  spacing: 8.0,
                  runSpacing: 4.0,
                  children: user.hasInterests
                      ? user.interests!.getRange(0, 3).map((userInterest) {
                          return AppTag(
                            text: userInterest.interest!.name,
                          );
                        }).toList()
                      : [],
                ),
              ),
              uiUtil.verticalSpacing.large,
              Row(
                children: [
                  Flexible(
                    child: AppText(
                      user.bio ?? 'No bio.',
                      style: uiUtil.textStyles.body.copyWith(
                        color: Colors.white,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              uiUtil.verticalSpacing.veryLarge,
              if (showActionButtons)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: onTapNope,
                      child: CircleAvatar(
                        child: Icon(
                          Icons.close,
                          color: theme.canvasColor,
                        ),
                        radius: 32,
                        backgroundColor: theme.primaryColor,
                      ),
                    ),
                    InkWell(
                      onTap: onTapLike,
                      child: CircleAvatar(
                        child: Icon(
                          Icons.thumb_up_sharp,
                          color: theme.canvasColor,
                        ),
                        radius: 32,
                        backgroundColor: theme.primaryColor,
                      ),
                    ),
                  ],
                ),
              uiUtil.verticalSpacing.large,
            ],
          ),
        ),
      ),
    );
  }
}
