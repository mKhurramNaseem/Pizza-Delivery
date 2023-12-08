import 'package:hero_rect_tween/model/images.dart';

enum DrinkType { can, bottle }

enum DrinkQuantity { oneLitre, oneAndHalfLitre, twoLitre }

class Drink {
  String name;
  Map<DrinkQuantity, double> priceMap;
  String imagePath;
  DrinkType drinkType;
  DrinkQuantity drinkQuantity;

  Drink({
    this.name = '',
    required this.priceMap,
    this.imagePath = '',
    this.drinkType = DrinkType.bottle,
    this.drinkQuantity = DrinkQuantity.oneLitre,
  });
}

List<Drink> drinksList = [
  Drink(
    name: 'Coke',
    imagePath: Images.bottleCoke,
    drinkType: DrinkType.bottle,
    priceMap: drinksPriceMap,
  ),
  Drink(
    name: 'Coke',
    imagePath: Images.canCoke,
    drinkType: DrinkType.can,
    priceMap: drinksPriceMap,
  ),
  Drink(
    name: 'Dew',
    imagePath: Images.bottleDew,
    drinkType: DrinkType.bottle,
    priceMap: drinksPriceMap,
  ),
  Drink(
    name: 'Dew',
    imagePath: Images.canDew,
    drinkType: DrinkType.can,
    priceMap: drinksPriceMap,
  ),
  Drink(
    name: 'Fanta',
    imagePath: Images.bottleFanta,
    drinkType: DrinkType.bottle,
    priceMap: drinksPriceMap,
  ),
  Drink(
    name: 'Fanta',
    imagePath: Images.canFanta,
    drinkType: DrinkType.can,
    priceMap: drinksPriceMap,
  ),
  Drink(
    name: 'Pepsi',
    imagePath: Images.bottlePepsi,
    drinkType: DrinkType.bottle,
    priceMap: drinksPriceMap,
  ),
  Drink(
    name: 'Pepsi',
    imagePath: Images.canPepsi,
    drinkType: DrinkType.can,
    priceMap: drinksPriceMap,
  ),
  Drink(
    name: 'Sprite',
    imagePath: Images.bottleSprite,
    drinkType: DrinkType.bottle,
    priceMap: drinksPriceMap,
  ),
  Drink(
    name: 'Sprite',
    imagePath: Images.canSprite,
    drinkType: DrinkType.can,
    priceMap: drinksPriceMap,
  ),
];

Map<DrinkQuantity, double> drinksPriceMap = {
  DrinkQuantity.oneLitre: 100.0,
  DrinkQuantity.oneAndHalfLitre: 150.0,
  DrinkQuantity.twoLitre: 200.0,
};
