import 'package:flutter/material.dart';
import 'package:hero_rect_tween/model/drink.dart';
import 'package:hero_rect_tween/model/images.dart';
import 'package:hero_rect_tween/model/order.dart';
import 'package:hero_rect_tween/screens/order_placed_screen.dart';
import 'package:hero_rect_tween/widgets/counter.dart';
import 'package:hero_rect_tween/widgets/drinks_radio_form.dart';
import 'package:hero_rect_tween/widgets/image_list_tile.dart';

class DrinksScreen extends StatefulWidget {
  // Screen Name For Navigation
  static const screenName = '/drinksscreen';

  // Tag For Hero Animation
  static const tag = 'Drink';
  const DrinksScreen({super.key});

  @override
  State<DrinksScreen> createState() => _DrinksScreenState();
}

class _DrinksScreenState extends State<DrinksScreen> {

  // Class Variables
  var btnPlaceOrder = 'Place Order';
  int count = 1;
  Order order = Order(drinkList: [], pizzaList: []);
  DrinkQuantity activeSize = DrinkQuantity.oneLitre;
  String bottleImagePath = Images.bottleDew;
  var amount = 0.0;
  Drink drink = Drink(priceMap: drinksPriceMap);

  // Static constants
  static const pizzaImageFlex = 70, listFlex = 10, btnFlex = 6;
  static const bottleImageFlex = 50, radioFormFlex = 30, counterFlex = 10;
  static const pizzaImageHeightPercent = 0.7;
  static const btnPlaceOrderWidthPercent = 0.8;
  static const sizedBoxWidthPercent = 0.5;

  void _btnPlaceOrder() {
    order.drinkList = [
      for (int i = 0; i < count; i++) drink..drinkQuantity = activeSize
    ];
    Navigator.of(context)
        .pushNamed(OrderPlacedScreen.screenName, arguments: order);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    order = ((ModalRoute.of(context)?.settings.arguments) ??
        Order(drinkList: [], pizzaList: [])) as Order;
    amount = order.getOrderAmount();
    btnPlaceOrder = 'Place Order   ${_getCurrentAmount()}/-';
  }

  void _increment() {
    setState(() {
      count++;
      _updateOrder();
    });
  }

  void _decrement() {
    setState(() {
      if (count > 1) {
        count--;
        _updateOrder();
      }
    });
  }

  double _getCurrentAmount() {
    return amount + drinksPriceMap[activeSize]! * count;
  }

  void _onChanged(value) {
    setState(() {
      activeSize = value as DrinkQuantity;
      _updateOrder();
    });
  }

  void _updateOrder() {
    btnPlaceOrder = 'Place Order   ${_getCurrentAmount()}/-';
  }

  void _onDrinkTilePressed(int index) {
    setState(() {
      bottleImagePath = drinksList[index].imagePath;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size(:width, :height) = MediaQuery.sizeOf(context);
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: width,
          height: height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: pizzaImageFlex,
                child: Row(
                  children: [
                    Stack(
                      children: [
                        Positioned(
                          child: SizedBox(
                            width: width * sizedBoxWidthPercent,
                            height: height,
                          ),
                        ),
                        Positioned(
                          left: -width,
                          child: SizedBox(
                            height: height * pizzaImageHeightPercent,
                            child: Hero(
                              tag: order.pizzaList[0].name,
                              child: Image.asset(
                                order.pizzaList[0].imagePath,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: width * sizedBoxWidthPercent,
                      child: Column(
                        children: [
                          const Spacer(
                            flex: 5,
                          ),
                          Expanded(
                            flex: bottleImageFlex,
                            child: AnimatedSwitcher(
                              duration: const Duration(
                                milliseconds: 500,
                              ),
                              child: Image.asset(
                                bottleImagePath,
                                key: ValueKey(bottleImagePath),
                              ),
                              transitionBuilder: (child, animation) =>
                                  ScaleTransition(
                                scale: animation,
                                child: child,
                              ),
                            ),
                          ),
                          const Spacer(
                            flex: 5,
                          ),
                          Expanded(
                            flex: radioFormFlex,
                            child: DrinksRadioForm(
                              activeSize: activeSize,
                              onChanged: _onChanged,
                            ),
                          ),
                          Expanded(
                            flex: counterFlex,
                            child: Counter(
                              count: count,
                              increment: _increment,
                              decrement: _decrement,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(
                flex: 5,
              ),
              Expanded(
                flex: listFlex,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: drinksList.length,
                  itemBuilder: (context, index) => InkWell(
                    borderRadius: BorderRadius.circular(200),
                    onTap: () => _onDrinkTilePressed(index),
                    child: ImageListTile(
                      imagePath: drinksList[index].imagePath,
                    ),
                  ),
                ),
              ),
              const Spacer(
                flex: 5,
              ),
              Expanded(
                flex: btnFlex,
                child: SizedBox(
                  width: width * btnPlaceOrderWidthPercent,
                  child: Hero(
                    tag: DrinksScreen.tag,
                    child: ElevatedButton(
                      onPressed: _btnPlaceOrder,
                      child: Text(
                        btnPlaceOrder,
                      ),
                    ),
                  ),
                ),
              ),
              const Spacer(
                flex: 4,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
