import 'package:flutter/material.dart';

class ImageButtonWidget extends StatelessWidget {
  const ImageButtonWidget(
      {super.key,
      this.size = const Size(50, 50),
      required this.image,
      required this.onPressed});

  final Image image;
  final Function() onPressed;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width,
      height: size.height,
      child: IconButton(onPressed: onPressed, icon: image),
    );
  }
}
