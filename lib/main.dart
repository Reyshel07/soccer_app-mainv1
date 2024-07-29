import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soccer_app/config/go_router.dart';
import 'package:soccer_app/presentation/providers/fixture/fixture_provider.dart';
import 'package:soccer_app/presentation/providers/ligues/ligues_provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => LiguesProvider(),
        ),
        ChangeNotifierProvider(
          create:(_) => FixtureProvider(), 
        ),
      ],
      
      child: MaterialApp.router(
        title: 'Material App',
        routerConfig: AppRouter.appRouter,
        theme: ThemeData(),
      ),
    );
  }
}
