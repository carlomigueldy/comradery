import 'package:comradery/common/utils/ui_util.dart';
import 'package:comradery/ui/placeholders/placeholder_images.dart';
import 'package:comradery/ui/widgets/dumb_widgets/dumb_widgets.dart';
import 'package:flutter/material.dart';

import 'app_tag.dart';

class AppMatchingCard extends StatelessWidget with UiUtilMixin {
  const AppMatchingCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      height: 575,
      width: 400,
      decoration: BoxDecoration(
        color: theme.canvasColor,
        borderRadius: uiUtil.borderRadius.large,
        image: DecorationImage(
          image: NetworkImage(PLACEHOLDER_IMG),
          fit: BoxFit.cover,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.6),
            blurRadius: 10.0,
            offset: Offset(0, 5),
          )
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
                  'Mary Doe',
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
                children: [
                  AppTag(
                    text: 'Coffee',
                    size: AppTagSize.small,
                  ),
                  AppTag(
                    text: 'Coffee',
                    size: AppTagSize.small,
                  ),
                  AppTag(
                    text: 'Coffee',
                    size: AppTagSize.small,
                  ),
                ],
              ),
            ),
            uiUtil.verticalSpacing.large,
            Row(
              children: [
                AppText(
                  'Bio bio bio',
                  style: uiUtil.textStyles.body.copyWith(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            uiUtil.verticalSpacing.veryLarge,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircleAvatar(
                  child: Icon(Icons.close),
                  radius: 32,
                ),
                CircleAvatar(
                  child: Icon(Icons.favorite_rounded),
                  radius: 32,
                ),
              ],
            ),
            uiUtil.verticalSpacing.large,
          ],
        ),
      ),
    );
  }
}
