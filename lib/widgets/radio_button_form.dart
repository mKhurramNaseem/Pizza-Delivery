import 'package:flutter/material.dart';
import 'package:hero_rect_tween/model/pizza.dart';
import 'package:hero_rect_tween/widgets/radio_button.dart';

class RadioButtonForm extends StatelessWidget {
  final ValueChanged onChanged;
  final PizzaSize activeSize;
  const RadioButtonForm({
    super.key,
    required this.activeSize,
    required this.onChanged,
  });

  static const smallText = 'Small',
      mediumText = 'Medium',
      largeText = 'Large',
      extraLargeText = 'Extra Large';
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RadioButton<PizzaSize>(
            value: PizzaSize.small,
            activeSize: activeSize,
            onChanged: onChanged,
            text: smallText),
        RadioButton<PizzaSize>(
            value: PizzaSize.medium,
            activeSize: activeSize,
            onChanged: onChanged,
            text: mediumText),
        RadioButton<PizzaSize>(
            value: PizzaSize.large,
            activeSize: activeSize,
            onChanged: onChanged,
            text: largeText),
        RadioButton<PizzaSize>(
            value: PizzaSize.extraLarge,
            activeSize: activeSize,
            onChanged: onChanged,
            text: extraLargeText),
      ],
    );
  }
}
