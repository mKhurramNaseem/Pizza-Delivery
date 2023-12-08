import 'package:flutter/material.dart';
import 'package:hero_rect_tween/model/pizza.dart';
import 'package:hero_rect_tween/model/user.dart';
import 'package:hero_rect_tween/widgets/heading.dart';
import 'package:hero_rect_tween/widgets/pizza_card.dart';

class HomeScreen extends StatefulWidget {
  // Screen Name for Navigation
  static const screenName = '/homescreen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const headingFlex = 20, listFlex = 80;
  User user = User();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Data Receiving from Previous Screen
    user = ((ModalRoute.of(context)?.settings.arguments) ?? User()) as User;
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
                flex: headingFlex,
                child: Heading(user: user,),
              ),
              Expanded(
                flex: listFlex,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemCount: pizzaList.length,
                  itemBuilder: (context, index) => PizzaCard(
                    pizza: pizzaList[index],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
