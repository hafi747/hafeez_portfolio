import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/utils/responsive.dart';
import '../../../core/widgets/fade_slide_in.dart';
import '../../../core/widgets/section_heading.dart';
import '../../../domain/entities/project_entity.dart';
import '../../providers/portfolio_provider.dart';
import '../../widgets/project_card.dart';

class ProjectsScreen extends StatefulWidget {
  const ProjectsScreen({super.key});

  @override
  State<ProjectsScreen> createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  ProjectCategory? _filter;

  String _labelFor(ProjectCategory? c) {
    switch (c) {
      case null:
        return 'All';
      case ProjectCategory.mobile:
        return 'Mobile';
      case ProjectCategory.ai:
        return 'AI';
      case ProjectCategory.uiux:
        return 'UI/UX';
    }
  }

  @override
  Widget build(BuildContext context) {
    final padding = Responsive.pagePadding(context);
    final isMobile = Responsive.isMobile(context);
    final allProjects = context.watch<PortfolioProvider>().projects;
    final projects = _filter == null
        ? allProjects
        : allProjects.where((p) => p.category == _filter).toList();

    return ResponsiveCenter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: padding, vertical: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const FadeSlideIn(
              child: SectionHeading(
                number: '04.',
                title: 'Projects',
                subtitle: 'A selection of apps I\'ve designed and built.',
              ),
            ),
            const SizedBox(height: 24),
            Wrap(
              spacing: 10,
              children: [null, ProjectCategory.mobile, ProjectCategory.ai, ProjectCategory.uiux]
                  .map(
                    (c) => ChoiceChip(
                      label: Text(_labelFor(c)),
                      selected: _filter == c,
                      onSelected: (_) => setState(() => _filter = c),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 28),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: projects.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: Responsive.gridColumns(context, desktop: 3, tablet: 2, mobile: 1),
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                childAspectRatio: isMobile ? 1.25 : 0.95,
              ),
              itemBuilder: (context, index) => ScrollReveal(
                index: index,
                child: ProjectCard(project: projects[index]),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
