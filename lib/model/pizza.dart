import 'package:hero_rect_tween/model/images.dart';
import 'package:hero_rect_tween/model/topping.dart';

enum PizzaSize { small, medium, large, extraLarge }

class Pizza {
  String name;
  Map<PizzaSize, double> priceMap;
  PizzaSize pizzaSize;
  Toppings topping;
  double toppingPrice;
  String imagePath;

  Pizza({
    this.name = '',
    required this.priceMap,
    this.pizzaSize = PizzaSize.medium,
    this.topping = Toppings.olives,
    this.imagePath = Images.bbqChicken,
    this.toppingPrice = 0.0,
  });
}

Map<PizzaSize, double> priceMap = {
  PizzaSize.small: 800.0,
  PizzaSize.medium: 1000.0,
  PizzaSize.large: 1500.0,
  PizzaSize.extraLarge: 2000.0,
};

List<Pizza> pizzaList = [
  Pizza(name: 'Cheese Pizza', imagePath: Images.cheese, priceMap: priceMap),
  Pizza(
    name: 'Veggie Pizza',
    imagePath: Images.veggie,
    priceMap: priceMap,
  ),
  Pizza(
    name: 'Pepperoni Pizza',
    imagePath: Images.pepperoni,
    priceMap: priceMap,
  ),
  Pizza(
    name: 'Meat Pizza',
    imagePath: Images.meat,
    priceMap: priceMap,
  ),
  Pizza(
    name: 'Margherita Pizza',
    imagePath: Images.margherita,
    priceMap: priceMap,
  ),
  Pizza(
    name: 'BBQ Chicken Pizza',
    imagePath: Images.bbqChicken,
    priceMap: priceMap,
  ),
  Pizza(
    name: 'Hawaiian Pizza',
    imagePath: Images.hawaiian,
    priceMap: priceMap,
  ),
  Pizza(
    name: 'Buffalo Pizza',
    imagePath: Images.buffalo,
    priceMap: priceMap,
  ),
  Pizza(
    name: 'Supreme Pizza',
    imagePath: Images.supreme,
    priceMap: priceMap,
  ),
  Pizza(
    name: 'The Works Pizza',
    imagePath: Images.theWorks,
    priceMap: priceMap,
  ),
  Pizza(
    name: 'Fajita Pizza',
    imagePath: Images.fajita,
    priceMap: priceMap,
  ),
  Pizza(
    name: 'Pan Pizza',
    imagePath: Images.pan,
    priceMap: priceMap,
  ),
  Pizza(
    name: 'Thin Crust Pizza',
    imagePath: Images.thinCrust,
    priceMap: priceMap,
  ),
  Pizza(
    name: 'Chicken Tikka Pizza',
    imagePath: Images.chickenTikka,
    priceMap: priceMap,
  ),
  Pizza(
    name: 'Pizza Master',
    imagePath: Images.pizzaMaster,
    priceMap: priceMap,
  ),
  Pizza(
    name: 'Fried Chicken Pizza',
    imagePath: Images.friedChicken,
    priceMap: priceMap,
  ),
  Pizza(
    name: 'California Pizza',
    imagePath: Images.california,
    priceMap: priceMap,
  ),
  Pizza(
    name: 'Chicken Supreme Pizza',
    imagePath: Images.chickenSupreme,
    priceMap: priceMap,
  ),
  Pizza(
    name: 'Tomato Mint Leave Pizza',
    imagePath: Images.tomatoMintLeave,
    priceMap: priceMap,
  ),
  Pizza(
    name: 'Peri Peri Pizza',
    imagePath: Images.periPeri,
    priceMap: priceMap,
  ),
];
