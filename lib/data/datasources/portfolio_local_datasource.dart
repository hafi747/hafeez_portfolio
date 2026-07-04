import 'package:flutter/material.dart';
import '../../domain/entities/experience_entity.dart';
import '../../domain/entities/project_entity.dart';
import '../../domain/entities/service_entity.dart';
import '../../domain/entities/skill_entity.dart';

/// ---------------------------------------------------------------------
/// ALL EDITABLE CONTENT LIVES HERE.
/// This is the local "data source" in the Clean Architecture sense —
/// swap this for a remote API/Firestore source later without touching
/// any provider or UI code, since both implement the same shape.
/// ---------------------------------------------------------------------
class PortfolioLocalDataSource {
  const PortfolioLocalDataSource();

  List<ProjectEntity> fetchProjects() => const [
        ProjectEntity(
          id: 'movie-ticket-booking',
          title: 'Movie Ticket Booking App',
          description:
              'A full-featured movie booking app with live showtimes, '
              'interactive seat selection, cinema listings, and a smooth '
              'multi-step checkout flow.',
          techStack: ['Flutter', 'Provider', 'REST API', 'Firebase Auth'],
          icon: Icons.local_movies_outlined,
          category: ProjectCategory.mobile,
          githubUrl: 'https://github.com/hafi747',
          highlights: [
            'Real-time seat map with conflict prevention',
            'Multi-step checkout with payment mock flow',
            'Booking history and e-ticket generation',
          ],
        ),
        ProjectEntity(
          id: 'weather-app',
          title: 'Weather Forecast App',
          description:
              'Real-time weather app with current conditions, hourly and '
              '7-day forecasts, GPS-based location search, and animated '
              'condition-based UI.',
          techStack: ['Flutter', 'OpenWeather API', 'Geolocator', 'HTTP'],
          icon: Icons.wb_sunny_outlined,
          category: ProjectCategory.mobile,
          githubUrl: 'https://github.com/hafi747',
          highlights: [
            'GPS auto-detect + manual city search',
            'Animated backgrounds per weather condition',
            'Offline caching of the last forecast',
          ],
        ),
        ProjectEntity(
          id: 'quiz-app',
          title: 'Quiz App',
          description:
              'Interactive multi-category quiz app with timed questions, '
              'live score tracking, and a results summary with retry and '
              'share options.',
          techStack: ['Flutter', 'Dart', 'State Management', 'SQLite'],
          icon: Icons.quiz_outlined,
          category: ProjectCategory.mobile,
          githubUrl: 'https://github.com/hafi747',
          highlights: [
            'Category-based question banks',
            'Countdown timer per question',
            'Local high-score leaderboard',
          ],
        ),
        ProjectEntity(
          id: 'food-delivery',
          title: 'Food Delivery App',
          description:
              'End-to-end food ordering experience with restaurant '
              'listings, menu browsing, cart management, and live order '
              'status tracking.',
          techStack: ['Flutter', 'Bloc', 'REST API', 'Google Maps'],
          icon: Icons.delivery_dining_outlined,
          category: ProjectCategory.mobile,
          githubUrl: 'https://github.com/hafi747',
          highlights: [
            'Cart with quantity, add-ons, and coupons',
            'Live order-status timeline',
            'Map-based delivery tracking screen',
          ],
        ),
        ProjectEntity(
          id: 'ecommerce',
          title: 'E-Commerce App',
          description:
              'A polished shopping app with product catalog, filters, '
              'cart, wishlist, and a responsive checkout flow across '
              'phone, tablet, and web.',
          techStack: ['Flutter', 'Provider', 'REST API', 'Stripe (mock)'],
          icon: Icons.shopping_bag_outlined,
          category: ProjectCategory.mobile,
          githubUrl: 'https://github.com/hafi747',
          highlights: [
            'Faceted search & category filters',
            'Persistent cart and wishlist',
            'Responsive grid across breakpoints',
          ],
        ),
        ProjectEntity(
          id: 'expense-tracker',
          title: 'Expense Tracker',
          description:
              'Personal finance app to log income/expenses, categorize '
              'spending, and visualize monthly trends with interactive '
              'charts.',
          techStack: ['Flutter', 'SQLite', 'Charts', 'Provider'],
          icon: Icons.pie_chart_outline,
          category: ProjectCategory.mobile,
          githubUrl: 'https://github.com/hafi747',
          highlights: [
            'Category-wise spending breakdown charts',
            'Recurring transaction support',
            'Monthly budget alerts',
          ],
        ),
        ProjectEntity(
          id: 'ai-skin-disease-detection',
          title: 'AI Skin Disease Detection',
          description:
              'An AI-assisted app that analyzes a photo of a skin '
              'condition and returns likely classifications with '
              'confidence scores, using an on-device / API-based ML '
              'model.',
          techStack: ['Flutter', 'TensorFlow Lite', 'REST API', 'Camera'],
          icon: Icons.health_and_safety_outlined,
          category: ProjectCategory.ai,
          githubUrl: 'https://github.com/hafi747',
          highlights: [
            'Camera + gallery image input pipeline',
            'On-device inference with TFLite',
            'Confidence-ranked result cards with guidance',
          ],
        ),
        ProjectEntity(
          id: 'chat-app',
          title: 'Real-Time Chat App',
          description:
              'A real-time messaging app with 1:1 and group chats, '
              'typing indicators, read receipts, and push notifications.',
          techStack: ['Flutter', 'Firebase', 'Firestore', 'FCM'],
          icon: Icons.chat_bubble_outline,
          category: ProjectCategory.mobile,
          githubUrl: 'https://github.com/hafi747',
          highlights: [
            'Real-time sync via Firestore streams',
            'Typing indicators & read receipts',
            'Push notifications with FCM',
          ],
        ),
      ];

  List<SkillEntity> fetchSkills() => const [
        SkillEntity(name: 'Flutter', icon: Icons.flutter_dash, proficiency: 0.92, category: SkillCategory.framework),
        SkillEntity(name: 'Dart', icon: Icons.code, proficiency: 0.90, category: SkillCategory.language),
        SkillEntity(name: 'Provider / Bloc', icon: Icons.hub_outlined, proficiency: 0.85, category: SkillCategory.framework),
        SkillEntity(name: 'REST APIs', icon: Icons.cloud_outlined, proficiency: 0.88, category: SkillCategory.backend),
        SkillEntity(name: 'Firebase', icon: Icons.local_fire_department_outlined, proficiency: 0.82, category: SkillCategory.backend),
        SkillEntity(name: 'SQLite / Hive', icon: Icons.storage_outlined, proficiency: 0.80, category: SkillCategory.backend),
        SkillEntity(name: 'Clean Architecture', icon: Icons.architecture_outlined, proficiency: 0.78, category: SkillCategory.framework),
        SkillEntity(name: 'Git & GitHub', icon: Icons.merge_type, proficiency: 0.85, category: SkillCategory.tools),
        SkillEntity(name: 'UI / UX Design', icon: Icons.design_services_outlined, proficiency: 0.80, category: SkillCategory.tools),
        SkillEntity(name: 'CI/CD', icon: Icons.rocket_launch_outlined, proficiency: 0.65, category: SkillCategory.tools),
      ];

  List<ExperienceEntity> fetchExperience() => const [
        ExperienceEntity(
          role: 'Flutter Developer',
          organization: 'Freelance / Client Projects',
          period: '2024 — Present',
          description:
              'Building and shipping cross-platform mobile apps for '
              'clients, covering everything from UI implementation to '
              'API integration and app store releases.',
          highlights: [
            'Delivered 8+ production-style apps across e-commerce, food delivery, and health tech',
            'Adopted Clean Architecture and Provider/Bloc for maintainable codebases',
            'Collaborated directly with clients on requirements and iteration',
          ],
        ),
        ExperienceEntity(
          role: 'Mobile App Development — Self-Directed Learning',
          organization: 'Personal Projects & Open Source',
          period: '2023 — 2024',
          description:
              'Intensive self-study and project-based learning in '
              'Flutter/Dart, state management, and mobile UI/UX '
              'principles.',
          highlights: [
            'Built multiple portfolio projects (quiz, weather, booking apps)',
            'Practiced state management patterns: Provider, Bloc, Riverpod',
            'Learned REST API integration, local storage, and Firebase',
          ],
        ),
      ];

  List<ServiceEntity> fetchServices() => const [
        ServiceEntity(
          title: 'Mobile App Development',
          description:
              'End-to-end Android & iOS app development with Flutter — '
              'from wireframes to App Store / Play Store release.',
          icon: Icons.phone_iphone_outlined,
        ),
        ServiceEntity(
          title: 'UI/UX Implementation',
          description:
              'Pixel-accurate, responsive UI implementation with smooth '
              'micro-interactions and animations.',
          icon: Icons.design_services_outlined,
        ),
        ServiceEntity(
          title: 'API & Backend Integration',
          description:
              'REST API, Firebase, and third-party SDK integration with '
              'robust error handling and state management.',
          icon: Icons.cloud_sync_outlined,
        ),
        ServiceEntity(
          title: 'App Maintenance & Upgrades',
          description:
              'Refactoring legacy Flutter codebases, performance tuning, '
              'and migrating to Clean Architecture.',
          icon: Icons.build_circle_outlined,
        ),
        ServiceEntity(
          title: 'Cross-Platform Web/Desktop',
          description:
              'Extending mobile codebases to responsive web and desktop '
              'targets from a single Flutter codebase.',
          icon: Icons.devices_outlined,
        ),
        ServiceEntity(
          title: 'Technical Consulting',
          description:
              'Architecture reviews, tech-stack decisions, and code '
              'audits for teams building with Flutter.',
          icon: Icons.lightbulb_outline,
        ),
      ];
}
