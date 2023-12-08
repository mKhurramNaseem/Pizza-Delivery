import 'package:flutter/material.dart';
import 'package:hero_rect_tween/theme/app_color_scheme.dart';

class CounterButton extends StatelessWidget {
  final double height;
  final Icon icon;
  static const borderRadius = 20.0;
  const CounterButton({
    super.key,
    required this.height,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(borderRadius),
        ),
        border: Border.all(
          color: AppColorScheme.primaryColor,
        ),
      ),
      child: icon,
    );
  }
}
