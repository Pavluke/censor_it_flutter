import 'package:censor_it_flutter/censor_it_flutter.dart';
import 'package:flutter/material.dart';

import '../theme/text_styles.dart';
import '../widgets/info_card.dart';
import '../widgets/result_card.dart';

class TextBuilderTab extends StatelessWidget {
  const TextBuilderTab({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          spacing: 16,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const InfoCard(
              icon: Icons.text_fields,
              title: 'Text Builder Mode',
              description: 'Replace profanity with custom text',
              color: Colors.blue,
            ),
            ResultCard(
              child: CensorItWidget.textBuilder(
                text,
                builder: (context, word) => '[censored]',
                pattern: LanguagePattern.english,
                style: AppTextStyles.normal,
                censoredStyle: AppTextStyles.censoredRed,
              ),
            ),
            ResultCard(
              child: CensorItWidget.textBuilder(
                text,
                builder: (context, word) => '*' * word.length,
                pattern: LanguagePattern.english,
                style: AppTextStyles.normal,
                censoredStyle: AppTextStyles.censoredOrange,
              ),
            ),
          ],
        ),
      );
}
