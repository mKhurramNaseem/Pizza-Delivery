import 'package:flutter/material.dart';
import 'package:hero_rect_tween/theme/app_color_scheme.dart';

class ImageListTile extends StatelessWidget {
  final String imagePath;
  const ImageListTile({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: CircleAvatar(
        radius: 40,
        backgroundColor: AppColorScheme.primaryColor,
        child: LayoutBuilder(builder: (context, constraints) {
          return SizedBox(
            width: constraints.maxWidth * 0.8,
            height: constraints.maxHeight * 0.8,
            child: Image.asset(
              imagePath,
              fit: BoxFit.contain,
            ),
          );
        }),
      ),
    );
  }
}
