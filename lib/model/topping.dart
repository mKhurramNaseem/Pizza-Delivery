import 'package:hero_rect_tween/model/images.dart';

enum Toppings {
  greenPepper,
  mushroom,
  olives,
  onions,
  pepperoni,
  sausage,
  spinach,
  noTopping
}

class Topping {
  Toppings type;
  String imagePath;
  double price;

  Topping({
    this.type = Toppings.greenPepper,
    this.imagePath = Images.topGreenPepper,
    this.price = 0.0,
  });
}

List<Topping> toppingList = [
  Topping(type: Toppings.greenPepper, imagePath: Images.topGreenPepper , price: 100,),
  Topping(type: Toppings.pepperoni, imagePath: Images.topPepperoni , price: 100,),
  Topping(type: Toppings.mushroom, imagePath: Images.topMushroom , price: 100,),
  Topping(type: Toppings.onions, imagePath: Images.topOnions , price: 100,),
  Topping(type: Toppings.sausage, imagePath: Images.topSausage , price: 100,),
  Topping(type: Toppings.olives, imagePath: Images.topOlives , price: 100,),
  Topping(type: Toppings.spinach, imagePath: Images.topSpinach , price: 100,),
  Topping(type: Toppings.noTopping, imagePath: Images.noTopping , price: 100,),
];
