import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/routes/route_names.dart';
import '../../../core/utils/responsive.dart';
import '../../../core/widgets/fade_slide_in.dart';
import '../../../core/widgets/section_heading.dart';
import '../../../core/widgets/social_icons_row.dart';
import '../../providers/portfolio_provider.dart';
import '../../widgets/project_card.dart';
import '../../widgets/stats_row.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final padding = Responsive.pagePadding(context);
    final isMobile = Responsive.isMobile(context);
    final projects =
        context.watch<PortfolioProvider>().projects.take(3).toList();

    return ResponsiveCenter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 48),
            _HeroSection(isMobile: isMobile),
            const SizedBox(height: 64),
            const FadeSlideIn(child: StatsRow()),
            const SizedBox(height: 72),
            FadeSlideIn(
              child: SectionHeading(
                number: '01.',
                title: 'Featured Projects',
                subtitle: 'A few things I\'ve built recently.',
              ),
            ),
            const SizedBox(height: 24),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: projects.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: Responsive.gridColumns(context,
                    desktop: 3, tablet: 2, mobile: 1),
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                childAspectRatio: isMobile ? 1.25 : 0.95,
              ),
              itemBuilder: (context, index) => ScrollReveal(
                index: index,
                child: ProjectCard(project: projects[index]),
              ),
            ),
            const SizedBox(height: 32),
            Center(
              child: OutlinedButton.icon(
                onPressed: () => context.go(RoutePaths.projects),
                icon: const Icon(Icons.grid_view_outlined, size: 18),
                label: const Text('View All Projects'),
              ),
            ),
            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
}

class _HeroSection extends StatelessWidget {
  final bool isMobile;
  const _HeroSection({required this.isMobile});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return FadeSlideIn(
      duration: const Duration(milliseconds: 650),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: isMobile ? 40 : 52,
            backgroundColor: scheme.primaryContainer,
            backgroundImage: const AssetImage('assets/images/profile1.jpeg'),
            // Once you have a photo in assets/images/ (e.g. profile.jpg),
            // replace the line below with:
            // backgroundImage: const AssetImage('assets/images/profile.jpg'),
            // child: Text(
            //   AppConstants.initials,
            //   style: TextStyle(
            //     color: scheme.onPrimaryContainer,
            //     fontSize: isMobile ? 26 : 32,
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),
          ),
          const SizedBox(height: 28),
          Text('Hi, my name is',
              style: TextStyle(color: scheme.primary, fontSize: 18)),
          const SizedBox(height: 8),
          Text(
            AppConstants.name,
            style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  fontSize: isMobile ? 34 : 52,
                ),
          ),
          const SizedBox(height: 6),
          Text(
            AppConstants.title,
            style: TextStyle(
              color: scheme.onSurfaceVariant,
              fontSize: isMobile ? 24 : 34,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 18),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 560),
            child: Text(AppConstants.tagline,
                style: Theme.of(context).textTheme.bodyLarge),
          ),
          const SizedBox(height: 32),
          Wrap(
            spacing: 14,
            runSpacing: 14,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: () => context.go(RoutePaths.projects),
                icon: const Icon(Icons.grid_view_outlined, size: 18),
                label: const Text('View My Work'),
              ),
              OutlinedButton.icon(
                onPressed: () => context.go(RoutePaths.contact),
                icon: const Icon(Icons.mail_outline, size: 18),
                label: const Text('Get In Touch'),
              ),
              const SocialIconsRow(),
            ],
          ),
        ],
      ),
    );
  }
}
