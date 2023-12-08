import 'package:flutter/material.dart';

class RadioButton<T> extends StatelessWidget {
  final T activeSize;
  final ValueChanged onChanged;
  final T value;
  final String text;

  const RadioButton({
    super.key,
    required this.activeSize,
    required this.onChanged,
    required this.text,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio<T>(
          value: value,
          groupValue: activeSize,
          onChanged: onChanged,
        ),
        Text(text),
      ],
    );
  }
}
