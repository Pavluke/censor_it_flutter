import 'package:censor_it_flutter/censor_it_flutter.dart';
import 'package:flutter/material.dart';

import '../theme/text_styles.dart';
import '../widgets/info_card.dart';
import '../widgets/result_card.dart';

class WidgetBuilderTab extends StatelessWidget {
  const WidgetBuilderTab({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          spacing: 16,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const InfoCard(
              icon: Icons.emoji_emotions,
              title: 'Widget Builder Mode',
              description: 'Replace profanity with custom widgets',
              color: Colors.orange,
            ),
            ResultCard(
              child: CensorItWidget.widgetBuilder(
                text,
                pattern: LanguagePattern.english,
                style: AppTextStyles.normal,
                builder: (context, word) => const Icon(
                  Icons.no_adult_content,
                  size: 20,
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
      );
}
