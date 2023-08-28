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
          children: [_backgroundImage(), _info()],
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

  Widget _info() {
    return Positioned(
      left: 11,
      bottom: cardSize.height * 0.05,
      child: SizedBox(
        width: cardSize.width - 22,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _titleText(),
            _subtitleText(),
          ],
        ),
      ),
    );
  }

  Widget _titleText() {
    return Text(
      title,
      style: const TextStyle(
          overflow: TextOverflow.visible,
          color: Colors.white,
          fontFamily: 'Baloo',
          fontSize: 12,
          fontWeight: FontWeight.w700,
          height: 1.05),
      maxLines: 2,
    );
  }

  Widget _subtitleText() {
    return Text(
      subtitle,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 8,
        fontFamily: 'Baloo2',
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
