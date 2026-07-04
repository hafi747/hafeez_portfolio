import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/utils/responsive.dart';
import '../../../core/widgets/fade_slide_in.dart';
import '../../../core/widgets/responsive_two_column.dart';
import '../../../core/widgets/section_heading.dart';
import '../../widgets/contact_form.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

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

    final tiles = <(IconData, String, String, String)>[
      (Icons.mail_outline, 'Email', AppConstants.email, 'mailto:${AppConstants.email}'),
      (Icons.phone_outlined, 'Phone', AppConstants.phone, 'tel:${AppConstants.phoneIntl}'),
      (Icons.business_center_outlined, 'LinkedIn', 'View Profile', AppConstants.linkedIn),
      (Icons.code, 'GitHub', 'View Profile', AppConstants.github),
    ];

    return ResponsiveCenter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: padding, vertical: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const FadeSlideIn(
              child: SectionHeading(
                number: '07.',
                title: 'Get In Touch',
                subtitle: 'Have a project in mind? Let\'s talk.',
              ),
            ),
            const SizedBox(height: 32),
            ResponsiveTwoColumn(
              leftFlex: 2,
              rightFlex: 3,
              left: FadeSlideIn(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: tiles
                      .map(
                        (t) => Padding(
                          padding: const EdgeInsets.only(bottom: 14),
                          child: InkWell(
                            onTap: () => _open(t.$4),
                            borderRadius: BorderRadius.circular(12),
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Theme.of(context).cardColor,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: scheme.outlineVariant),
                              ),
                              child: Row(
                                children: [
                                  Icon(t.$1, color: scheme.primary),
                                  const SizedBox(width: 14),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(t.$2,
                                          style: TextStyle(
                                              fontSize: 12, color: scheme.onSurfaceVariant)),
                                      Text(t.$3, style: Theme.of(context).textTheme.titleMedium),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
              right: FadeSlideIn(
                delay: const Duration(milliseconds: 150),
                child: Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: scheme.outlineVariant),
                  ),
                  child: const ContactForm(),
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
