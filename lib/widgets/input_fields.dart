import 'package:flutter/material.dart';

typedef Validation = String? Function(String?);

class InputField extends StatelessWidget {
  // Static consts
  static const widthPercent = 0.7;
  static const fontSizePercent = 0.013;

  // Data Members
  final String hint;
  final TextEditingController textEditingController;
  final TextInputType textInputType;
  final Validation validator;
  final int totalCount, currentCount;
  final bool hasCounter;
  final GlobalKey<FormFieldState> globalKey;

  // Const Constructor
  const InputField({
    super.key,
    required this.globalKey,
    this.hint = '',
    required this.textEditingController,
    required this.validator,
    this.textInputType = TextInputType.text,
    this.totalCount = 0,
    this.currentCount = 0,
    required this.hasCounter,
  });

  @override
  Widget build(BuildContext context) {
    final Size(:width, :height) = MediaQuery.sizeOf(context);
    TextStyle? textStyle = Theme.of(context).textTheme.bodyMedium?.copyWith(
          fontSize: (width + height) * fontSizePercent,
        );
    return SizedBox(
      width: width * widthPercent,
      child: TextFormField(
        key: globalKey,
        controller: textEditingController,
        validator: validator,
        style: textStyle,
        keyboardType: textInputType,
        decoration: InputDecoration(
          counterText: hasCounter ? '$currentCount/$totalCount' : '',
          hintText: hint,
          hintStyle: textStyle,
          helperText: '',
          helperStyle: textStyle,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}

class GlobalKeys {
  static GlobalKey<FormFieldState> loginEmailKey = GlobalKey<FormFieldState>();
  static GlobalKey<FormFieldState> loginPasswordKey =
      GlobalKey<FormFieldState>();
      static GlobalKey<FormFieldState> addressKey = GlobalKey<FormFieldState>();
  static GlobalKey<FormFieldState> userNameKey = GlobalKey<FormFieldState>();
  static GlobalKey<FormFieldState> emailKey = GlobalKey<FormFieldState>();
  static GlobalKey<FormFieldState> passwordKey = GlobalKey<FormFieldState>();
  static GlobalKey<FormFieldState> confirmPasswordKey =
      GlobalKey<FormFieldState>();
}
