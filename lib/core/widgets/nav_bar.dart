import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../constants/app_constants.dart';
import '../routes/route_names.dart';
import '../theme/theme_provider.dart';
import '../utils/responsive.dart';

/// Horizontal navigation bar shown on tablet & desktop widths.
/// Highlights the active route and exposes the dark/light toggle.
class AppNavBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onMenuTap;
  final String currentPath;

  const AppNavBar({super.key, this.onMenuTap, required this.currentPath});

  @override
  Size get preferredSize => const Size.fromHeight(72);

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final themeProvider = context.watch<ThemeProvider>();

    return AppBar(
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      title: Padding(
        padding: EdgeInsets.symmetric(horizontal: Responsive.pagePadding(context)),
        child: Row(
          children: [
            InkWell(
              onTap: () => context.go(RoutePaths.home),
              borderRadius: BorderRadius.circular(8),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 18,
                    backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                    child: Text(
                      AppConstants.initials,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  if (!isMobile)
                    Text(
                      AppConstants.name,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                ],
              ),
            ),
            const Spacer(),
            if (!isMobile)
              ...RoutePaths.navItems.map((item) {
                final active = item.path == '/'
                    ? currentPath == '/'
                    : currentPath.startsWith(item.path);
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: TextButton(
                    onPressed: () => context.go(item.path),
                    style: TextButton.styleFrom(
                      foregroundColor: active
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                    child: Text(
                      item.label,
                      style: TextStyle(
                        fontWeight: active ? FontWeight.w700 : FontWeight.w500,
                      ),
                    ),
                  ),
                );
              }),
            IconButton(
              tooltip: themeProvider.isDark ? 'Switch to light mode' : 'Switch to dark mode',
              onPressed: themeProvider.toggle,
              icon: Icon(
                themeProvider.isDark ? Icons.light_mode_outlined : Icons.dark_mode_outlined,
              ),
            ),
            if (isMobile)
              IconButton(
                tooltip: 'Menu',
                onPressed: onMenuTap ?? () => Scaffold.of(context).openDrawer(),
                icon: const Icon(Icons.menu),
              ),
          ],
        ),
      ),
    );
  }
}
