import 'package:flutter/material.dart';
import 'package:hero_rect_tween/extensions/modification.dart';
import 'package:hero_rect_tween/screens/register_screen.dart';
import 'package:hero_rect_tween/widgets/input_fields.dart';

class RegisterInputForm extends StatelessWidget {
  // Static consts
  static const userNameHint = 'Username',
      emailHint = 'Email',
      passwordHint = 'Password',
      confirmPasswordHint = 'Confirm Password',
      addressHint = 'Address';
  static const maxCount = 8;
  static const unEqualPasswords = 'Passwords don\'t match';
  static const invalidLength = 'Invalid Length';

  // Controllers

  final TextEditingController userNameController,
      emailController,
      passwordController,
      confirmPasswordController;
      final TextEditingController addressController;
  final GlobalKey<FormState> globalKey;

  const RegisterInputForm({
    super.key,
    required this.globalKey,
    required this.userNameController,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.addressController,
  });

  String? _userNameValidator(String? value) {
    if (value?.isEmpty ?? false) {
      return 'UserName Not Found';
    }
    if ((value?.length ?? 0) < 13) {
      return null;
    }
    return 'Username is too large';
  }

   String? _addressValidator(String? value) {
    if (value?.isEmpty ?? false) {
      return 'Required';
    }
    return null;
  }

  String? _emailValidator(String? value) {
    if (value.isEmail()) {
      return null;
    }
    return 'Not A Valid Email';
  }

  String? _passwordValidator(String? v) {
    if (RegisterScreen.isRegisterValidator) {
      return _passwordValidatorRegister(v);
    }
    String value = passwordController.text;
    if (value.length <= maxCount) {
      return null;
    }
    return invalidLength;
  }

  String? _passwordValidatorRegister(String? v) {
    String value = passwordController.text;
    String second = confirmPasswordController.text;
    if (value.length <= maxCount) {
      return isEqual(value, second) ? null : unEqualPasswords;
    } else if (value.length > maxCount) {
      return invalidLength;
    }
    return invalidLength;
  }

  String? _confirmPasswordValidatorRegister(String? v) {
    String value = confirmPasswordController.text;
    String second = passwordController.text;
    if (value.length <= maxCount) {
      return isEqual(value, second) ? null : unEqualPasswords;
    } else if (value.length > maxCount) {
      return invalidLength;
    }
    return invalidLength;
  }

  String? _confirmPasswordValidator(String? v) {
    if (RegisterScreen.isRegisterValidator) {      
      return _confirmPasswordValidatorRegister(v);
    }
    String value = confirmPasswordController.text;
    if (value.length <= maxCount) {
      return null;
    }
    return invalidLength;
  }

  bool isEqual(String value, String second) {
    return value.compareTo(second) == 0;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: globalKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InputField(
            globalKey: GlobalKeys.userNameKey,
            textEditingController: userNameController,
            validator: _userNameValidator,
            hint: userNameHint,
            hasCounter: false,
          ),

          InputField(
            globalKey: GlobalKeys.emailKey,
            textEditingController: emailController,
            validator: _emailValidator,
            hint: emailHint,
            textInputType: TextInputType.emailAddress,
            hasCounter: false,
          ),
           InputField(
            globalKey: GlobalKeys.addressKey,
            textEditingController: addressController,
            validator: _addressValidator,
            hint: addressHint,
            hasCounter: false,            
          ),
         
          InputField(
            globalKey: GlobalKeys.passwordKey,
            textEditingController: passwordController,
            validator: _passwordValidator,                
            hint: passwordHint,
            textInputType: TextInputType.visiblePassword,
            hasCounter: true,
            currentCount: passwordController.text.length,
            totalCount: maxCount,
          ),
          InputField(
            globalKey: GlobalKeys.confirmPasswordKey,
            textEditingController: confirmPasswordController,
            validator: _confirmPasswordValidator,
            hint: confirmPasswordHint,
            textInputType: TextInputType.visiblePassword,
            hasCounter: true,
            currentCount: confirmPasswordController.text.length,
            totalCount: maxCount,
          ),
        ],
      ),
    );
  }
}
