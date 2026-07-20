# 🏎️ CarAds: Premium Automotive Marketplace

[![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)](https://flutter.dev)
[![Firebase](https://img.shields.io/badge/firebase-%23039BE5.svg?style=for-the-badge&logo=firebase)](https://firebase.google.com)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=for-the-badge)](https://opensource.org/licenses/MIT)

**CarAds** is a sophisticated, dual-role automotive marketplace engineered for both car e-commerce and professional rental services. Built with Flutter and a robust Firebase backend, the application delivers a high-performance, real-time ecosystem tailored for consumers and showroom owners alike.

---

## 🚀 Project Overview
CarAds bridges the gap between individual renters/buyers and professional car showrooms. By leveraging a scalable modular architecture and modern state management, it provides a zero-latency user experience with a focus on resource optimization and data integrity.

---

## ✨ Key Features

### 💼 Business & Consumer Flows
*   **Dual Marketplace Engine**: Seamless switching between 'Buy' and 'Rent' flows. The UI dynamically adapts labels, pricing logic, and transaction flows.
*   **Intelligent Showroom Dashboards**: Specialized views for business owners to track inventory, revenue metrics, and real-time requests.
*   **Consumer Discovery**: High-fidelity car exploration with advanced client-side filtering and suggested ads.

### 🛠️ Technical Innovations
*   **Real-Time "Lazy Evaluation" Engine**: A custom-built engine utilizing a local `Timer.periodic` synchronized with Firestore. It automatically completes expired rental requests in real-time, optimizing Firebase quotas.
*   **Optimized Map & Location Flow**: The Google Maps SDK was completely removed to optimize performance and eliminate API key dependencies. The app uses a static map placeholder with proactive background location fetching via `Geolocator` and `Geocoding` for a privacy-first, zero-latency experience.
*   **Full Localization**: Complete support for **Arabic** and **English** using `.arb` files and `flutter_localizations`. All fallback and sync issues are resolved for a native experience in both languages.
*   **Unified Checkout Architecture**: A consolidated payment orchestration pipeline that handles diverse transaction types (Rent/Buy) through a single, adaptive interface.

---

## 🏗️ Architecture & Tech Stack

-   **Framework**: [Flutter](https://flutter.dev) (Dart)
-   **State Management**: [Provider](https://pub.dev/packages/provider) (Strict UI-Logic separation)
-   **Backend**: [Firebase](https://firebase.google.com) (Authentication, Cloud Firestore, Firebase Storage)
-   **Architecture**: **Clean Architecture** combined with a **Feature-by-Feature** folder structure. This ensuring high scalability, testability, and clear separation of concerns.

---

## 📁 Project Structure

The project is organized into self-contained modules to ensure that each feature (like `auth`, `explore`, or `showroom`) is modular and maintainable.

```text
lib/
├── common/             # Reusable UI components & global utilities
├── core/               # Global services (Auth, Firestore), themes, and constants
├── features/           # Modular feature domains
│   ├── auth/           # Multi-role authentication & user models
│   ├── explore/        # Discovery engine & advanced filtering
│   ├── rental/         # Unified checkout, map logic & payment orchestration
│   ├── showroom/       # Dashboards & "Lazy Evaluation" request logic
│   └── history/        # Chronological order & transaction tracking
├── l10n/               # Localization resources (.arb files)
└── main.dart           # App entry point
```

---

## ⚙️ Setup & Installation

### Prerequisites
- Flutter SDK (Latest Stable)
- Android Studio / VS Code
- A configured Firebase Project

### Installation Steps

1.  **Clone the repository**
    ```bash
    git clone https://github.com/FadiAbdElJawwad/car_ads.git
    cd car_ads
    ```
2.  **Install dependencies**
    ```bash
    flutter pub get
    ```
3.  **Firebase Configuration**
    - Place your `google-services.json` (Android) and `GoogleService-Info.plist` (iOS) in their respective directories.
4.  **Run the application**
    ```bash
    flutter run
    ```

---

## 👨‍💻 Author

**Fadi Abd ALJawwad**
*Flutter Developer*

-   **GitHub**: [Fadi Abd ElJawwad](https://github.com/FadiAbdElJawwad)
-   **LinkedIn**: [Fadi Abd ALJawwad](https://www.linkedin.com/in/fadiabdaljawwad/)

---
