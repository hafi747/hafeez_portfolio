# Abdul Hafeez — Flutter Developer Portfolio (Production-Ready)

A complete, production-structured Flutter portfolio app built with
**Material 3**, **Clean Architecture**, **go_router**, and **Provider**.
Fully responsive across mobile, tablet, and web/desktop, with dark/light
mode and animated transitions throughout.

## Sections / Routes

| Route         | Screen               |
|---------------|-----------------------|
| `/`           | Home (hero + featured projects) |
| `/about`      | About                 |
| `/skills`     | Skills (animated proficiency bars) |
| `/projects`   | Projects (filterable grid) |
| `/projects/:id` | Project detail       |
| `/experience` | Experience (timeline) |
| `/services`   | Services              |
| `/contact`    | Contact (info + validated form) |
| `/resume`     | Resume summary + download |

## Projects included

Movie Ticket Booking, Weather Forecast, Quiz App, Food Delivery,
E-Commerce, Expense Tracker, AI Skin Disease Detection, Real-Time Chat App.

## Run it

```bash
flutter pub get
flutter run                 # phone/emulator
flutter run -d chrome        # web
flutter run -d windows       # or macos / linux
```

## Architecture (Clean Architecture, 3 layers)

```
lib/
  domain/                 # Pure business layer — no Flutter/data deps
    entities/              # ProjectEntity, SkillEntity, ExperienceEntity, ServiceEntity
    repositories/           # Abstract PortfolioRepository contract

  data/                    # Implements the domain contracts
    datasources/            # PortfolioLocalDataSource — ALL your content lives here
    repositories/           # PortfolioRepositoryImpl (swap for a remote API later)

  presentation/            # UI layer
    providers/              # PortfolioProvider, NavProvider (state via Provider)
    screens/                # One folder per section/route
    widgets/                # ProjectCard, SkillProgressTile, ExperienceTimelineTile, etc.

  core/                    # Cross-cutting concerns shared by all layers above
    theme/                  # Material 3 ColorScheme, light/dark ThemeData, ThemeProvider
    routes/                 # go_router config + route/name constants
    utils/                  # Responsive breakpoints & helpers
    widgets/                # Reusable chrome: nav bar, drawer, footer, section heading...
    constants/              # AppConstants — your name, bio, email, links
```

**Why this matters in practice:** the UI never talks to
`PortfolioLocalDataSource` directly — it only depends on the abstract
`PortfolioRepository`. If you later want real content from Firestore or
a REST API, you write one new class (`PortfolioRepositoryImpl` v2) and
change one line in `main.dart`. No screen or widget needs to change.

## Where to edit your content

**One file:** `lib/data/datasources/portfolio_local_datasource.dart`
— all 8 projects, all skills, experience entries, and services.

**Personal info:** `lib/core/constants/app_constants.dart` — name, bio,
tagline, email, phone, LinkedIn, GitHub, resume link.

## Adding your photo / project screenshots

1. Drop files into `assets/images/` (already declared in `pubspec.yaml`).
2. Reference them with `Image.asset('assets/images/yourfile.png')`
   wherever you'd like — e.g. swap the initials `CircleAvatar` in
   `_HeroSection` (`lib/presentation/screens/home/home_screen.dart`).

## Adding a real resume PDF

1. Either host it (Google Drive / Firebase Storage link) and set
   `AppConstants.resumeUrl`, **or**
2. Bundle it at `assets/resume/resume.pdf` and open it locally with a
   package like `open_filex` from the Resume screen's download button.

## State management & navigation

- **Provider** — `ThemeProvider` (dark/light), `PortfolioProvider`
  (content), `NavProvider` (available for extending active-tab state).
- **go_router** — a single `ShellRoute` wraps every page in the
  persistent `AppScaffold` (nav bar + drawer + footer), so navigating
  between sections never rebuilds the chrome. Each route uses a custom
  `CustomTransitionPage` for a fade + slide transition.

## Responsive behavior

- **Mobile** (`< 640px`): hamburger drawer, single-column grids.
- **Tablet** (`640–1024px`): horizontal nav, 2-column grids.
- **Desktop/Web** (`> 1024px`): full horizontal nav, 3-column grids,
  content capped at a max width and centered.

Breakpoints live in `lib/core/utils/responsive.dart`.

## Animations

- `FadeSlideIn` / `ScrollReveal` (`lib/core/widgets/fade_slide_in.dart`)
  — fade + upward-slide entrance, staggered across grid items.
- Animated proficiency bars on the Skills screen.
- Hover-lift + shadow on project cards (web/desktop).
- Fade + slide page transitions between routes (go_router).

## Notes

- No external animation or font packages are used, to keep the project
  buildable offline with zero extra network fetches — only
  `go_router`, `provider`, and `url_launcher`.
- This project was authored without access to the Flutter SDK in the
  generation environment, so it has **not been compiled**. The code
  follows well-established, verified Flutter patterns, but please run
  `flutter pub get` and `flutter analyze` after unzipping, and let me
  know if anything needs adjusting.
