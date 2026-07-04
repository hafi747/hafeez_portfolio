import 'package:flutter/material.dart';

/// Consistent "01. Section Title" heading with an accent-numbered
/// prefix and a trailing divider — used at the top of every page.
class SectionHeading extends StatelessWidget {
  final String number;
  final String title;
  final String? subtitle;

  const SectionHeading({
    super.key,
    required this.number,
    required this.title,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              number,
              style: TextStyle(
                color: scheme.primary,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(width: 10),
            Flexible(
              child: Text(title, style: Theme.of(context).textTheme.displayMedium),
            ),
            const SizedBox(width: 16),
            Expanded(child: Divider(color: scheme.outlineVariant)),
          ],
        ),
        if (subtitle != null) ...[
          const SizedBox(height: 10),
          Text(subtitle!, style: Theme.of(context).textTheme.bodyLarge),
        ],
      ],
    );
  }
}
