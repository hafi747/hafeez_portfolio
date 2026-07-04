import 'package:flutter/material.dart';
import '../../domain/entities/service_entity.dart';

class ServiceCard extends StatelessWidget {
  final ServiceEntity service;

  const ServiceCard({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: scheme.outlineVariant),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: scheme.secondaryContainer,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(service.icon, color: scheme.onSecondaryContainer, size: 26),
          ),
          const SizedBox(height: 16),
          Text(service.title, style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 8),
          Text(service.description, style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    );
  }
}
