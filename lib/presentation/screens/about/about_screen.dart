import 'package:flutter/material.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/utils/responsive.dart';
import '../../../core/widgets/fade_slide_in.dart';
import '../../../core/widgets/responsive_two_column.dart';
import '../../../core/widgets/section_heading.dart';
import '../../widgets/stats_row.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final padding = Responsive.pagePadding(context);
    final scheme = Theme.of(context).colorScheme;

    final facts = <(IconData, String, String)>[
      (Icons.location_on_outlined, 'Location', AppConstants.location),
      (Icons.school_outlined, 'Focus', 'Mobile App Development'),
      (Icons.language_outlined, 'Languages', 'English, Urdu'),
      (Icons.favorite_outline, 'Interests', 'Clean code, UI craft, AI in apps'),
    ];

    return ResponsiveCenter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: padding, vertical: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const FadeSlideIn(
              child: SectionHeading(
                number: '02.',
                title: 'About Me',
                subtitle: 'A little about who I am and how I work.',
              ),
            ),
            const SizedBox(height: 32),
            ResponsiveTwoColumn(
              left: FadeSlideIn(
                delay: const Duration(milliseconds: 100),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(AppConstants.bio, style: Theme.of(context).textTheme.bodyLarge),
                    const SizedBox(height: 24),
                    Text(
                      'What I focus on:',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 12),
                    ..._focusPoints.map(
                      (point) => Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(Icons.arrow_right, color: scheme.primary),
                            Expanded(
                              child: Text(point, style: Theme.of(context).textTheme.bodyMedium),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              right: FadeSlideIn(
                delay: const Duration(milliseconds: 200),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: scheme.outlineVariant),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: facts
                        .map(
                          (f) => Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(f.$1, color: scheme.primary, size: 20),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(f.$2,
                                          style: TextStyle(
                                              fontSize: 12, color: scheme.onSurfaceVariant)),
                                      Text(f.$3, style: Theme.of(context).textTheme.titleMedium),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 56),
            const FadeSlideIn(delay: Duration(milliseconds: 250), child: StatsRow()),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

const _focusPoints = [
  'Writing clean, scalable Flutter code using Clean Architecture',
  'Building smooth, responsive UI across mobile, tablet, and web',
  'Integrating real APIs, Firebase, and third-party services',
  'Shipping — turning ideas into apps that actually work end-to-end',
];
