# CarAds 🚗
**A premium Car E-commerce Mobile Application built with Flutter, focusing on performance, security, and scalability.**

---

## 📖 Introduction
**CarAds** is a specialized platform for buying and selling cars. This version of the app is engineered using a **Feature-driven architecture**, ensuring high maintainability. It features secure local data persistence, real-time cloud synchronization, and full multi-language support.

## ✨ Key Features
- **User Authentication:** Secure Sign-up and Login using **Firebase Auth**.
- **Localization:** Full support for **Arabic 🇸🇦** and **English 🇺🇸** languages.
- **Secure Local Storage:** Sensitive data is stored locally using **Flutter Secure Storage** (implemented with the **Singleton Design Pattern**).
- **Real-time Database:** Car listings and user data are synced via **Cloud Firestore**.
- **State Management:** Efficient app state handling using **Provider**.
- **Reusable Components:** A dedicated `common` folder for modular and reusable UI widgets.

## 🏗️ Project Architecture (Folder by Feature)
The project follows a **Feature-based** structure to keep the code organized and modular:

```text
lib/
├── features/           # Each feature contains its own logic & UI
│   ├── auth/           # Login, Signup, Forgot Password
│   ├── car_listing/    # Home, Search, Filters
│   └── profile/        # User settings and ads
├── common/             # Reusable widgets (Buttons, TextFields, etc.)
├── core/               # App constants, themes, and design patterns
│   └── storage/        # Secure Storage Singleton implementation
├── services/           # Firebase & External API services
├── l10n/               # Localization files (intl_en.arb, intl_ar.arb)
└── main.dart           # App entry point