# Simple Todo List

A simple, clean To-Do list app built with Flutter as a learning project to practice state management, local persistence, and CRUD operations.

## Features

- ✅ Add, edit, delete, and mark tasks as done
- 💾 Local persistence — tasks are saved on-device and reload automatically when the app restarts
- 🎨 Cyan color accents on the app bar and floating action button (`Colors.cyan`)
- ✔️ Visual feedback for completed tasks (strikethrough + muted text color)
- 📭 Empty state message when the list has no tasks

## Tech Stack

- **Flutter** — UI framework
- **Provider** (`ChangeNotifier`) — state management
- **SharedPreferences** — local storage
- **dart:convert** (`jsonEncode` / `jsonDecode`) — task serialization

## Architecture

The app follows a simple layered structure:

```
lib/
├── models/       # TaskModel — task data structure (id, title, isDone)
├── providers/    # TaskProvider — app state and business logic
├── screens/      # App screens (task list)
├── widgets/      # Reusable UI components
└── services/     # LocalStorage — SharedPreferences read/write
```

- **TaskProvider** extends `ChangeNotifier` and exposes `addTask`, `deleteTask`, `toggleTaskDone`, and `editTask`. Every mutation persists the updated list immediately.
- **LocalStorage** handles encoding/decoding the task list to and from JSON for `SharedPreferences`.
- Task IDs are generated with `DateTime.now().millisecondsSinceEpoch.toString()` to stay unique across app restarts.

## Getting Started

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) installed
- A connected device or emulator

### Installation

```bash
git clone https://github.com/Ali-ElDalley/to_do_list.git
cd to_do_list
flutter pub get
flutter run
```

## What I Learned

This project was built to practice:

- Structuring a Flutter app beyond a single-file prototype
- Managing app-wide state with the Provider pattern
- Persisting data locally with SharedPreferences and JSON serialization
- Debugging state-driven UI issues (e.g. `context.watch` vs `context.read` and why a widget does or doesn't rebuild)

## Author

**Ali Ibrahim ElDalley**
Software Engineering Student, University of Benghazi
