import 'package:comradery/common/utils/ui_util.dart';
import 'package:comradery/ui/placeholders/placeholder_images.dart';
import 'package:comradery/ui/widgets/dumb_widgets/dumb_widgets.dart';
import 'package:flutter/material.dart';

class MessagesTabView extends StatelessWidget with UiUtilMixin {
  const MessagesTabView({
    Key? key,
    this.onTap,
    this.onLongPress,
  }) : super(key: key);

  final Function(int)? onTap;
  final Function(int)? onLongPress;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SingleChildScrollView(
      child: Column(
        children: [
          uiUtil.verticalSpacing.large,
          ListView.separated(
            shrinkWrap: true,
            itemCount: 25,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return _ConversationListTile(
                onTap: () => onTap?.call(index),
                onLongPress: () => onLongPress?.call(index),
              );
            },
            separatorBuilder: (context, index) {
              return uiUtil.verticalSpacing.large;
            },
          ),
          uiUtil.verticalSpacing.huge,
        ],
      ),
    );
  }
}

class _ConversationListTile extends StatefulWidget {
  const _ConversationListTile({
    Key? key,
    this.onTap,
    this.onLongPress,
  }) : super(key: key);

  final Function()? onTap;
  final Function()? onLongPress;

  @override
  _ConversationListTileState createState() => _ConversationListTileState();
}

class _ConversationListTileState extends State<_ConversationListTile>
    with UiUtilMixin {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: widget.onTap,
      onLongPress: widget.onLongPress,
      child: Container(
        padding: uiUtil.edgeInsets.horizontalSymmetric25,
        decoration: BoxDecoration(
          // color: Colors.white,
          borderRadius: uiUtil.borderRadius.large,
        ),
        child: Row(
          children: [
            uiUtil.horizontalSpacing.normal,
            CircleAvatar(
              backgroundColor: theme.primaryColor,
              backgroundImage: NetworkImage(COMRADE_DOGE_IMG),
              radius: 24,
            ),
            uiUtil.horizontalSpacing.large,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText.body('User'),
                  Row(
                    children: [
                      Flexible(
                        child: AppText.bodySmall(
                          'textdasdaseqwnjenqwlkeqwnlekqwnlewq',
                          style: uiUtil.textStyles.bodySmall.copyWith(
                            color: uiUtil.colors.mediumGray,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
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
  }
}
