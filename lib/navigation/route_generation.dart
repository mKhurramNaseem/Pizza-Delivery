import 'package:flutter/material.dart';
import 'package:hero_rect_tween/screens/customization_screen.dart';
import 'package:hero_rect_tween/screens/drinks_screen.dart';
import 'package:hero_rect_tween/screens/error_screen.dart';
import 'package:hero_rect_tween/screens/home_screen.dart';
import 'package:hero_rect_tween/screens/login_screen.dart';
import 'package:hero_rect_tween/screens/order_placed_screen.dart';
import 'package:hero_rect_tween/screens/register_screen.dart';

class RouteGeneration {
  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    return switch (routeSettings.name) {
      HomeScreen.screenName => MaterialPageRoute(
          builder: (context) => const HomeScreen(),
          settings: routeSettings,
        ),
      LoginScreen.screenName => MaterialPageRoute(
          builder: (context) => const LoginScreen(),
          settings: routeSettings,
        ),
      RegisterScreen.screenName => MaterialPageRoute(
          builder: (context) => const RegisterScreen(),
          settings: routeSettings,
        ),
      CustomizationScreen.screenName => MaterialPageRoute(
          builder: (context) => const CustomizationScreen(),
          settings: routeSettings,
        ),
      DrinksScreen.screenName => MaterialPageRoute(
          builder: (context) => const DrinksScreen(),
          settings: routeSettings,
        ),
      OrderPlacedScreen.screenName => MaterialPageRoute(
          builder: (context) => const OrderPlacedScreen(),
          settings: routeSettings,
        ),
      _ => MaterialPageRoute(
          builder: (context) => const ErrorScreen(),
          settings: routeSettings,
        ),
    };
  }
}
