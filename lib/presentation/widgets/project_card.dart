import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/routes/route_names.dart';
import '../../domain/entities/project_entity.dart';

/// A project card used in the Projects grid and on the Home page
/// "Featured Projects" preview. Tapping it navigates to the project's
/// detail route. Lifts slightly on hover for a tactile feel on web/desktop.
class ProjectCard extends StatefulWidget {
  final ProjectEntity project;

  const ProjectCard({super.key, required this.project});

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final p = widget.project;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => context.go(RoutePaths.projectDetailPath(p.id)),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          curve: Curves.easeOut,
          transform: _hovering
              ? (Matrix4.identity()..translate(0.0, -6.0))
              : Matrix4.identity(),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: _hovering ? scheme.primary : scheme.outlineVariant,
              width: 1,
            ),
            boxShadow: _hovering
                ? [
                    BoxShadow(
                      color: scheme.primary.withOpacity(0.18),
                      blurRadius: 24,
                      offset: const Offset(0, 12),
                    ),
                  ]
                : [],
          ),
          padding: const EdgeInsets.all(22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: scheme.primaryContainer,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(p.icon, color: scheme.onPrimaryContainer, size: 26),
                  ),
                  Icon(Icons.arrow_outward, size: 20, color: scheme.onSurfaceVariant),
                ],
              ),
              const SizedBox(height: 18),
              Text(p.title, style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 8),
              Text(
                p.description,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: p.techStack
                    .take(3)
                    .map((t) => Chip(
                          label: Text(t),
                          visualDensity: VisualDensity.compact,
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ))
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
