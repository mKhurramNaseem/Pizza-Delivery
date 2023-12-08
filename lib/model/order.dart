import 'package:hero_rect_tween/model/drink.dart';
import 'package:hero_rect_tween/model/pizza.dart';

class Order {
  List<Pizza> pizzaList;
  List<Drink> drinkList;

  Order({required this.drinkList, required this.pizzaList});

  double getOrderAmount() {
    double totalPizzaAmount = 0.0, totalDrinkAmount = 0.0;
    if (pizzaList.isNotEmpty) {
      totalPizzaAmount = pizzaList.fold(0.0,
          (previousValue, element) => previousValue + element.priceMap[pizzaList[0].pizzaSize]! + element.toppingPrice);
    }
    if (drinkList.isNotEmpty) {
      totalDrinkAmount = drinkList.fold(0,
          (previousValue, element) => previousValue + element.priceMap[drinkList[0].drinkQuantity]!);
    }
    return totalDrinkAmount + totalPizzaAmount;
  }
}
