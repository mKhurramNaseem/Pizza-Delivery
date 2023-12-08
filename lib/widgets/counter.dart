import 'package:flutter/material.dart';
import 'package:hero_rect_tween/widgets/counter_button.dart';

class Counter extends StatelessWidget {
  static const btnHeightPercent = 0.05;
  static const counterWidthPercent = 0.45;
  static const borderRadius = 20.0;
  final int count;
  final GestureTapCallback increment, decrement;

  const Counter({
    super.key,
    required this.count,
    required this.increment,
    required this.decrement,
  });

  @override
  Widget build(BuildContext context) {
    final Size(:width, :height) = MediaQuery.sizeOf(context);
    return SizedBox(
      width: width * counterWidthPercent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 30,
            child: InkWell(
              borderRadius: const BorderRadius.all(
                Radius.circular(borderRadius),
              ),
              onTap: increment,
              child: CounterButton(
                height: height * btnHeightPercent,
                icon: const Icon(
                  Icons.add,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 30,
            child: Text(
              count.toString(),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            flex: 30,
            child: InkWell(
              borderRadius: const BorderRadius.all(
                Radius.circular(borderRadius),
              ),
              onTap: decrement,
              child: CounterButton(
                height: height * btnHeightPercent,
                icon: const Icon(
                  Icons.remove,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
