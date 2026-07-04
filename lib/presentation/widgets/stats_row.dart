import 'package:flutter/material.dart';
import '../../core/constants/app_constants.dart';
import '../../core/utils/responsive.dart';

class _Stat {
  final String value;
  final String label;
  const _Stat(this.value, this.label);
}

/// Quick-glance stats (projects shipped, years experience, etc).
class StatsRow extends StatelessWidget {
  const StatsRow({super.key});

  @override
  Widget build(BuildContext context) {
    final stats = [
      _Stat('${AppConstants.projectsCompleted}+', 'Projects Built'),
      _Stat('${AppConstants.yearsExperience}+', 'Years Experience'),
      const _Stat('8', 'Core Skills'),
      const _Stat('100%', 'Client Focus'),
    ];

    final isMobile = Responsive.isMobile(context);

    return Wrap(
      spacing: 32,
      runSpacing: 20,
      children: stats
          .map(
            (s) => SizedBox(
              width: isMobile ? 140 : 160,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    s.value,
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                  ),
                  const SizedBox(height: 4),
                  Text(s.label, style: Theme.of(context).textTheme.bodyMedium),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}
