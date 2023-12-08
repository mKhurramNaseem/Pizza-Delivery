import 'package:flutter/material.dart';
import 'package:hero_rect_tween/navigation/route_generation.dart';
import 'package:hero_rect_tween/screens/register_screen.dart';
import 'package:hero_rect_tween/theme/app_theme_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const title = 'Hero Animations';
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: AppThemeData.getThemeData(),
      onGenerateRoute: RouteGeneration.onGenerateRoute,
      initialRoute: RegisterScreen.screenName,
    );
  }
}
