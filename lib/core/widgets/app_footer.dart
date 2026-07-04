import 'package:flutter/material.dart';
import '../constants/app_constants.dart';
import '../utils/responsive.dart';
import 'social_icons_row.dart';

class AppFooter extends StatelessWidget {
  const AppFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Responsive.pagePadding(context),
        vertical: 32,
      ),
      child: Column(
        children: [
          Divider(color: Theme.of(context).colorScheme.outlineVariant),
          const SizedBox(height: 20),
          Flex(
            direction: isMobile ? Axis.vertical : Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '© 2026 ${AppConstants.name}. Built with Flutter.',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              if (isMobile) const SizedBox(height: 12),
              const SocialIconsRow(iconSize: 20),
            ],
          ),
        ],
      ),
    );
  }
}
