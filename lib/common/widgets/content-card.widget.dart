import 'package:flutter/material.dart';

class ContentCardWidget extends StatelessWidget {
  const ContentCardWidget(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.imageUrl})
      : super(key: key);

  final String title;
  final String subtitle;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 151,
      height: 220,
      child: Stack(
        children: [
          _backgroundImage(),
          _titleText(),
          _subtitleText(),
        ],
      ),
    );
  }

  Widget _backgroundImage() {
    return Positioned(
      left: 0,
      top: 0,
      child: Container(
        width: 151,
        height: 218,
        decoration: ShapeDecoration(
          image: DecorationImage(
            image: NetworkImage(imageUrl),
            fit: BoxFit.fill,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  Widget _titleText() {
    return Positioned(
      left: 11,
      top: 178,
      child: SizedBox(
        width: 119,
        height: 16,
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontFamily: 'Baloo',
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }

  Widget _subtitleText() {
    return Positioned(
      left: 11,
      top: 196,
      child: SizedBox(
        width: 119,
        height: 13,
        child: Text(
          subtitle,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 8,
            fontFamily: 'Baloo 2',
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
