# 🚀 Flutter Boilerplate Project

---

## 📁 Project Structure

```
lib/
🔺 core/                  # Core setup: themes, base classes, global widgets
│    🔺 constants/        # App-wide constants (e.g., colors, dimension, env etc)
│    🔺 controllers/      # App-wide controllers (e.g., cBase, CNotification, CTheme etc)
│    🔺 extensions/       # Dart/Flutter extensions (e.g., StringExt, WidgetExt)
│    🔺 services/         # Global services (e.g., Dio, Navigation,Local Storage)
│    🔺 functions/        # Global functions (e.g., callBack, snackbar, url launcher)
│    🔺 widgets/          # Feature-specific reusable UI components
🔺 features/              # Feature-first folder structure (modular, scalable)
│   └ example/            # Example feature module
│       🔺 views/         # UI screens (pages)
│       🔺 controllers/   # Business logic layer (extends CBase)
│       🔺 data/          # Data layer (API integration, models, repositories,data source)
🔺 main.dart              # App entry point (sets up root widget, routes, bindings)
```

---

## 🚱 Key Components

### ✅ Widgets

* `WContainer` – Custom container with padding, background, radius, etc.
  *File: `core/widgets/w_container.dart`*

* `WPrimaryButton` – Common button with state handling (loading/disabled)
  *File: `core/widgets/w_primary_button.dart`*

* `WImage` – Smart image loader with fallback, shape and caching
  *File: `core/widgets/w_image.dart`*


  ### ✅ Screens

* `SProfile` – All Screens names are writen with S as prefix e.g.,- SProfile represents Profile Screen


###  🛠️ Functions
* showSnackBar() – Quick global feedback method.
  *File: `core/functions/f_snackbar.dart`* 

* OpenURLs, showLoader() – Unified modal functions.


### ✅ Controllers

* `CBase` – Base class for all feature controllers
  *File: `core/controllers/c_base.dart`*

### ✅ Extensions

* `PaddingExtension`, `GapYExtension`, `GapXExtension` – Clean syntax for spacing in UI
  \*File: `util/extensions/`

* `StringExt` – Handy helpers like `.toCapitalized()`
  *File: `util/extensions/ex_string_ext.dart`*

### ✅ Services

* `SharedPrefService` – Handles shared preferences
* `NavigationService` – Global navigation with `navigatorKey`
* `DioService` – API base setup with custom headers, interceptors


---

## ⚙️ Getting Started

### 1. Prerequisites

Make sure you have Flutter and related tools installed:

```bash
flutter doctor -v
```

**Example Output Of Current Env:**

```
[✓] Flutter (Channel stable, 3.35.6, on macOS 26.1 25B78
    darwin-arm64, locale en-US)
[✓] Android toolchain - develop for Android devices (Android SDK
    version 36.0.0)
[✓] Xcode - develop for iOS and macOS (Xcode 26.0.1)
[✓] Android Studio (version 2025.1)
```

---

### 2. Install dependencies

```bash
flutter pub get
```

### 3. Run the app

```bash
flutter run
```

---

## ✨ Author

Made with ❤️ by **Romjan Ali**
Inspired by **Jahangir Alam**
