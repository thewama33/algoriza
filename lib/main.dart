import 'package:algoriza/presentation/Home/home_screen.dart';
import 'package:algoriza/providers/HomeProviders/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/AppTheme/appTheme.dart';
import 'core/appRoutes.dart';
import 'core/appStrings.dart';
import 'providers/dummy/themeProvider.dart';
import 'services/local/persistence.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp
  ]);

  AppCache.instance.init().then((value) {
    runApp(ProviderScope(
        child: ScreenUtilInit(
            designSize: const Size(375, 812),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (context, child) {
              return Consumer(
                builder: (context, ref, child) {
                  final appThemeState = ref.watch(appThemeStateNotifier);
                  return MaterialApp(
                      title: AppStrings.appTitle,
                      debugShowCheckedModeBanner: false,
                      theme: AppTheme.lightTheme,
                      darkTheme: appThemeState.isDarkModeEnabled
                          ? ThemeData.dark()
                          : ThemeData.light(),
                      themeMode: appThemeState.isDarkModeEnabled
                          ? ThemeMode.dark
                          : ThemeMode.light,
                      routes: AppRoutes.routes,
                      initialRoute: AlgorizaDemoApp.routeName);
                },
              );
            })));
  });
}

class AlgorizaDemoApp extends StatelessWidget {
  const AlgorizaDemoApp({super.key});
  static const String routeName = "/";

  @override
  Widget build(BuildContext context) {
    return  HomePage();
  }
}
