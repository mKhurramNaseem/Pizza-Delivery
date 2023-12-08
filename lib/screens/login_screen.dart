import 'package:flutter/material.dart';
import 'package:hero_rect_tween/model/images.dart';
import 'package:hero_rect_tween/model/user.dart';
import 'package:hero_rect_tween/screens/home_screen.dart';
import 'package:hero_rect_tween/screens/register_screen.dart';
import 'package:hero_rect_tween/widgets/input_fields.dart';
import 'package:hero_rect_tween/widgets/login_input_form.dart';

class LoginScreen extends StatefulWidget {

  // Screen Name For Navigation
  static const screenName = '/loginscreen';

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  // Static Constants for Login Screens
  static const widthPercent = 0.6;
  static const heightPercent = 0.2;
  static const textNotUser = 'Not a User  ';
  static const textRegister = 'Register';
  static const btnLogin = 'Login';
  static const btnCancel = 'Cancel';
  static const fontSizePercent = 0.014;
  static const userNotFound = 'Register Yourself';
  static const imageFlex = 20,
      inputFormFlex = 27,
      buttonRowFlex = 10,
      textFlex = 10,
      bottomSpacer = 15,
      topSpacer = 15,
      midSpacer = 3;

  // Key and Controller to be initialized in initState()
  late TextEditingController emailController, passwordController;
  late GlobalKey<FormState> globalKey;

  // Class Variables
  User user = User();
  bool isUser = false;

  
  @override
  void initState() {
    super.initState();
    // Initializations 
    emailController = TextEditingController();
    passwordController = TextEditingController()
      ..addListener(() {
        // Validating and Updating Screen on every change in TextField
        // Specially For Password Field
        setState(() {
          GlobalKeys.loginPasswordKey.currentState?.validate();
        });
      });
    // Global Key required for validation
    globalKey = GlobalKey();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Data Receiving From Register Screen
    user = ((ModalRoute.of(context)?.settings.arguments) ?? User()) as User;
    // Whether User is empty or not
    isUser = !(user.name.isEmpty || user.email.isEmpty || user.password.isEmpty);    
  }

  @override
  void dispose() {
    // Disposing Controllers to prevent Memory Leak
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }


  void _btnLoginPressed() {
    if (isUser) {
      // TextFields Validation
      bool isValid = globalKey.currentState?.validate() ?? false;
      if (isValid) {
        // Credentials Matching
        if (emailController.text.compareTo(user.email) == 0 &&
            passwordController.text.compareTo(user.password) == 0) {
          // Navigating to next screen 
          Navigator.of(context)
              .pushNamed(HomeScreen.screenName, arguments: user);
        } else {
          // Incase Credentials don't match
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text(userNotFound)));
        }
      }
    } else {
      // Incase User is not received from Register Screen
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text(userNotFound)));
    }
  }

  // Navigate back to Register Screen
  void _onBtnRegisterPressed() {
    Navigator.of(context).pop();
  }

  // Navigate back to Register Screen on Cancel button
  void _btnCancelPressed() {
    Navigator.of(context).pop();
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
              children: [
                const Spacer(
                  flex: topSpacer,
                ),
                Expanded(
                  flex: imageFlex,
                  child: Align(
                    alignment: Alignment.topCenter,
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
                  child: LoginInputForm(
                    globalKey: globalKey,
                    emailController: emailController,
                    passwordController: passwordController,
                  ),
                ),
                Expanded(
                  flex: buttonRowFlex,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: _btnLoginPressed,
                        style: Theme.of(context).elevatedButtonTheme.style,
                        child: const Text(btnLogin),
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
                        textNotUser,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontSize: (width + height) * fontSizePercent),
                      ),
                      GestureDetector(
                        onTap: _onBtnRegisterPressed,
                        child: Text(
                          textRegister,
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
