# CarAds 🚗 
**A high-performance, secure, and scalable Car E-Commerce solution built with Flutter.**

---

## 📖 Introduction
**CarAds** is a premium automotive marketplace designed to provide a seamless car buying and selling experience. Engineered with a **Feature-Driven Architecture** and **MVC design principles**, the application ensures high maintainability and industrial-grade scalability. 

By integrating a robust backend powered by **Firebase** and a custom **Google Apps Script (GAS)** bridge for image management and push notifications, CarAds delivers real-time data synchronization, enterprise-level security, and a fluid user experience with full native localization support.

## ✨ Key Features
- **User Authentication:** Secure Sign-up, Login, and Password Reset using **Firebase Auth**.
- **Dual-Action Notifications:** 
    - **Firestore Integration:** Real-time in-app notifications stored and synced via Cloud Firestore.
    - **FCM Push Notifications:** System-level alerts triggered via a custom Google Apps Script bridge.
    - **Head-up Alerts:** High-importance foreground notifications using `flutter_local_notifications`.
    - **Event-based triggers:** Auth, Transactions (Rental/Posting), and Security updates.
- **Secure Account Management:** 
    - **Phone Change with OTP**: Secure update of mobile numbers using Firebase Phone Auth.
    - **FCM Token Syncing**: Automatic device token registration in Firestore for targeted push delivery.
    - **Profile Image Sync**: Upload and persistent storage of profile pictures via Google Drive (GAS) and Firestore.
- **Localization:** Full support for **Arabic 🇸🇦** and **English 🇺🇸**.
- **Secure Local Storage:** Sensitive data protected using **Flutter Secure Storage** and **Shared Preferences**.
- **Real-time Database:** Car listings and user data synced via **Cloud Firestore**.
- **State Management:** Efficient app state handling using **Provider**.
- **Navigation:** Centralized routing logic using `onGenerateRoute` and a global Navigator key.
- **UI/UX:**
    - Structured logging via **AppLogger**.
    - Centralized UI constants and responsive sizing extensions.
    - Native Splash Screen and SVG support.

## 🏗️ Project Architecture
The project follows a **Feature-based** structure combined with **MVC** principles (Model-View-Logic) within each feature to keep the code organized and modular.

### Core Services
- **AppLogger**: Centralized logging for debug and production environments.
- **NotificationService**: Manages the dual-action alert system (In-app + FCM Push).
- **FcmSenderService**: Relays notification requests to the Google Apps Script web app.
- **CarFirestoreService**: Handles vehicle data and image hosting via the GAS Drive bridge.
- **RedirectService**: Unified logic for app startup and user redirection flow.

### Directory Structure
```text
lib/
├── common/             # Reusable atomic widgets (Buttons, AppBars, Skeletons)
├── core/               # Core application logic and utilities
│   ├── constant/       # App-wide constants (GAS URLs, Collections, Colors)
│   ├── extension/      # Dart extensions for sizing, styling, and validation
│   ├── models/         # Global data models (User, Car, Order, Notification)
│   ├── routes/         # Navigation setup (AppRouter, RouteGenerator)
│   ├── services/       # Global services (FCM, Location, Firestore, URL)
│   └── themes/         # App theming configuration
├── features/           # Feature-specific modules
│   ├── auth/           # Login, Signup, Onboarding, Password Reset
│   ├── home/           # Dashboard, Maps, and Showroom discovery
│   ├── explore/        # Vehicle discovery and advanced filtering
│   ├── add_ads/        # UI for posting car advertisements
│   ├── rental/         # Checkout flow and rental confirmation
│   ├── history/        # User-specific transaction records
│   ├── notifications/  # In-app notification management
│   ├── profile/        # User profile and security settings
│   └── nav_button_bar/ # Main persistent navigation implementation
└── main.dart           # App entry point and provider initialization
```

## 🛠️ Tech Stack
- **Framework:** Flutter
- **Backend:** Firebase (Auth, Firestore, Messaging)
- **Bridge Service:** Google Apps Script (FCM Relay & Drive Hosting)
- **State Management:** Provider
- **Local Notifications:** Flutter Local Notifications Plugin
- **Image Handling:** CachedNetworkImage + Custom GAS Drive Extractor
- **Security:** Flutter Secure Storage, OTP Verification

---

## 🚀 Getting Started
1. Ensure Flutter is installed (`flutter doctor`).
2. Clone the repository.
3. Run `flutter pub get` to install dependencies.
4. Configure `firebase_options.dart` for your Firebase project.
5. Update the GAS Deployment URL in `AppConstants` if necessary.
6. Run `flutter run`.
```