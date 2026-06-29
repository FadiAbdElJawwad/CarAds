# 🏎️ CarAds: Premium Automotive Marketplace

**A high-performance, multi-role car rental and marketplace mobile application built with Flutter and Firebase.**

[![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/dart-%230175C2.svg?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev)
[![Firebase](https://img.shields.io/badge/firebase-%23039BE5.svg?style=for-the-badge&logo=firebase)](https://firebase.google.com)
[![Architecture](https://img.shields.io/badge/Architecture-Feature--Based-orange.svg?style=for-the-badge)](https://pub.dev)

---

## 📖 Overview

**CarAds** is a sophisticated automotive marketplace designed to bridge the gap between individual renters and professional car showrooms. Engineered with a scalable **Feature-Based Architecture**, the application provides a specialized dual-role ecosystem that delivers a tailored experience for both consumers and business owners.

By leveraging a serverless orchestration layer and a robust Firebase backend, CarAds ensures real-time data synchronization, secure data persistence in the `checkout` collection, and a fluid, zero-latency user experience.

---

## ✨ Key Features

### 👥 Intelligent Multi-Role System
The app utilizes **Dynamic Root Navigation** to detect user roles at launch and dynamically configure the workspace:
- **Normal Users:** Streamlined car exploration, advanced filtering, and a robust checkout flow.
- **Showroom Owners:** High-fidelity business dashboard with profit analytics and real-time rent request management.

### 📊 Showroom Dashboard & Business Logic
A dedicated professional workspace for showroom owners:
- **Financial Tracking:** Dynamic "Profit Cards" for Sales and Rental revenue metrics.
- **Real-time Requests:** A live "Last 5 Rent Requests" feed allowing owners to view customer details, IDs, and licenses instantly.

### 🔎 Optimized Client-Side Filtering
The exploration module implements a high-performance **Client-Side Filtering** strategy:
- **Zero-Latency Search:** Instant brand filtering and text-based search queries processed in memory.
- **Index Independence:** Bypasses Firestore composite index limitations, ensuring the app remains robust and fast even with complex filter combinations.

### 💳 Robust Data Persistence (`checkout` collection)
A comprehensive booking system that ensures high data integrity:
- **Comprehensive Capture:** Securely syncs National IDs, Driver's Licenses, and contact metadata during the checkout process.
- **Digital Receipts:** Instant access to read-only rental receipts populated directly from the `checkout` collection.

---

## 🏗️ Architecture

CarAds follows a strict **Feature-Based Architecture**, promoting high modularity and clean separation of concerns.

```text
lib/
├── core/               # Global services (Auth, Firestore), themes, and constants
├── common/             # Atomic, reusable UI widgets (Buttons, Text-fields, Skeletons)
├── features/           # Self-contained modules
│   ├── auth/           # Multi-role authentication & user models
│   ├── explore/        # Search engine, local filtering logic, and car discovery
│   ├── rental/         # Booking logic, data persistence, and receipt generation
│   ├── history/        # Chronological order tracking for users
│   ├── showroom/       # Showroom dashboards, requests, and verification wizard
│   └── notifications/  # Real-time alert management
└── main.dart           # App entry point & Provider state initialization
```

### 🧠 Single Source of Truth (SSOT)
The application adheres to the **SSOT** principle by centralizing data fetching into specialized Providers. This ensures that every screen (Home, Explore, Search) displays consistent data and minimizes redundant network calls.

---

## 🛠️ Tech Stack

- **Framework:** [Flutter](https://flutter.dev) & [Dart](https://dart.dev)
- **State Management:** [Provider](https://pub.dev/packages/provider)
- **Backend:** Firebase (Authentication, Cloud Firestore, Cloud Messaging)
- **Microservices:** Google Apps Script (GAS) for FCM v1 relay and Drive Image hosting.
- **Storage:** Flutter Secure Storage (Sensitive data) & Shared Preferences.

---

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (`stable` channel)
- A Firebase project with Firestore and Auth enabled.
- Google Apps Script deployment URL configured in `ApiConstants`.

### Installation

1. **Clone the repository:**
   ```bash
   git clone https://github.com/fadi-abd-el-jawwad/car_ads.git
   cd car_ads
   ```

2. **Install dependencies:**
   ```bash
   flutter pub get
   ```

3. **Firebase Configuration:**
   - Place your `google-services.json` (Android) and `GoogleService-Info.plist` (iOS) in their respective directories.

4. **Run the application:**
   ```bash
   flutter run
   ```

---

## ✍️ Author

**Fadi Abd ElJawwad**  
* Flutter Software Architect*

- **GitHub:** [Fadi Abd ElJawwad](https://github.com/FadiAbdElJawwad)
- **Role:**  Developer

