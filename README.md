# CarAds 🚗
**A modern, robust Car E-commerce Mobile Application built with Flutter and Firebase.**

---

## 📖 Introduction
**CarAds** is a specialized e-commerce platform for buying and selling cars. It provides a seamless experience for users to browse listings, view detailed car specifications, and manage their advertisements. The app is designed with performance and scalability in mind.

## ✨ Key Features
- **User Authentication:** Secure Sign-up and Login using **Firebase Auth**.
- **Car Listings:** Explore a wide range of cars with high-quality images and descriptions.
- **Advanced Search:** Filter cars by model, price, and year.
- **Real-time Database:** All car data and user actions are synced instantly via **Cloud Firestore**.
- **State Management:** Uses **Provider** for clean and efficient state handling.
- **Media Upload:** Users can upload car photos directly to **Firebase Storage**.

## 🏗️ Architecture & Folder Structure
This project follows the **MVC (Model-View-Controller)** design pattern to ensure separation of concerns and maintainability.

```text
lib/
├── models/      # Data structures (e.g., CarModel, UserModel)
├── views/       # UI Screens and Widgets
├── controllers/ # Business logic and State handling
├── services/    # Firebase & API integration logic
└── main.dart    # Application entry point