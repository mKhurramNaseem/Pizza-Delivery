import 'package:flutter/material.dart';
import 'package:hero_rect_tween/model/pizza.dart';
import 'package:hero_rect_tween/screens/customization_screen.dart';

class PizzaCard extends StatelessWidget {
  final Pizza pizza;
  static const textFlex = 20, imageFlex = 70, spacer = 10;
  const PizzaCard({
    super.key,
    required this.pizza,
  });

  void _onTap(BuildContext context) {
    Navigator.of(context).pushNamed(CustomizationScreen.screenName , arguments: pizza);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _onTap(context),
      child: Card(
        child: Column(
          children: [
            Expanded(
              flex: textFlex,
              child: Text(
                pizza.name,
              ),
            ),
            Expanded(
              flex: imageFlex,
              child: Hero(tag: pizza.name,child: Image.asset(pizza.imagePath)),
            ),
            const Spacer(
              flex: spacer,
            ),
          ],
        ),
      ),
    );
  }
}
