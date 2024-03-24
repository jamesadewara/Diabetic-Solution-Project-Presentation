import 'package:diabetic/src/views/base.dart';
import 'package:diabetic/src/views/index.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  static const String form = 'form';
  static const String result = 'result';
}

class MainRouteGenerator {
  static GoRouter generateRoute() {
    return GoRouter(initialLocation: "/${AppRoutes.form}", routes: <RouteBase>[
      GoRoute(
          path: "/${AppRoutes.form}",
          name: AppRoutes.form,
          builder: (BuildContext context, GoRouterState state) {
            return BaseApp(
              child: FormScreen(
                state: state,
              ),
            );
          },
          routes: <RouteBase>[
            GoRoute(
              path: "${AppRoutes.result}/:id/:path",
              name: AppRoutes.result,
              builder: (BuildContext context, GoRouterState state) {
                return BaseApp(
                  child: ResultScreen(
                    state: state,
                  ),
                );
              },
            )
          ]),
    ]);
  }
}
