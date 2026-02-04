# CarAds 🚗
**A premium Car E-commerce Mobile Application built with Flutter, focusing on performance, security, and scalability.**

---

## 📖 Introduction
**CarAds** is a specialized platform for buying and selling cars. This version of the app is engineered using a **Feature-driven architecture**, ensuring high maintainability and scalability. It features secure local storage, real-time database synchronization, and a seamless user experience with full localization support.

## ✨ Key Features
- **User Authentication:** Secure Sign-up, Login, and Password Reset using **Firebase Auth**.
- **Localization:** Full support for **Arabic 🇸🇦** and **English 🇺🇸** languages.
- **Secure Local Storage:** Sensitive data is stored locally using **Flutter Secure Storage** and **Shared Preferences**.
- **Real-time Database:** Car listings and user data are synced via **Cloud Firestore**.
- **State Management:** Efficient app state handling using **Provider**.
- **Navigation:** Centralized routing logic using `onGenerateRoute` and a dedicated Router Generator.
- **UI/UX:**
    - Native Splash Screen integration.
    - SVG asset support for high-quality icons.
    - Modal progress HUDs for asynchronous operations.

## 🏗️ Project Architecture
The project follows a **Feature-based** structure combined with **MVC** principles (Model-View-Logic) within each feature to keep the code organized and modular.

### Directory Structure
```text
lib/
├── common/             # Reusable widgets (Buttons, TextFields, etc.)
├── core/               # Core application logic and utilities
│   ├── constant/       # App-wide constants (Assets, Strings, Colors)
│   ├── extension/      # Dart extensions for cleaner code
│   ├── routes/         # Navigation setup (AppRouter, RouterGenerator)
│   ├── services/       # Global services (RedirectService, etc.)
│   └── themes/         # App theming and styling configuration
├── features/           # Feature-specific modules
│   ├── auth/           # Authentication (Login, Signup, Onboarding, Splash)
│   ├── home/           # Main application features
│   │   ├── logic/      # Business logic and State Management (Providers)
│   │   ├── model/      # Data models
│   │   └── view/       # UI Screens (Home, Details, Checkout) and Widgets
│   └── nav_button_bar/ # Main Navigation Bar implementation
├── generated/          # Auto-generated code (Localization delegates, etc.)
├── l10n/               # Localization resource files (intl_en.arb, intl_ar.arb)
└── main.dart           # App entry point