import 'package:flutter/material.dart';
import 'package:hero_rect_tween/extensions/modification.dart';
import 'package:hero_rect_tween/widgets/input_fields.dart';
import 'package:hero_rect_tween/widgets/register_input_form.dart';

class LoginInputForm extends StatelessWidget {

  // Static Constants
  static const emailHint = 'Email';
  static const passwordHint = 'Password';
  static const emailError = 'Not an Email';
  static const invalidLength = 'Invalid Length';

  // Controller and Key
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> globalKey;

  const LoginInputForm({
    super.key,
    required this.globalKey,
    required this.emailController,
    required this.passwordController,
  });
  
  // Email Validator
  String? _emailValidator(String? value) {
    if (value.isEmail()) {
      return null;
    }
    return emailError;
  }

  // Password Validator
  String? _passwordValidator(String? value) {
    if (passwordController.text.length > RegisterInputForm.maxCount) {
      return invalidLength;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: globalKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InputField(
            globalKey: GlobalKeys.loginEmailKey,
            textEditingController: emailController,
            validator: _emailValidator,
            hint: emailHint,
            textInputType: TextInputType.emailAddress,
            hasCounter: false,
          ),
          InputField(
            globalKey: GlobalKeys.loginPasswordKey,
            textEditingController: passwordController,
            validator: _passwordValidator,
            hint: passwordHint,
            textInputType: TextInputType.visiblePassword,
            hasCounter: true,
            currentCount: passwordController.text.length,
            totalCount: RegisterInputForm.maxCount,
          ),
        ],
      ),
    );
  }
}
