part of 'route_import_part.dart';

class RouteConfig {
  GoRouter goRouter = GoRouter(
    initialLocation: RouteName.loginScreen,
    routes: [
      GoRoute(
        name: RouteName.loginScreen,
        path: RouteName.loginScreen,
        pageBuilder: (context, state) {
          return const MaterialPage(child: LoginScreen());
        },
      ),
    ],
  );
}
