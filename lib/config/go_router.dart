import 'package:go_router/go_router.dart';
import 'package:soccer_app/presentation/screens/home/fixture_lineups.dart';
import 'package:soccer_app/presentation/screens/home/statistics.dart';
import 'package:soccer_app/presentation/screens/screens.dart';

class AppRouter {
  static final appRouter = GoRouter(
    initialLocation: HomeScreen.path,
    routes: [
    GoRoute(
      path: HomeScreen.path,
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: LiguesScreen.path,
      name: LiguesScreen.name,
      builder: (context, state) => const LiguesScreen(),
    ),
    GoRoute(
      path: FixtureLineups.path,
      name:  FixtureLineups.name,
      builder: (context, state) => FixtureLineups(),
    ),
    GoRoute(
      path: StatisticsScreen.path,
      name: StatisticsScreen.name,
      builder: (context, state) => StatisticsScreen(),
    ),
  ]);
}
