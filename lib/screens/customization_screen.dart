import 'package:flutter/material.dart';
import 'package:hero_rect_tween/model/images.dart';
import 'package:hero_rect_tween/model/order.dart';
import 'package:hero_rect_tween/model/pizza.dart';
import 'package:hero_rect_tween/model/topping.dart';
import 'package:hero_rect_tween/screens/drinks_screen.dart';
import 'package:hero_rect_tween/widgets/counter.dart';
import 'package:hero_rect_tween/widgets/image_list_tile.dart';
import 'package:hero_rect_tween/widgets/radio_button_form.dart';

class CustomizationScreen extends StatefulWidget {
  static const screenName = '/customizationscreen';
  const CustomizationScreen({super.key});

  @override
  State<CustomizationScreen> createState() => _CustomizationScreenState();
}

class _CustomizationScreenState extends State<CustomizationScreen>
    with SingleTickerProviderStateMixin {
  static const btnAddDrinks = 'Add Drinks';
  static const imageFlex = 45,
      listFlex = 10,
      radioAndCounterFlex = 25,
      btnFlex = 7;
  static const btnWidthPercent = 0.8;
  static const padding = 20.0;
  static const duration = Duration(milliseconds: 500);
  late AnimationController animationController;
  late Animation<double> fadeInAnimation;
  late Animation<Offset> slideAnimation;
  late List<Animation<Offset>> slideAnimations;
  Pizza pizza = Pizza(priceMap: priceMap);
  Offset position = const Offset(0, 0);
  PizzaSize activeSize = PizzaSize.medium;
  int count = 1;
  double opacity = 0;
  double toppingAmount = 0.0;
  String image = Images.topMushroom;
  double price = 0.0;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this, duration: duration)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          setState(() {
            _updateAmount();
          });
        }
      });
    fadeInAnimation =
        Tween<double>(begin: 0, end: 1).animate(animationController);
    slideAnimation = Tween<Offset>(begin: Offset.zero, end: const Offset(5, 3))
        .animate(animationController);
    slideAnimations = [
      Tween<Offset>(begin: const Offset(0, 3), end: const Offset(6, 2))
          .animate(animationController),
      Tween<Offset>(begin: const Offset(0, 0), end: const Offset(10, 1))
          .animate(animationController),
      Tween<Offset>(begin: const Offset(0, 6), end: const Offset(7, 5))
          .animate(animationController),
      Tween<Offset>(begin: const Offset(20, 0), end: const Offset(9, 3))
          .animate(animationController),
      Tween<Offset>(begin: const Offset(20, 4), end: const Offset(13, 3))
          .animate(animationController),
      Tween<Offset>(begin: const Offset(20, 6), end: const Offset(6, 4))
          .animate(animationController),
      Tween<Offset>(begin: const Offset(9, 0), end: const Offset(11, 2))
          .animate(animationController),
      Tween<Offset>(begin: const Offset(10, 6), end: const Offset(10, 5))
          .animate(animationController),
    ];
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    pizza = ((ModalRoute.of(context)?.settings.arguments) ??
        Pizza(priceMap: priceMap)) as Pizza;
    price = pizza.priceMap[activeSize]!;
  }

  void _onAddDrinks() {
    List<Pizza> pizzas = [
      for (int i = 0; i < count; i++) pizza..pizzaSize = activeSize
    ];
    Navigator.of(context).pushNamed(
      DrinksScreen.screenName,
      arguments: Order(
        drinkList: [],
        pizzaList: pizzas,
      ),
    );
  }

  void _increment() {
    setState(() {
      count++;
      _updateAmount();
    });
  }

  void _decrement() {
    setState(() {
      if (count > 1) {
        count--;
        _updateAmount();
      }
    });
  }

  void _updateAmount() {
    setState(() {
      price = count * pizza.priceMap[activeSize]! + pizza.toppingPrice * count;
    });
  }

  void _onChanged(value) {
    setState(() {
      activeSize = value as PizzaSize;
      price = count * pizza.priceMap[activeSize]!;
    });
  }

  void _onToppingTap(int index) {
    setState(() {
      animationController.reset();
      if (index < toppingList.length - 1) {
        position = const Offset(100, 100);
        opacity = 1;
        pizza.toppingPrice = toppingList[index].price;
        image = toppingList[index].imagePath;
        animationController.forward();
      } else {
        setState(() {
          pizza.toppingPrice = 0;
          _updateAmount();
        });
      }
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
            children: [
              Expanded(
                flex: imageFlex,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(padding),
                    child: Stack(
                      children: [
                        SizedBox.expand(
                          child: Hero(
                            tag: pizza.name,
                            child: Image.asset(pizza.imagePath),
                          ),
                        ),
                        for (int i = 0; i < slideAnimations.length; i++)
                          FadeTransition(
                            opacity: fadeInAnimation,
                            child: SlideTransition(
                                position: slideAnimations[i],
                                child: SizedBox(
                                    width: width * 0.05,
                                    height: height * 0.05,
                                    child: Image.asset(image))),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
              const Spacer(
                flex: 5,
              ),
              Expanded(
                flex: listFlex,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: toppingList.length,
                  itemBuilder: (context, index) => InkWell(
                    borderRadius: BorderRadius.circular(100),
                    onTap: () => _onToppingTap(index),
                    child: ImageListTile(
                      imagePath: toppingList[index].imagePath,
                    ),
                  ),
                ),
              ),
              const Spacer(
                flex: 5,
              ),
              Expanded(
                flex: radioAndCounterFlex,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RadioButtonForm(
                        onChanged: _onChanged, activeSize: activeSize),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(),
                        Text(
                          'Rs: $price/-',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        Counter(
                          count: count,
                          increment: _increment,
                          decrement: _decrement,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Spacer(
                flex: 8,
              ),
              Expanded(
                flex: btnFlex,
                child: SizedBox(
                  width: width * btnWidthPercent,
                  child: ElevatedButton(
                    onPressed: _onAddDrinks,
                    child: const Text(
                      btnAddDrinks,
                    ),
                  ),
                ),
              ),
              const Spacer(
                flex: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
