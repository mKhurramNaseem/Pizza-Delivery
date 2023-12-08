import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hero_rect_tween/model/images.dart';
import 'package:hero_rect_tween/model/user.dart';
import 'package:hero_rect_tween/theme/app_color_scheme.dart';
import 'package:image_picker/image_picker.dart';

class Heading extends StatefulWidget {
  final User user;
  static const imageFlex = 40, columnFlex = 60;
  static const heightPercent = 0.15;
  const Heading({
    super.key,
    required this.user,
  });

  @override
  State<Heading> createState() => _HeadingState();
}

class _HeadingState extends State<Heading> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> fadeAnimation;
  late Animation<double> scaleAnimation;
  File? imageFile;
  bool fromGallery = false;

  double opacity = 1;
  static const duration = Duration(milliseconds: 500);
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this, duration: duration);
    fadeAnimation = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0, 0.5),
      ),
    );
    scaleAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.5, 1),
      ),
    );
    // animationController.forward();
  }

  void pickImage() async {
    // ScaffoldMessenger.of(context)
    //     .showSnackBar(const SnackBar(content: Text('Clicked')));
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      imageFile = File(image.path);
      setState(() {
        fromGallery = true;
      });
    } on PlatformException {}
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void _onAddressButtonPressed() {
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    ImageProvider<Object> imageProvider;
    if (fromGallery) {
      imageProvider = FileImage(imageFile!);
    } else {
      imageProvider = const AssetImage(Images.logo);
    }
    return Row(
      children: [
        Expanded(
          flex: Heading.imageFlex,
          child: GestureDetector(
            onTap: () => pickImage(),
            child: Container(
              height: MediaQuery.sizeOf(context).height * Heading.heightPercent,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: CircleAvatar(
                foregroundImage: imageProvider,
              ),
            ),
          ),
        ),
        Expanded(
          flex: Heading.columnFlex,
          child: Column(
            children: [
              const Spacer(flex: 20),
              Expanded(
                flex: 25,
                child: Opacity(
                  opacity: opacity,
                  child: Text(
                    'Hi! ${widget.user.name}',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ),
              const Spacer(flex: 10),
              Expanded(
                  flex: 25,
                  child: Stack(
                    children: [
                      ScaleTransition(
                        scale: scaleAnimation,
                        child: Text(
                          widget.user.address,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                      FadeTransition(
                        opacity: fadeAnimation,
                        child: AddressButton(
                          onAddressButtonPressed: _onAddressButtonPressed,
                        ),
                      ),
                    ],
                  )),
              const Spacer(
                flex: 20,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class AddressButton extends StatelessWidget {
  static const address = 'Address';
  final VoidCallback onAddressButtonPressed;
  const AddressButton({
    super.key,
    required this.onAddressButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
            backgroundColor: const MaterialStatePropertyAll(
              AppColorScheme.tertiaryColor,
            ),
            foregroundColor: const MaterialStatePropertyAll(
              AppColorScheme.primaryColor,
            ),
          ),
      onPressed: onAddressButtonPressed,
      child: const Text('+ $address'),
    );
  }
}
