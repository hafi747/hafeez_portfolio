import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/utils/responsive.dart';
import '../../../core/widgets/fade_slide_in.dart';
import '../../../core/widgets/section_heading.dart';
import '../../providers/portfolio_provider.dart';
import '../../widgets/experience_timeline_tile.dart';

class ExperienceScreen extends StatelessWidget {
  const ExperienceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final padding = Responsive.pagePadding(context);
    final experience = context.watch<PortfolioProvider>().experience;

    return ResponsiveCenter(
      maxWidth: 900,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: padding, vertical: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const FadeSlideIn(
              child: SectionHeading(
                number: '05.',
                title: 'Experience',
                subtitle: 'Where I\'ve worked and what I\'ve built.',
              ),
            ),
            const SizedBox(height: 36),
            ...List.generate(experience.length, (i) {
              return ScrollReveal(
                index: i,
                child: ExperienceTimelineTile(
                  experience: experience[i],
                  isLast: i == experience.length - 1,
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
