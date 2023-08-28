import 'package:flutter/material.dart';

class ContentCardWidget extends StatelessWidget {
  const ContentCardWidget(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.imageUrl,
      this.onClicked,
      this.cardSize = const Size(151, 218)})
      : super(key: key);

  final String title;
  final String subtitle;
  final String imageUrl;
  final Function? onClicked;

  final Size cardSize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onClicked != null) {
          onClicked!();
        }
      },
      child: SizedBox(
        width: cardSize.width,
        height: cardSize.height,
        child: Stack(
          children: [
            _backgroundImage(),
            _titleText(),
            _subtitleText(),
          ],
        ),
      ),
    );
  }

  Widget _backgroundImage() {
    return Positioned(
      left: 0,
      top: 0,
      child: Container(
        width: cardSize.width,
        height: cardSize.height,
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
      top: cardSize.height * 0.8,
      child: SizedBox(
        width: cardSize.width - 11,
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
      top: cardSize.height * 0.8 + 16,
      child: SizedBox(
        width: cardSize.width - 11,
        height: 13,
        child: Text(
          subtitle,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 8,
            fontFamily: 'Baloo2',
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
