import 'package:comradery/common/utils/ui_util.dart';
import 'package:comradery/ui/views/home/home_viewmodel.dart';
import 'package:comradery/ui/widgets/dumb_widgets/button/app_button.dart';
import 'package:comradery/ui/widgets/dumb_widgets/dumb_widgets.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class HomeViewLeftDrawer extends ViewModelWidget<HomeViewModel>
    with UiUtilMixin {
  const HomeViewLeftDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(
    BuildContext context,
    HomeViewModel model,
  ) {
    return Container(
      height: double.infinity,
      width: 325,
      decoration: BoxDecoration(
        color: Colors.grey[100],
      ),
      child: SingleChildScrollView(
        padding: uiUtil.edgeInsets.horizontalSymmetric25,
        child: Column(
          children: [
            uiUtil.verticalSpacing.large,
            ListTile(
              leading: CircleAvatar(),
              title: AppText.body('Carlo Miguel Dy'),
              subtitle: AppText.bodySmall(
                'carlomigueldy@gmail.com',
                style: uiUtil.textStyles.bodySmall.copyWith(
                  fontSize: 12,
                ),
              ),
              contentPadding: const EdgeInsets.all(0),
              trailing: PopupMenuButton(
                padding: uiUtil.edgeInsets.horizontalSymmetric25,
                shape: RoundedRectangleBorder(
                  borderRadius: uiUtil.borderRadius.large,
                ),
                child: Icon(Icons.more_horiz_rounded),
                onSelected: (value) {
                  if (value == 'logout') return model.logout();
                },
                itemBuilder: (BuildContext context) {
                  return [
                    PopupMenuItem(
                      child: AppText('Settings'),
                      value: 'settings',
                    ),
                    PopupMenuItem(
                      child: AppText('Logout'),
                      value: 'logout',
                    ),
                  ];
                },
              ),
            ),
            uiUtil.verticalSpacing.large,
            AppButton(
              label: 'Logout',
              onPressed: () => model.logout(),
            ),
          ],
        ),
      ),
    );
  }
}
