import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:institute_the_best/constants/app_theme.dart';
import 'package:institute_the_best/routing/app_router.dart';

void main() {
  // Ensure GoRouter URL strategy is set for web (removes #)
  GoRouter.optionURLReflectsImperativeAPIs = true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'The Best Classes Institute', // Change to your institute name
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router, // Use the router configuration
    );
  }
}
