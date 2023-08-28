import 'package:flutter/widgets.dart';
import 'package:technical_test_avilatek/screens/feed/contracts/feed-movie.dto.dart';

import 'index.dart' as common_widgets;

class MovieFeedWidget extends StatelessWidget {
  const MovieFeedWidget({
    super.key,
    required this.offset,
    required this.items,
  });

  final double offset;
  final List<FeedMovieDto> items;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
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
                      child: common_widgets.ContentCardWidget(
                        title: item.title,
                        subtitle:
                            '${(item.voteAverage * 10).toInt()}% User\'s score',
                        imageUrl: item.imageUrl!,
                      ),
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
