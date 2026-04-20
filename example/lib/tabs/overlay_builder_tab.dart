import 'dart:ui';

import 'package:censor_it_flutter/censor_it_flutter.dart';
import 'package:flutter/material.dart';

import '../theme/text_styles.dart';
import '../widgets/example_label.dart';
import '../widgets/info_card.dart';
import '../widgets/result_card.dart';

class OverlayBuilderTab extends StatelessWidget {
  const OverlayBuilderTab({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          spacing: 16,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const InfoCard(
              icon: Icons.blur_on,
              title: 'Overlay Builder Mode',
              description: 'Apply effects over profanity. Tap to reveal!',
              color: Colors.purple,
            ),
            const ExampleLabel('Blur Effect (Tap to reveal)'),
            ResultCard(
              child: CensorItWidget.overlayBuilder(
                text,
                pattern: LanguagePattern.english,
                onTap: (isRevealed) => !isRevealed,
                style: AppTextStyles.normal,
                censoredStyle: AppTextStyles.censoredRed,
                builder: (context, word, isRevealed) => TweenAnimationBuilder(
                  tween: Tween(begin: 0.0, end: isRevealed ? 0.0 : 1.0),
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeOut,
                  builder: (context, value, child) => ClipRRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 5 * value,
                        sigmaY: 5 * value,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: 0.1 * value),
                          borderRadius: BorderRadiusGeometry.circular(4),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const ExampleLabel('Dark Overlay (Tap to reveal)'),
            ResultCard(
              child: CensorItWidget.overlayBuilder(
                text,
                pattern: LanguagePattern.english,
                onTap: (isRevealed) => !isRevealed,
                style: AppTextStyles.normal,
                censoredStyle: AppTextStyles.censoredBold,
                builder: (context, word, isRevealed) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  decoration: BoxDecoration(
                    color: isRevealed
                        ? Colors.transparent
                        : Colors.black.withValues(alpha: 0.85),
                    borderRadius: BorderRadiusGeometry.circular(4),
                  ),
                  child: isRevealed
                      ? null
                      : const Center(
                          child: Text(
                            '18+',
                            style: TextStyle(color: Colors.white70),
                          ),
                        ),
                ),
              ),
            ),
            const ExampleLabel('Blocked Gradient Overlay'),
            ResultCard(
              child: CensorItWidget.overlayBuilder(
                text,
                pattern: LanguagePattern.english,
                style: AppTextStyles.normal,
                censoredStyle: AppTextStyles.censoredSpaced,
                builder: (context, word, isRevealed) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  decoration: BoxDecoration(
                    gradient: isRevealed
                        ? null
                        : const LinearGradient(
                            colors: [Colors.purple, Colors.pink],
                          ),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: isRevealed ? Colors.transparent : Colors.white,
                      width: 2,
                    ),
                  ),
                  child: isRevealed
                      ? null
                      : const Center(
                          child: Icon(
                            Icons.lock,
                            color: Colors.white,
                            size: 14,
                          ),
                        ),
                ),
              ),
            ),
          ],
        ),
      );
}
