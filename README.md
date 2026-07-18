# 🏎️ CarAds: Premium Automotive Marketplace

![CarAds Banner](https://via.placeholder.com/1000x400?text=CarAds+Automotive+Marketplace+Banner)

**CarAds** is a sophisticated, dual-role automotive marketplace engineered for both car e-commerce and professional rental services. Built with Flutter and a robust Firebase backend, the application delivers a high-performance, real-time ecosystem tailored for consumers and showroom owners alike.

---

## 🚀 Project Overview
CarAds bridges the gap between individual renters/buyers and professional car showrooms. By leveraging a scalable feature-first architecture and modern state management, it provides a zero-latency user experience with a focus on resource optimization and data integrity. It features a specialized dual-role system that dynamically configures the workspace based on whether the user is a consumer or a business owner.

---

## ✨ Features

### 💼 Business Features
*   **Dual Marketplace Engine**: Seamless switching between 'Buy' and 'Rent' flows. The UI dynamically adapts labels, pricing logic, and transaction flows.
*   **Intelligent Showroom Dashboards**: Specialized views for business owners to track inventory and real-time requests.
*   **Consumer Discovery**: High-fidelity car exploration with advanced client-side filtering and suggested ads.

### 🛠️ Technical Features
*   **Real-Time "Lazy Evaluation" Engine**: A custom-built engine utilizing a local `Timer.periodic` synchronized with Firestore Streams. It automatically completes expired rental requests in real-time, bypassing the need for expensive server-side Cloud Functions and optimizing Firebase quotas.
*   **Advanced Rental Orchestration**: 
    *   Custom Date and Time selectors with defensive UI bounds.
    *   Smart auto-duration calculation that categorizes rental periods based on selected timestamps.
*   **Unified Checkout Architecture**: A consolidated payment orchestration pipeline that handles diverse transaction types through a single, adaptive interface.
*   **Clean Architecture & UI/UX**: 
    *   Modular widget extraction for high maintainability.
    *   Consistent design system using custom `StickyBottomButton` components and standard `LoadingOverlay` for a premium feel.
*   **Optimized State Management**: Efficient data passing and real-time UI updates using the Provider pattern.

---

## 🛠️ Tech Stack & Architecture

-   **Framework**: [Flutter](https://flutter.dev) (Dart)
-   **State Management**: [Provider](https://pub.dev/packages/provider) (Strict UI-Logic separation)
-   **Backend**: [Firebase](https://firebase.google.com) (Authentication, Cloud Firestore, Firebase Storage)
-   **Architecture**: **Feature-First / Clean Architecture**. Organized into self-contained modules to ensure high scalability and separation of concerns.
---

## 📁 Folder Structure

The project follows a **Feature-First** approach to ensure that each module (like `auth`, `explore`, or `showroom`) is self-contained and easy to maintain.

```text
lib/
├── common/             # Reusable UI widgets (Buttons, Text-fields, Overlays)
├── core/               # Global services (Auth, Firestore), themes, and constants
├── features/           # Self-contained feature modules
│   ├── auth/           # Multi-role authentication & user models
│   ├── explore/        # Discovery engine & advanced filtering logic
│   ├── rental/         # Unified checkout & payment orchestration
│   ├── showroom/       # Dashboards, request management & "Lazy Evaluation" logic
│   └── history/        # Chronological order tracking
└── main.dart           # App entry point & Provider initialization
```

---

## ⚙️ Getting Started & Installation

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
4.  **Environment Setup**
    - Create a `.env` file in the root directory and configure necessary API keys.
5.  **Run the application**
    ```bash
    flutter run
    ```

---

## 👨‍💻 Author

**Fadi Abd ALJawwad**
*Mobile App Developer*

-   **GitHub**: [Fadi Abd ElJawwad](https://github.com/FadiAbdElJawwad)
-   **LinkedIn**: [Fadi Abd ALJawwad](https://www.linkedin.com/in/fadiabdaljawwad/)

---

