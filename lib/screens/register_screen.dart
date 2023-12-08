import 'package:flutter/material.dart';
import 'package:hero_rect_tween/model/images.dart';
import 'package:hero_rect_tween/model/user.dart';
import 'package:hero_rect_tween/screens/login_screen.dart';
import 'package:hero_rect_tween/widgets/input_fields.dart';
import 'package:hero_rect_tween/widgets/register_input_form.dart';

class RegisterScreen extends StatefulWidget {
  // Screen name for Navigation
  static const screenName = '/';

  // Tag For Hero Animation
  static const tag = 'Logo';
  static bool isRegisterValidator = false;
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // static consts
  static const widthPercent = 0.6;
  static const heightPercent = 0.2;
  static const textAlreadyUser = 'Already a User  ';
  static const textLogin = 'Login';
  static const btnRegister = 'Register';
  static const btnCancel = 'Cancel';
  static const fontSizePercent = 0.014;

  // Flex
  static const imageFlex = 20,
      inputFormFlex = 55,
      buttonRowFlex = 10,
      textFlex = 3,
      bottomSpacer = 6,
      topSpacer = 3,
      midSpacer = 3;

  // Editing Controllers
  late TextEditingController userNameController,
      emailController,
      passwordController,
      confirmPasswordController,
      addressController;

  // Global Key to get form state
  late GlobalKey<FormState> globalKey;

  @override
  void initState() {
    super.initState();
    // Initializations of Key and Controllers
    globalKey = GlobalKey();
    userNameController = TextEditingController();
    emailController = TextEditingController();
    addressController = TextEditingController();
    passwordController = TextEditingController()
      ..addListener(() {
        // Validating And Updating Password TextField on every change
        setState(() {
          GlobalKeys.passwordKey.currentState?.validate();
        });
      });
    confirmPasswordController = TextEditingController()
      ..addListener(() {
        // Validating And Updating Confirm Password TextField on every change
        setState(() {
          GlobalKeys.confirmPasswordKey.currentState?.validate();
        });
      });
  }

  @override
  void dispose() {
    // Disposing Controllers to prevent Memory Leak
    userNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    addressController.dispose();
    super.dispose();
  }


  void _btnRegisterPressed() {
    // Flag to check whether validation is on Register button or on every change
    RegisterScreen.isRegisterValidator = true;
    // Validation
    bool isValid = globalKey.currentState?.validate() ?? false;
    RegisterScreen.isRegisterValidator = false;
    if (isValid) {
      // Navigate to Login Screen
      Navigator.of(context).pushNamed(LoginScreen.screenName,
          arguments: User(
              name: userNameController.text,
              email: emailController.text,
              password: passwordController.text,
              address: addressController.text));
    }
  }

  void _btnLoginPressed() {
    // Navigate to Login without Data
    Navigator.of(context).pushNamed(LoginScreen.screenName, arguments: User());
  }

  void _btnCancelPressed() {
    // SystemNavigator.pop();
  }

  @override
  Widget build(BuildContext context) {
    final Size(:width, :height) = MediaQuery.sizeOf(context);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            width: width,
            height: height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Spacer(
                  flex: topSpacer,
                ),
                Expanded(
                  flex: imageFlex,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: SizedBox(
                      width: width * widthPercent,
                      height: height * heightPercent,
                      child: const Hero(
                        tag: RegisterScreen.tag,
                        child: CircleAvatar(
                          foregroundImage: AssetImage(
                            Images.logo,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const Spacer(
                  flex: midSpacer,
                ),
                Expanded(
                  flex: inputFormFlex,
                  child: RegisterInputForm(
                    globalKey: globalKey,
                    userNameController: userNameController,
                    emailController: emailController,
                    passwordController: passwordController,
                    confirmPasswordController: confirmPasswordController,
                    addressController: addressController,
                  ),
                ),
                Expanded(
                  flex: buttonRowFlex,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: _btnRegisterPressed,
                        style: Theme.of(context).elevatedButtonTheme.style,
                        child: const Text(btnRegister),
                      ),
                      ElevatedButton(
                        onPressed: _btnCancelPressed,
                        style: Theme.of(context).elevatedButtonTheme.style,
                        child: const Text(btnCancel),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: textFlex,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        textAlreadyUser,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontSize: (width + height) * fontSizePercent),
                      ),
                      GestureDetector(
                        onTap: _btnLoginPressed,
                        child: Text(
                          textLogin,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                decoration: TextDecoration.underline,
                                fontSize: (width + height) * fontSizePercent,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(flex: bottomSpacer),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
