import 'package:flutter/material.dart';
import 'package:widget_app/config/app_theme.dart';
import 'package:widget_app/config/router/app_router.dart';
import 'package:widget_app/presentations/screens/home/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: AppTheme(selectedColor: 0).getTheme(),
    );
  }
}
