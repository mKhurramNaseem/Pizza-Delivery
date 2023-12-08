import 'package:flutter/material.dart';
import 'package:hero_rect_tween/model/drink.dart';
import 'package:hero_rect_tween/widgets/radio_button.dart';

class DrinksRadioForm extends StatelessWidget {
  final DrinkQuantity activeSize;
  final ValueChanged onChanged;
  const DrinksRadioForm({super.key , required this.activeSize , required this.onChanged,});

  static const oneLitre = '1 Litre',
      oneAndHalfLitre = '1.5 Litre',
      twoLitre = '2 Litre';
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RadioButton<DrinkQuantity>(
            value: DrinkQuantity.oneLitre,
            activeSize: activeSize,
            onChanged: onChanged,
            text: oneLitre),
        RadioButton<DrinkQuantity>(
            value: DrinkQuantity.oneAndHalfLitre,
            activeSize: activeSize,
            onChanged: onChanged,
            text: oneAndHalfLitre),
        RadioButton<DrinkQuantity>(
            value: DrinkQuantity.twoLitre,
            activeSize: activeSize,
            onChanged: onChanged,
            text: twoLitre),
      ],
    );
  }
}
