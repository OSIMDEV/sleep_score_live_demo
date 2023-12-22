import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sleep_score_live_demo/pages/chart_page.dart';
import 'package:sleep_score_live_demo/pages/home_page.dart';

final GoRouter _router = GoRouter(routes: [
  $homeRoute,
  $chartRoute,
]);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SleepScoreLiveDemo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MaterialApp.router(
        routerConfig: _router,
      ),
    );
  }
}
