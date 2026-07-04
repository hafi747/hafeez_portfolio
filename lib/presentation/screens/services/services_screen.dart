import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/utils/responsive.dart';
import '../../../core/widgets/fade_slide_in.dart';
import '../../../core/widgets/section_heading.dart';
import '../../providers/portfolio_provider.dart';
import '../../widgets/service_card.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final padding = Responsive.pagePadding(context);
    final services = context.watch<PortfolioProvider>().services;

    return ResponsiveCenter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: padding, vertical: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const FadeSlideIn(
              child: SectionHeading(
                number: '06.',
                title: 'Services',
                subtitle: 'How I can help bring your app to life.',
              ),
            ),
            const SizedBox(height: 28),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: services.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: Responsive.gridColumns(context, desktop: 3, tablet: 2, mobile: 1),
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                childAspectRatio: 1.15,
              ),
              itemBuilder: (context, index) => ScrollReveal(
                index: index,
                child: ServiceCard(service: services[index]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
