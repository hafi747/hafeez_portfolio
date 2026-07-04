import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/routes/route_names.dart';
import '../../../core/utils/responsive.dart';
import '../../../core/widgets/fade_slide_in.dart';
import '../../providers/portfolio_provider.dart';

class ProjectDetailScreen extends StatelessWidget {
  final String projectId;
  const ProjectDetailScreen({super.key, required this.projectId});

  Future<void> _open(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final project = context.watch<PortfolioProvider>().projectById(projectId);
    final padding = Responsive.pagePadding(context);
    final scheme = Theme.of(context).colorScheme;

    if (project == null) {
      return ResponsiveCenter(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: padding, vertical: 64),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Project not found', style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: 16),
              OutlinedButton.icon(
                onPressed: () => context.go(RoutePaths.projects),
                icon: const Icon(Icons.arrow_back, size: 18),
                label: const Text('Back to Projects'),
              ),
            ],
          ),
        ),
      );
    }

    return ResponsiveCenter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: padding, vertical: 48),
        child: FadeSlideIn(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton.icon(
                onPressed: () => context.go(RoutePaths.projects),
                icon: const Icon(Icons.arrow_back, size: 18),
                label: const Text('Back to Projects'),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: scheme.primaryContainer,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Icon(project.icon, color: scheme.onPrimaryContainer, size: 32),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(project.title, style: Theme.of(context).textTheme.displayMedium),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 720),
                child: Text(project.description, style: Theme.of(context).textTheme.bodyLarge),
              ),
              const SizedBox(height: 24),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: project.techStack.map((t) => Chip(label: Text(t))).toList(),
              ),
              if (project.highlights.isNotEmpty) ...[
                const SizedBox(height: 32),
                Text('Key Highlights', style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 14),
                ...project.highlights.map(
                  (h) => Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.check_circle_outline, size: 18, color: scheme.primary),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(h, style: Theme.of(context).textTheme.bodyMedium),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
              const SizedBox(height: 32),
              Wrap(
                spacing: 14,
                runSpacing: 14,
                children: [
                  if (project.githubUrl != null)
                    ElevatedButton.icon(
                      onPressed: () => _open(project.githubUrl!),
                      icon: const Icon(Icons.code, size: 18),
                      label: const Text('View Code'),
                    ),
                  if (project.liveUrl != null)
                    OutlinedButton.icon(
                      onPressed: () => _open(project.liveUrl!),
                      icon: const Icon(Icons.open_in_new, size: 18),
                      label: const Text('Live Demo'),
                    ),
                ],
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
