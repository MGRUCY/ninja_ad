# ninja_ad

A Flutter app for creating and managing programmer-themed RPG characters, backed by Firebase Cloud Firestore.

## About
This project is part of a personal Flutter learning journey. It's a small RPG-style "character creator" app where the "classes" are jokes on developer archetypes (Terminal Raider, Code Junkie, UX Ninja, Algo Wizard) instead of typical fantasy classes. Users create a character with a name and slogan, pick a vocation, allocate stat points, and choose a skill. Characters are persisted to Cloud Firestore so they survive app restarts.

The project name mixes "ninja" (one of the in-game vocations, UX Ninja) with "ad" — despite the name, there is no advertising SDK anywhere in the codebase; this is not a monetized app.

## Features
- View a list of created characters on the home screen
- Swipe-to-delete a character (`Dismissible`)
- Create a new character with a name and slogan (with validation dialogs for empty fields)
- Choose one of four vocations, each with its own title, description, weapon, and unique ability
- Allocate a limited pool of stat points across Health, Attack, Defence, and Skill using +/- controls
- Choose an active skill from a list unique to the character's vocation
- Mark a character as favorite via an animated heart/favorite button
- View a character profile screen showing vocation art, slogan, weapon, ability, stats, and skills
- Save character changes back to Firestore
- Data persists across sessions via Cloud Firestore (characters are fetched once on app start)

## Flutter Concepts Used
- **State Management** — `provider` with a `ChangeNotifier` (`CharacterStore`) shared across the widget tree
- **Custom Widgets** — reusable `StyledText`, `StyledHeading`, `StyledTitle`, and `StyledButton` widgets
- **Navigation** — `Navigator.push` / `MaterialPageRoute` between Home, Create, and Profile screens
- **Forms & Validation** — `TextEditingController`s with manual validation and `AlertDialog` feedback for missing input
- **Animations** — `AnimatedRotation` on the stats star icon, a `TweenSequence` + `AnimationController` scale-pulse on the favorite heart, and `Hero` transitions for character artwork between screens
- **Firebase / Cloud Firestore** — characters are read/written to a Firestore collection using `withConverter` and `fromFirestore`/`toFirestore` mappers
- **Theming** — a custom `ThemeData` (`primaryTheme`) with a centralized `AppColors` palette, custom text theme, and input decoration theme
- **Enums with data** — `Vocation` is an enum carrying per-value title/description/weapon/ability/image fields
- **Mixins** — a `Stats` mixin shared by the `Character` model for stat point logic

## Packages Used
- `provider` — state management
- `firebase_core` / `cloud_firestore` — Firebase initialization and Firestore database access
- `google_fonts` — custom fonts (Kanit, Akatab, Actor) used throughout the UI
- `uuid` — generating unique IDs for new characters

## Screenshots
> Add screenshots here.

## Learning Purpose
This project looks like it was built to practice: wiring up Firebase/Firestore as a real backend for a Flutter app (including custom Firestore converters), using `provider` for app-wide state instead of local `setState` alone, building small custom animations (`AnimationController`, `TweenSequence`, `Hero`), and structuring a multi-screen app with models, services, shared widgets, and a centralized theme.

## Notes
- Vocation and skill artwork are bundled as local assets under `assets/img/vocations/` and `assets/img/skills/`, referenced by filename from the `Vocation` and `Skill` models.
- The `Character` model combines Firestore serialization (`toFirestore`/`fromFirestore`) with in-memory gameplay logic (stat points, skill selection, favorite toggling) in one class.
- A leftover `Sandbox` widget exists in `main.dart` but isn't used by the app.
