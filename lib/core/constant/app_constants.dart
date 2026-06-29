class AppConstants {
  static const int shippingCost = 1000;
  static const int taxCost = 1000;
  static const String currency = 'AED';

  // Firestore Collections
  static const String usersCollection = 'users';
  static const String carsCollection = 'cars';

  // Storage Keys
  static const String storageKeyUid = 'uid';
  static const String storageKeyLogin = 'login';
  static const String storageKeyOnboarding = 'onboarding';
  static const String storageKeyName = 'name';
  static const String storageKeyOnboardingCompleted = 'onboarding_completed';
  static const String storageKeyRole = 'role';

  // Filter Defaults
  static const double minPrice = 0;
  static const double maxPrice = 1000000;
}
