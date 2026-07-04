import 'package:flutter/material.dart';
import '../../domain/entities/experience_entity.dart';

/// A single timeline entry for the Experience screen: a dot + connecting
/// line on the left, role/org/period/description/highlights on the right.
class ExperienceTimelineTile extends StatelessWidget {
  final ExperienceEntity experience;
  final bool isLast;

  const ExperienceTimelineTile({
    super.key,
    required this.experience,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                width: 14,
                height: 14,
                margin: const EdgeInsets.only(top: 6),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: scheme.primary,
                  border: Border.all(color: scheme.primaryContainer, width: 4),
                ),
              ),
              if (!isLast)
                Expanded(
                  child: Container(width: 2, color: scheme.outlineVariant),
                ),
            ],
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 32),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: scheme.outlineVariant),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: 10,
                      children: [
                        Text(experience.role, style: Theme.of(context).textTheme.titleLarge),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: scheme.primaryContainer,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            experience.period,
                            style: TextStyle(
                              color: scheme.onPrimaryContainer,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      experience.organization,
                      style: TextStyle(color: scheme.primary, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 10),
                    Text(experience.description, style: Theme.of(context).textTheme.bodyMedium),
                    if (experience.highlights.isNotEmpty) ...[
                      const SizedBox(height: 12),
                      ...experience.highlights.map(
                        (h) => Padding(
                          padding: const EdgeInsets.only(bottom: 6),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(Icons.check_circle_outline, size: 16, color: scheme.primary),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(h, style: Theme.of(context).textTheme.bodyMedium),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
