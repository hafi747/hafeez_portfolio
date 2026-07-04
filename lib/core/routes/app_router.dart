import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../widgets/app_scaffold.dart';
import '../../presentation/screens/home/home_screen.dart';
import '../../presentation/screens/about/about_screen.dart';
import '../../presentation/screens/skills/skills_screen.dart';
import '../../presentation/screens/projects/projects_screen.dart';
import '../../presentation/screens/projects/project_detail_screen.dart';
import '../../presentation/screens/experience/experience_screen.dart';
import '../../presentation/screens/services/services_screen.dart';
import '../../presentation/screens/contact/contact_screen.dart';
import '../../presentation/screens/resume/resume_screen.dart';
import 'route_names.dart';

/// Wraps a screen in a fade + slight-slide transition for smooth
/// navigation between pages, instead of the default platform transition.
CustomTransitionPage<void> _fadeThroughPage(Widget child) {
  return CustomTransitionPage(
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final fade = CurvedAnimation(parent: animation, curve: Curves.easeOut);
      final slide = Tween<Offset>(
        begin: const Offset(0, 0.03),
        end: Offset.zero,
      ).animate(CurvedAnimation(parent: animation, curve: Curves.easeOutCubic));
      return FadeTransition(
        opacity: fade,
        child: SlideTransition(position: slide, child: child),
      );
    },
    transitionDuration: const Duration(milliseconds: 320),
  );
}

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter appRouter = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: RoutePaths.home,
  routes: [
    ShellRoute(
      builder: (context, state, child) => AppScaffold(
        currentPath: state.uri.toString(),
        child: child,
      ),
      routes: [
        GoRoute(
          path: RoutePaths.home,
          pageBuilder: (context, state) => _fadeThroughPage(const HomeScreen()),
        ),
        GoRoute(
          path: RoutePaths.about,
          pageBuilder: (context, state) => _fadeThroughPage(const AboutScreen()),
        ),
        GoRoute(
          path: RoutePaths.skills,
          pageBuilder: (context, state) => _fadeThroughPage(const SkillsScreen()),
        ),
        GoRoute(
          path: RoutePaths.projects,
          pageBuilder: (context, state) => _fadeThroughPage(const ProjectsScreen()),
          routes: [
            GoRoute(
              path: ':id',
              pageBuilder: (context, state) {
                final id = state.pathParameters['id']!;
                return _fadeThroughPage(ProjectDetailScreen(projectId: id));
              },
            ),
          ],
        ),
        GoRoute(
          path: RoutePaths.experience,
          pageBuilder: (context, state) => _fadeThroughPage(const ExperienceScreen()),
        ),
        GoRoute(
          path: RoutePaths.services,
          pageBuilder: (context, state) => _fadeThroughPage(const ServicesScreen()),
        ),
        GoRoute(
          path: RoutePaths.contact,
          pageBuilder: (context, state) => _fadeThroughPage(const ContactScreen()),
        ),
        GoRoute(
          path: RoutePaths.resume,
          pageBuilder: (context, state) => _fadeThroughPage(const ResumeScreen()),
        ),
      ],
    ),
  ],
  errorBuilder: (context, state) => Scaffold(
    body: Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.error_outline, size: 48),
          const SizedBox(height: 12),
          Text('Page not found: ${state.uri}'),
          const SizedBox(height: 20),
          FilledButton(
            onPressed: () => context.go(RoutePaths.home),
            child: const Text('Go Home'),
          ),
        ],
      ),
    ),
  ),
);
