import 'package:diabetic/src/control/config.dart';
import 'package:diabetic/src/control/notifier_listener.dart';
import 'package:diabetic/src/control/routers/route_generator.dart';
import 'package:diabetic/src/control/theme/deserializer.dart';
import 'package:diabetic/src/control/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ListenableProvider<NotifyListener>(
        create: (_) => NotifyListener(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: appName,
      themeMode: ThemeMode.system,
      theme: CustomThemes(name: ThemeIdentifier.daylight)
          .currentTheme()
          .copyWith(brightness: Brightness.light),
      darkTheme: CustomThemes(name: ThemeIdentifier.nightfall)
          .currentTheme()
          .copyWith(brightness: Brightness.dark),
      routerConfig: MainRouteGenerator.generateRoute(),
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: child!,
        breakpoints: [
          const Breakpoint(start: 0, end: 450, name: MOBILE),
          const Breakpoint(start: 451, end: 800, name: TABLET),
          const Breakpoint(start: 801, end: 1920, name: DESKTOP),
          const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
        ],
      ),
    );
  }
}
