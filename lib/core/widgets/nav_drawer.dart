import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../constants/app_constants.dart';
import '../routes/route_names.dart';
import 'social_icons_row.dart';

/// Slide-out navigation drawer used on mobile widths.
class AppNavDrawer extends StatelessWidget {
  final String currentPath;

  const AppNavDrawer({super.key, required this.currentPath});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 24, 20, 8),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 22,
                    backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                    child: Text(
                      AppConstants.initials,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(AppConstants.name, style: Theme.of(context).textTheme.titleMedium),
                        Text(AppConstants.title, style: Theme.of(context).textTheme.bodyMedium),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),
            Expanded(
              child: ListView(
                children: RoutePaths.navItems.map((item) {
                  final active = item.path == '/'
                      ? currentPath == '/'
                      : currentPath.startsWith(item.path);
                  return ListTile(
                    leading: Icon(item.icon,
                        color: active ? Theme.of(context).colorScheme.primary : null),
                    title: Text(
                      item.label,
                      style: TextStyle(
                        fontWeight: active ? FontWeight.w700 : FontWeight.w500,
                        color: active ? Theme.of(context).colorScheme.primary : null,
                      ),
                    ),
                    selected: active,
                    onTap: () {
                      Navigator.of(context).pop();
                      context.go(item.path);
                    },
                  );
                }).toList(),
              ),
            ),
            const Divider(),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Center(child: SocialIconsRow()),
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
