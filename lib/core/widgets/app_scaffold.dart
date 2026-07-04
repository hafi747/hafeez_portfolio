import 'package:flutter/material.dart';
import 'app_footer.dart';
import 'nav_bar.dart';
import 'nav_drawer.dart';

/// The persistent chrome around every route: nav bar (+ drawer on
/// mobile) above, footer below, and the current page's content
/// scrolling in between. Used as the builder for go_router's
/// [ShellRoute] so navigating between pages never rebuilds the nav.
class AppScaffold extends StatelessWidget {
  final Widget child;
  final String currentPath;

  const AppScaffold({super.key, required this.child, required this.currentPath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppNavBar(currentPath: currentPath),
      drawer: AppNavDrawer(currentPath: currentPath),
      body: SingleChildScrollView(
        child: Column(
          children: [
            child,
            const AppFooter(),
          ],
        ),
      ),
    );
  }
}
