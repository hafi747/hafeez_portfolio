import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/utils/responsive.dart';
import '../../../core/widgets/fade_slide_in.dart';
import '../../../core/widgets/section_heading.dart';
import '../../providers/portfolio_provider.dart';
import '../../widgets/skill_progress_tile.dart';

class SkillsScreen extends StatelessWidget {
  const SkillsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final padding = Responsive.pagePadding(context);
    final skills = context.watch<PortfolioProvider>().skills;

    return ResponsiveCenter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: padding, vertical: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const FadeSlideIn(
              child: SectionHeading(
                number: '03.',
                title: 'Skills',
                subtitle: 'Tools and technologies I use to ship apps.',
              ),
            ),
            const SizedBox(height: 32),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: skills.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: Responsive.gridColumns(context, desktop: 2, tablet: 2, mobile: 1),
                mainAxisSpacing: 18,
                crossAxisSpacing: 18,
                childAspectRatio: 3.4,
              ),
              itemBuilder: (context, index) => ScrollReveal(
                index: index,
                child: SkillProgressTile(skill: skills[index]),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
