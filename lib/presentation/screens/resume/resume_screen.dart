import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/utils/responsive.dart';
import '../../../core/widgets/fade_slide_in.dart';
import '../../../core/widgets/section_heading.dart';
import '../../providers/portfolio_provider.dart';

class ResumeScreen extends StatelessWidget {
  const ResumeScreen({super.key});

  Future<void> _open(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final padding = Responsive.pagePadding(context);
    final scheme = Theme.of(context).colorScheme;
    final skills = context.watch<PortfolioProvider>().skills;
    final experience = context.watch<PortfolioProvider>().experience;

    return ResponsiveCenter(
      maxWidth: 900,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: padding, vertical: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const FadeSlideIn(
              child: SectionHeading(
                number: '08.',
                title: 'Resume',
                subtitle: 'A quick summary — or grab the full PDF.',
              ),
            ),
            const SizedBox(height: 28),
            FadeSlideIn(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: scheme.primaryContainer,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 16,
                  runSpacing: 16,
                  children: [
                    Icon(Icons.description_outlined, color: scheme.onPrimaryContainer, size: 32),
                    Text(
                      '${AppConstants.name} — ${AppConstants.title}',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: scheme.onPrimaryContainer,
                          ),
                    ),
                    const Spacer(),
                    ElevatedButton.icon(
                      onPressed: () => _open(AppConstants.resumeUrl),
                      icon: const Icon(Icons.download_outlined, size: 18),
                      label: const Text('Download Resume'),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40),
            FadeSlideIn(
              delay: const Duration(milliseconds: 100),
              child: Text('Skills Summary', style: Theme.of(context).textTheme.titleLarge),
            ),
            const SizedBox(height: 16),
            FadeSlideIn(
              delay: const Duration(milliseconds: 150),
              child: Wrap(
                spacing: 10,
                runSpacing: 10,
                children: skills
                    .map(
                      (s) => Chip(
                        avatar: Icon(s.icon, size: 16, color: scheme.primary),
                        label: Text(s.name),
                      ),
                    )
                    .toList(),
              ),
            ),
            const SizedBox(height: 40),
            FadeSlideIn(
              delay: const Duration(milliseconds: 200),
              child: Text('Experience Summary', style: Theme.of(context).textTheme.titleLarge),
            ),
            const SizedBox(height: 16),
            ...List.generate(experience.length, (i) {
              final e = experience[i];
              return FadeSlideIn(
                delay: Duration(milliseconds: 220 + i * 60),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Container(
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: scheme.outlineVariant),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(e.role, style: Theme.of(context).textTheme.titleMedium),
                            ),
                            Text(e.period,
                                style: TextStyle(color: scheme.onSurfaceVariant, fontSize: 12)),
                          ],
                        ),
                        Text(e.organization,
                            style: TextStyle(color: scheme.primary, fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ),
                ),
              );
            }),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
