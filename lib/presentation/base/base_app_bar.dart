import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/appStrings.dart';
import '../../providers/ThemeProvider/themeProvider.dart';

AppBar buildAppBar() => AppBar(
      title: Text(AppStrings.appTitle),
      actions: [
        Consumer(
          builder: (context, state, child) {
            final appThemeState = state.watch(appThemeStateNotifier);
            return Switch(
              value: appThemeState.isDarkModeEnabled,
              onChanged: (enabled) {
                if (enabled) {
                  appThemeState.setDarkTheme();
                } else {
                  appThemeState.setLightTheme();
                }
              },
            );
          },
        )
      ],
    );
