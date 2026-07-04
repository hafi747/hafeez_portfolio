import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/routes/app_router.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/theme_provider.dart';
import 'data/repositories/portfolio_repository_impl.dart';
import 'domain/repositories/portfolio_repository.dart';
import 'presentation/providers/nav_provider.dart';
import 'presentation/providers/portfolio_provider.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Theme (dark/light) state, available app-wide.
        ChangeNotifierProvider(create: (_) => ThemeProvider()),

        // Navigation selection state, shared by nav bar / drawer / rail.
        ChangeNotifierProvider(create: (_) => NavProvider()),

        // Dependency injection: domain layer only ever sees the
        // abstract PortfolioRepository, never the concrete impl.
        Provider<PortfolioRepository>(create: (_) => const PortfolioRepositoryImpl()),

        // Portfolio content provider, built on top of the repository.
        ChangeNotifierProvider(
          create: (context) => PortfolioProvider(context.read<PortfolioRepository>()),
        ),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, _) {
          return MaterialApp.router(
            title: 'Abdul Hafeez | Flutter Developer',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.light,
            darkTheme: AppTheme.dark,
            themeMode: themeProvider.mode,
            routerConfig: appRouter,
          );
        },
      ),
    );
  }
}
