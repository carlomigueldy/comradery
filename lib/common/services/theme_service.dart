import 'package:comradery/common/constants/colors.dart';
import 'package:comradery/common/utils/ui_util.dart';
import 'package:comradery/app.locator.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:observable_ish/observable_ish.dart';
import 'package:stacked/stacked.dart';

import 'local_storage_service.dart';

const THEME_PREFERENCE_KEY = 'preferences.theme';
const DARK_VALUE = 'dark';
const LIGHT_VALUE = 'light';
const SYSTEM_VALUE = 'system';

class ThemeService with ReactiveServiceMixin, UiUtilMixin {
  final log = Logger();
  final _localStorage = locator<LocalStorageService>();

  RxValue<ThemeMode> _themeMode = RxValue(ThemeMode.light);
  ThemeMode get themeMode => _themeMode.value;

  ThemeController() {
    listenToReactiveValues([_themeMode]);
  }

  Future<void> init() async {
    final preference = await _localStorage.getItem(THEME_PREFERENCE_KEY);

    if (preference == DARK_VALUE) {
      _setDarkMode();
    }

    if (preference == LIGHT_VALUE) {
      _setLightMode();
    }
  }

  ThemeData light() => ThemeData(
        brightness: Brightness.light,
        primaryColor: kcPrimary,
        scaffoldBackgroundColor: uiUtil.colors.white,
        fontFamily: fontFamily,
        cardTheme: _cardTheme.copyWith(
          color: uiUtil.colors.veryLightGrey,
        ),
        pageTransitionsTheme: PageTransitionsTheme(builders: {
          TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
        }),
      );

  ThemeData dark() => ThemeData(
        brightness: Brightness.dark,
        primaryColor: kcPrimary,
        fontFamily: fontFamily,
        cardTheme: _cardTheme.copyWith(
          color: Colors.grey[900],
        ),
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: AppBarTheme(
          backgroundColor: uiUtil.colors.darkGrey,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: uiUtil.colors.darkGrey,
        ),
        pageTransitionsTheme: PageTransitionsTheme(builders: {
          TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
          // TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
        }),
      );

  String get fontFamily => 'Sora';

  CardTheme get _cardTheme => CardTheme(
        margin: const EdgeInsets.all(0),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: uiUtil.borderRadius.large,
        ),
      );

  Future<void> toggleTheme() async {
    if (themeMode == ThemeMode.light) {
      _setDarkMode();
      await _localStorage.setItem(THEME_PREFERENCE_KEY, DARK_VALUE);

      return;
    }

    _setLightMode();
    await _localStorage.setItem(THEME_PREFERENCE_KEY, LIGHT_VALUE);
  }

  void _setDarkMode() {
    _themeMode.value = ThemeMode.dark;
    notifyListeners();
  }

  void _setLightMode() {
    _themeMode.value = ThemeMode.light;
    notifyListeners();
  }
}
