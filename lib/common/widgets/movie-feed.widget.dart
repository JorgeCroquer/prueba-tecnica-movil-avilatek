import 'package:flutter/widgets.dart';
import 'package:technical_test_avilatek/common/widgets/content-card.widget.dart';

class MovieFeedWidget extends StatelessWidget {
  const MovieFeedWidget({
    super.key,
    required this.offset,
    required this.items,
  });

  final double offset;
  final List<ContentCardWidget> items;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Wrap(
            spacing: 24,
            runSpacing: offset,
            children: items
                .asMap()
                .map((index, item) => MapEntry(
                    index,
                    Transform.translate(
                      offset: Offset(0, index.isEven ? 0 : offset),
                      child: item,
                    )))
                .values
                .toList(),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
