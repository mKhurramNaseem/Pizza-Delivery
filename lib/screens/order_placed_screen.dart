import 'package:flutter/material.dart';
import 'package:hero_rect_tween/model/images.dart';
import 'package:hero_rect_tween/model/order.dart';
import 'package:hero_rect_tween/screens/drinks_screen.dart';
import 'package:hero_rect_tween/theme/app_color_scheme.dart';

class OrderPlacedScreen extends StatefulWidget {
  // Order Placed Screen For Navigation
  static const screenName = '/orderplacedscreen';

  const OrderPlacedScreen({super.key});

  @override
  State<OrderPlacedScreen> createState() => _OrderPlacedScreenState();
}

class _OrderPlacedScreenState extends State<OrderPlacedScreen> {
  Order order = Order(drinkList: [], pizzaList: []);
  // Flexes
  static const logoFlex = 40 , textFlex = 30;
  static const containerWidthPercent = 0.55 , radiusPercent = 0.25;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Data Receiving from Drinks Screen
    order = ((ModalRoute.of(context)?.settings.arguments) ??
        Order(drinkList: [], pizzaList: [])) as Order;
  }

  @override
  Widget build(BuildContext context) {
    final Size(:width, :height) = MediaQuery.sizeOf(context);
    return SafeArea(
      child: Scaffold(
        body: Hero(
          tag: DrinksScreen.tag,
          child: Container(
            color: AppColorScheme.primaryColor,
            width: width,
            height: height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  flex: logoFlex,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: width * containerWidthPercent,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                      ),
                      CircleAvatar(
                        backgroundImage: const AssetImage(Images.logo),
                        radius: width * radiusPercent,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: textFlex,
                  child: Center(
                    child: Text(
                      'Your Order has been\n successfully placed',
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(color: AppColorScheme.tertiaryColor),
                    ),
                  ),
                ),
                Expanded(
                  flex: textFlex,
                  child: Text(
                    'PizzaBus is Ready to Deliver your order valued : ${order.getOrderAmount()}/-',
                    maxLines: 3,
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(color: AppColorScheme.tertiaryColor),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
