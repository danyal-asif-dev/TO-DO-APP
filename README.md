# Task Management & To-Do List

A Flutter app UI for managing tasks and projects. It has a welcome screen, a home dashboard, a calendar with daily tasks and an "Add Project" screen.

> **Status:** design only. All names, dates, counts and percentages are static sample data, and most buttons are not functional yet.

## Screens

| Screen | File | What it shows |
| --- | --- | --- |
| Let's Start | `lets_start_screen.dart` | Welcome screen with a "Let's Start" button |
| Navigation shell | `navigation_shell.dart` | Bottom navigation bar and the "+" button |
| Home | `Home_Screen.dart` | Greeting, today's progress, project cards and task groups |
| Calendar | `Calender_Screen.dart` | Date picker, filter tabs and the tasks of the day |
| Add Project | `Addproject_Screen.dart` | Form-style screen to add a new project |

All files are inside the `lib/` folder.

## Getting started

### Requirements

- [Flutter SDK](https://docs.flutter.dev/get-started/install)
- An emulator or a real device (or Chrome for web)

### Run the app

```bash
git clone <your-repository-url>
cd <project-folder>
flutter pub get
flutter run
```

## Project details

- **Package used:** `svg_flutter` (to show `.svg` icons)
- **Fonts used:** Lexend Deca, Poppins and a custom font named `hello`
- **Assets:** images and icons are in `assets/images` and `assets/Icons`

The fonts and assets must be listed in `pubspec.yaml`, otherwise the app will not find them.

## Known limitations

- No real data or database yet, everything on screen is hard-coded.
- "View Task", "Change Logo" and "Add Project" are only styled boxes and do nothing when tapped.
- The 3rd and 4th tabs in the bottom bar are empty placeholder screens.

## Screenshots

Add your screenshots here.

## Author

Your Name