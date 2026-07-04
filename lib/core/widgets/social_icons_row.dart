import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/app_constants.dart';

/// Row of tappable icons linking to GitHub, LinkedIn, and email.
/// Reused in the nav bar, hero section, and footer.
class SocialIconsRow extends StatelessWidget {
  final double iconSize;
  final Color? color;

  const SocialIconsRow({super.key, this.iconSize = 22, this.color});

  Future<void> _open(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final c = color ?? Theme.of(context).colorScheme.onSurface;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          tooltip: 'GitHub',
          icon: Icon(Icons.code, size: iconSize, color: c),
          onPressed: () => _open(AppConstants.github),
        ),
        IconButton(
          tooltip: 'LinkedIn',
          icon: Icon(Icons.business_center_outlined, size: iconSize, color: c),
          onPressed: () => _open(AppConstants.linkedIn),
        ),
        IconButton(
          tooltip: 'Email',
          icon: Icon(Icons.mail_outline, size: iconSize, color: c),
          onPressed: () => _open('mailto:${AppConstants.email}'),
        ),
      ],
    );
  }
}
