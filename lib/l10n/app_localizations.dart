import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of S
/// returned by `S.of(context)`.
///
/// Applications need to include `S.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: S.localizationsDelegates,
///   supportedLocales: S.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the S.supportedLocales
/// property.
abstract class S {
  S(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static S? of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  static const LocalizationsDelegate<S> delegate = _SDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// No description provided for @pageHomeConfirm.
  ///
  /// In en, this message translates to:
  /// **'Page home confirm'**
  String get pageHomeConfirm;

  /// No description provided for @splashTitle.
  ///
  /// In en, this message translates to:
  /// **'Welcome to CarAds App'**
  String get splashTitle;

  /// No description provided for @splashBody.
  ///
  /// In en, this message translates to:
  /// **'Your Gateway to Car Showrooms and Rental Offices'**
  String get splashBody;

  /// No description provided for @onbordingModelTitle1.
  ///
  /// In en, this message translates to:
  /// **'Welcome to CarAds App'**
  String get onbordingModelTitle1;

  /// No description provided for @onbordingModelBody1.
  ///
  /// In en, this message translates to:
  /// **'CarAds is your ultimate destination for car showrooms and rental offices advertising. Whether you\'re a car showroom owner or looking to rent a vehicle, our platform has got you covered!'**
  String get onbordingModelBody1;

  /// No description provided for @onbordingModelTitle2.
  ///
  /// In en, this message translates to:
  /// **'Effortless Ads Management'**
  String get onbordingModelTitle2;

  /// No description provided for @onbordingModelBody2.
  ///
  /// In en, this message translates to:
  /// **'Are you a car showroom or rental office owner? Create your special account now! Easily manage and promote your ads within a few taps. Reach a broader audience, receive inquiries with CarAds'**
  String get onbordingModelBody2;

  /// No description provided for @onbordingModelTitle3.
  ///
  /// In en, this message translates to:
  /// **'Explore Your Options'**
  String get onbordingModelTitle3;

  /// No description provided for @onbordingModelBody3.
  ///
  /// In en, this message translates to:
  /// **'Discover a wide range of car advertisements tailored to your preferences. Browse through various car models, rental offers, and exclusive deals from local showrooms. With CarAds'**
  String get onbordingModelBody3;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @skip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skip;

  /// No description provided for @userJoin.
  ///
  /// In en, this message translates to:
  /// **'Join Now As A User'**
  String get userJoin;

  /// No description provided for @showroomsJoin.
  ///
  /// In en, this message translates to:
  /// **'Join Now As A Showrooms'**
  String get showroomsJoin;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @loginTitle.
  ///
  /// In en, this message translates to:
  /// **'Welcome Back to CarAds!'**
  String get loginTitle;

  /// No description provided for @loginBody.
  ///
  /// In en, this message translates to:
  /// **'Sign in to your account and get back on track with CarAds'**
  String get loginBody;

  /// No description provided for @dontHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get dontHaveAccount;

  /// No description provided for @signUp.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get signUp;

  /// No description provided for @signUpTitle.
  ///
  /// In en, this message translates to:
  /// **'Join CarAds Today!'**
  String get signUpTitle;

  /// No description provided for @signUpBody.
  ///
  /// In en, this message translates to:
  /// **'Create your account and become a part of CarAds community\'s'**
  String get signUpBody;

  /// No description provided for @alreadyHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get alreadyHaveAccount;

  /// No description provided for @forgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot Your Password?'**
  String get forgotPassword;

  /// No description provided for @forgotPasswordBody.
  ///
  /// In en, this message translates to:
  /// **'No worries! We\'ll help you reset your password. Just enter your registered Phone Number, and we\'ll send you a code to reset your password.'**
  String get forgotPasswordBody;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email Address'**
  String get email;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get name;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @invalidCredential.
  ///
  /// In en, this message translates to:
  /// **'Invalid email or password.'**
  String get invalidCredential;

  /// No description provided for @invalidEmail.
  ///
  /// In en, this message translates to:
  /// **'Invalid email.'**
  String get invalidEmail;

  /// No description provided for @authenticationError.
  ///
  /// In en, this message translates to:
  /// **'Authentication error'**
  String get authenticationError;

  /// No description provided for @weakPassword.
  ///
  /// In en, this message translates to:
  /// **'The password provided is too weak.'**
  String get weakPassword;

  /// No description provided for @usedEmail.
  ///
  /// In en, this message translates to:
  /// **'The account already exists for that email.'**
  String get usedEmail;

  /// No description provided for @userNotAuthenticated.
  ///
  /// In en, this message translates to:
  /// **'User not authenticated'**
  String get userNotAuthenticated;

  /// No description provided for @updateEmailLoginRequired.
  ///
  /// In en, this message translates to:
  /// **'User must be logged in to update email.'**
  String get updateEmailLoginRequired;

  /// No description provided for @incorrectCurrentPassword.
  ///
  /// In en, this message translates to:
  /// **'The current password you entered is incorrect.'**
  String get incorrectCurrentPassword;

  /// No description provided for @welcomeTitle.
  ///
  /// In en, this message translates to:
  /// **'Welcome !'**
  String get welcomeTitle;

  /// No description provided for @accountCreatedSuccess.
  ///
  /// In en, this message translates to:
  /// **'You have create account successfully.'**
  String get accountCreatedSuccess;

  /// No description provided for @welcomeBackTitle.
  ///
  /// In en, this message translates to:
  /// **'Welcome Back!'**
  String get welcomeBackTitle;

  /// No description provided for @loggedInSuccess.
  ///
  /// In en, this message translates to:
  /// **'You have logged in successfully.'**
  String get loggedInSuccess;

  /// No description provided for @userRole.
  ///
  /// In en, this message translates to:
  /// **'User'**
  String get userRole;

  /// No description provided for @showroomRole.
  ///
  /// In en, this message translates to:
  /// **'Showroom'**
  String get showroomRole;

  /// No description provided for @licenseNumberEmptyError.
  ///
  /// In en, this message translates to:
  /// **'Please enter license number'**
  String get licenseNumberEmptyError;

  /// No description provided for @commercialLicenseNumberHint.
  ///
  /// In en, this message translates to:
  /// **'Commercial License Number'**
  String get commercialLicenseNumberHint;

  /// No description provided for @addressEmptyError.
  ///
  /// In en, this message translates to:
  /// **'Please enter address'**
  String get addressEmptyError;

  /// No description provided for @showroomAddressHint.
  ///
  /// In en, this message translates to:
  /// **'Showroom Address'**
  String get showroomAddressHint;

  /// No description provided for @passwordResetEmailSent.
  ///
  /// In en, this message translates to:
  /// **'Password reset email sent successfully!'**
  String get passwordResetEmailSent;

  /// No description provided for @send.
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get send;

  /// No description provided for @somethingWentWrong.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong'**
  String get somethingWentWrong;

  /// No description provided for @phoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phoneNumber;

  /// No description provided for @verification.
  ///
  /// In en, this message translates to:
  /// **'Verification'**
  String get verification;

  /// No description provided for @verificationPrompt.
  ///
  /// In en, this message translates to:
  /// **'To use our services , we need to verify :'**
  String get verificationPrompt;

  /// No description provided for @phoneNumberRequired.
  ///
  /// In en, this message translates to:
  /// **'Phone Number *'**
  String get phoneNumberRequired;

  /// No description provided for @commercialLicenseRequired.
  ///
  /// In en, this message translates to:
  /// **'Commercial license*'**
  String get commercialLicenseRequired;

  /// No description provided for @notAvailable.
  ///
  /// In en, this message translates to:
  /// **'N/A'**
  String get notAvailable;

  /// No description provided for @goToHome.
  ///
  /// In en, this message translates to:
  /// **'Go to Home'**
  String get goToHome;

  /// No description provided for @completeVerification.
  ///
  /// In en, this message translates to:
  /// **'Complete Verification'**
  String get completeVerification;

  /// No description provided for @verified.
  ///
  /// In en, this message translates to:
  /// **'Verified'**
  String get verified;

  /// No description provided for @verify.
  ///
  /// In en, this message translates to:
  /// **'Verify'**
  String get verify;

  /// No description provided for @emptyName.
  ///
  /// In en, this message translates to:
  /// **'Please Enter Your Name'**
  String get emptyName;

  /// No description provided for @emptyMobile.
  ///
  /// In en, this message translates to:
  /// **'Please Enter Your Mobile Number'**
  String get emptyMobile;

  /// No description provided for @emptyEmail.
  ///
  /// In en, this message translates to:
  /// **'Please Enter Your Email Address'**
  String get emptyEmail;

  /// No description provided for @incorrectEmail.
  ///
  /// In en, this message translates to:
  /// **'Please Enter A Valid Email Address'**
  String get incorrectEmail;

  /// No description provided for @emptyPassword.
  ///
  /// In en, this message translates to:
  /// **'Please Enter Your Password'**
  String get emptyPassword;

  /// No description provided for @incorrectPassword.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 6 characters long'**
  String get incorrectPassword;

  /// No description provided for @fieldCannotBeEmpty.
  ///
  /// In en, this message translates to:
  /// **'{fieldName} cannot be empty'**
  String fieldCannotBeEmpty(Object fieldName);

  /// No description provided for @drivingLicenseEmpty.
  ///
  /// In en, this message translates to:
  /// **'Driving License No cannot be empty'**
  String get drivingLicenseEmpty;

  /// No description provided for @drivingLicenseMustBeNumber.
  ///
  /// In en, this message translates to:
  /// **'Driving License No must be a number'**
  String get drivingLicenseMustBeNumber;

  /// No description provided for @drivingLicenseTooLong.
  ///
  /// In en, this message translates to:
  /// **'Driving License No must be less than 10 digits'**
  String get drivingLicenseTooLong;

  /// No description provided for @idNumberEmpty.
  ///
  /// In en, this message translates to:
  /// **'ID Number cannot be empty'**
  String get idNumberEmpty;

  /// No description provided for @idNumberMustBeNumber.
  ///
  /// In en, this message translates to:
  /// **'ID Number must be a number'**
  String get idNumberMustBeNumber;

  /// No description provided for @idNumberTooLong.
  ///
  /// In en, this message translates to:
  /// **'ID Number must be less than 9 digits'**
  String get idNumberTooLong;

  /// No description provided for @mobileStartWithCountryCode.
  ///
  /// In en, this message translates to:
  /// **'Phone number must start with a country code (e.g. +971)'**
  String get mobileStartWithCountryCode;

  /// No description provided for @invalidMobile.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid phone number'**
  String get invalidMobile;

  /// No description provided for @passwordSameAsCurrent.
  ///
  /// In en, this message translates to:
  /// **'New password cannot be the same as current'**
  String get passwordSameAsCurrent;

  /// No description provided for @passwordsDoNotMatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get passwordsDoNotMatch;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @explore.
  ///
  /// In en, this message translates to:
  /// **'Explore'**
  String get explore;

  /// No description provided for @add.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get add;

  /// No description provided for @history.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get history;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @locationServicesDisabled.
  ///
  /// In en, this message translates to:
  /// **'Location services are disabled.'**
  String get locationServicesDisabled;

  /// No description provided for @locationPermissionsDenied.
  ///
  /// In en, this message translates to:
  /// **'Location permissions are denied'**
  String get locationPermissionsDenied;

  /// No description provided for @locationPermissionsPermanentlyDenied.
  ///
  /// In en, this message translates to:
  /// **'Location permissions are permanently denied, we cannot request permissions.'**
  String get locationPermissionsPermanentlyDenied;

  /// No description provided for @unknownLocation.
  ///
  /// In en, this message translates to:
  /// **'Unknown Location'**
  String get unknownLocation;

  /// No description provided for @notificationChannelName.
  ///
  /// In en, this message translates to:
  /// **'High Importance Notifications'**
  String get notificationChannelName;

  /// No description provided for @notificationChannelDescription.
  ///
  /// In en, this message translates to:
  /// **'This channel is used for important notifications.'**
  String get notificationChannelDescription;

  /// No description provided for @urlLaunchError.
  ///
  /// In en, this message translates to:
  /// **'Could not launch app. Is it installed?'**
  String get urlLaunchError;

  /// No description provided for @commercial.
  ///
  /// In en, this message translates to:
  /// **'Commercial'**
  String get commercial;

  /// No description provided for @selectVehicleImageError.
  ///
  /// In en, this message translates to:
  /// **'Please select a vehicle image'**
  String get selectVehicleImageError;

  /// No description provided for @uploadImageError.
  ///
  /// In en, this message translates to:
  /// **'Failed to upload image to Drive'**
  String get uploadImageError;

  /// No description provided for @showroomDefaultName.
  ///
  /// In en, this message translates to:
  /// **'Showroom'**
  String get showroomDefaultName;

  /// No description provided for @individualSellerLabel.
  ///
  /// In en, this message translates to:
  /// **'Individual Seller'**
  String get individualSellerLabel;

  /// No description provided for @adUpdatedTitle.
  ///
  /// In en, this message translates to:
  /// **'Advertisement Updated'**
  String get adUpdatedTitle;

  /// No description provided for @adPostedTitle.
  ///
  /// In en, this message translates to:
  /// **'Advertisement Posted'**
  String get adPostedTitle;

  /// No description provided for @adUpdatedBody.
  ///
  /// In en, this message translates to:
  /// **'Your car advertisement for {brand} has been successfully updated.'**
  String adUpdatedBody(Object brand);

  /// No description provided for @adPostedBody.
  ///
  /// In en, this message translates to:
  /// **'Your car advertisement for {brand} has been successfully posted.'**
  String adPostedBody(Object brand);

  /// No description provided for @selectAdTypePrompt.
  ///
  /// In en, this message translates to:
  /// **'Please select the advertising type'**
  String get selectAdTypePrompt;

  /// No description provided for @commercialAdLabel.
  ///
  /// In en, this message translates to:
  /// **'Commercial ad'**
  String get commercialAdLabel;

  /// No description provided for @featured.
  ///
  /// In en, this message translates to:
  /// **'Featured'**
  String get featured;

  /// No description provided for @featuredAdLabel.
  ///
  /// In en, this message translates to:
  /// **'Featured ad'**
  String get featuredAdLabel;

  /// No description provided for @featuredAdDescription.
  ///
  /// In en, this message translates to:
  /// **'Featured advertising enables you to connect with the widest range of users.'**
  String get featuredAdDescription;

  /// No description provided for @carInformation.
  ///
  /// In en, this message translates to:
  /// **'Car Information'**
  String get carInformation;

  /// No description provided for @carBrandHint.
  ///
  /// In en, this message translates to:
  /// **'Car Brand'**
  String get carBrandHint;

  /// No description provided for @carModelHint.
  ///
  /// In en, this message translates to:
  /// **'Car Model'**
  String get carModelHint;

  /// No description provided for @year.
  ///
  /// In en, this message translates to:
  /// **'Year'**
  String get year;

  /// No description provided for @condition.
  ///
  /// In en, this message translates to:
  /// **'Condition'**
  String get condition;

  /// No description provided for @tankSize.
  ///
  /// In en, this message translates to:
  /// **'Tank Size'**
  String get tankSize;

  /// No description provided for @gearBox.
  ///
  /// In en, this message translates to:
  /// **'Gear box'**
  String get gearBox;

  /// No description provided for @seats.
  ///
  /// In en, this message translates to:
  /// **'Seats'**
  String get seats;

  /// No description provided for @doors.
  ///
  /// In en, this message translates to:
  /// **'Doors'**
  String get doors;

  /// No description provided for @mileage.
  ///
  /// In en, this message translates to:
  /// **'Mileage'**
  String get mileage;

  /// No description provided for @brandLabel.
  ///
  /// In en, this message translates to:
  /// **'Brand'**
  String get brandLabel;

  /// No description provided for @modelLabel.
  ///
  /// In en, this message translates to:
  /// **'Model'**
  String get modelLabel;

  /// No description provided for @contactInformation.
  ///
  /// In en, this message translates to:
  /// **'Contact Information:'**
  String get contactInformation;

  /// No description provided for @nameHint.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get nameHint;

  /// No description provided for @phoneNumberHint.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phoneNumberHint;

  /// No description provided for @description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get description;

  /// No description provided for @descriptionHint.
  ///
  /// In en, this message translates to:
  /// **'Provide a brief description of your car'**
  String get descriptionHint;

  /// No description provided for @uploadPhotos.
  ///
  /// In en, this message translates to:
  /// **'Upload Photos'**
  String get uploadPhotos;

  /// No description provided for @uploadPhotosDescription.
  ///
  /// In en, this message translates to:
  /// **'Add high-quality photos to showcase your car'**
  String get uploadPhotosDescription;

  /// No description provided for @saveChanges.
  ///
  /// In en, this message translates to:
  /// **'SAVE CHANGES'**
  String get saveChanges;

  /// No description provided for @postAd.
  ///
  /// In en, this message translates to:
  /// **'POST ADVERTISEMENT'**
  String get postAd;

  /// No description provided for @selectAdPurposePrompt.
  ///
  /// In en, this message translates to:
  /// **'Please select the advertising purpose'**
  String get selectAdPurposePrompt;

  /// No description provided for @carForSale.
  ///
  /// In en, this message translates to:
  /// **'Car for sale'**
  String get carForSale;

  /// No description provided for @carForRent.
  ///
  /// In en, this message translates to:
  /// **'Car for rent'**
  String get carForRent;

  /// No description provided for @rentalDuration.
  ///
  /// In en, this message translates to:
  /// **'Rental Duration'**
  String get rentalDuration;

  /// No description provided for @days.
  ///
  /// In en, this message translates to:
  /// **'Days'**
  String get days;

  /// No description provided for @weeks.
  ///
  /// In en, this message translates to:
  /// **'Weeks'**
  String get weeks;

  /// No description provided for @months.
  ///
  /// In en, this message translates to:
  /// **'Months'**
  String get months;

  /// No description provided for @availableFrom.
  ///
  /// In en, this message translates to:
  /// **'Available From'**
  String get availableFrom;

  /// No description provided for @availableUntil.
  ///
  /// In en, this message translates to:
  /// **'Available Until'**
  String get availableUntil;

  /// No description provided for @fillRentalDatesError.
  ///
  /// In en, this message translates to:
  /// **'Please fill all rental dates and times'**
  String get fillRentalDatesError;

  /// No description provided for @adUpdatedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Advertisement updated successfully!'**
  String get adUpdatedSuccess;

  /// No description provided for @adPostedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Advertisement posted successfully!'**
  String get adPostedSuccess;

  /// No description provided for @editAdTitle.
  ///
  /// In en, this message translates to:
  /// **'Edit Your Advertisement'**
  String get editAdTitle;

  /// No description provided for @postAdTitle.
  ///
  /// In en, this message translates to:
  /// **'Post Your Advertisement'**
  String get postAdTitle;

  /// No description provided for @addPriceHint.
  ///
  /// In en, this message translates to:
  /// **'Add Price'**
  String get addPriceHint;

  /// No description provided for @priceEmptyError.
  ///
  /// In en, this message translates to:
  /// **'Price cannot be empty'**
  String get priceEmptyError;

  /// No description provided for @price.
  ///
  /// In en, this message translates to:
  /// **'Price'**
  String get price;

  /// No description provided for @noSuggestedAds.
  ///
  /// In en, this message translates to:
  /// **'No suggested ads available for this car.'**
  String get noSuggestedAds;

  /// No description provided for @allCars.
  ///
  /// In en, this message translates to:
  /// **'All Cars'**
  String get allCars;

  /// No description provided for @all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// No description provided for @loadCarsFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to load cars: {error}'**
  String loadCarsFailed(Object error);

  /// No description provided for @allCategories.
  ///
  /// In en, this message translates to:
  /// **'All Categories'**
  String get allCategories;

  /// No description provided for @brands.
  ///
  /// In en, this message translates to:
  /// **'Brands'**
  String get brands;

  /// No description provided for @toyota.
  ///
  /// In en, this message translates to:
  /// **'Toyota'**
  String get toyota;

  /// No description provided for @audi.
  ///
  /// In en, this message translates to:
  /// **'Audi'**
  String get audi;

  /// No description provided for @hyundai.
  ///
  /// In en, this message translates to:
  /// **'Hyundai'**
  String get hyundai;

  /// No description provided for @mazda.
  ///
  /// In en, this message translates to:
  /// **'Mazda'**
  String get mazda;

  /// No description provided for @noName.
  ///
  /// In en, this message translates to:
  /// **'No Name'**
  String get noName;

  /// No description provided for @thousandSuffix.
  ///
  /// In en, this message translates to:
  /// **'K'**
  String get thousandSuffix;

  /// No description provided for @aedPerDay.
  ///
  /// In en, this message translates to:
  /// **'AED/Day'**
  String get aedPerDay;

  /// No description provided for @aed.
  ///
  /// In en, this message translates to:
  /// **'AED'**
  String get aed;

  /// No description provided for @noAdsMatchingFilters.
  ///
  /// In en, this message translates to:
  /// **'No ads matching your filters'**
  String get noAdsMatchingFilters;

  /// No description provided for @resultsFor.
  ///
  /// In en, this message translates to:
  /// **'Results for \"{query}\"'**
  String resultsFor(Object query);

  /// No description provided for @itemsFound.
  ///
  /// In en, this message translates to:
  /// **'{count} found'**
  String itemsFound(Object count);

  /// No description provided for @recentSearchesTitle.
  ///
  /// In en, this message translates to:
  /// **'Recent'**
  String get recentSearchesTitle;

  /// No description provided for @clearAll.
  ///
  /// In en, this message translates to:
  /// **'Clear All'**
  String get clearAll;

  /// No description provided for @startSearchHint.
  ///
  /// In en, this message translates to:
  /// **'Start your search ...'**
  String get startSearchHint;

  /// No description provided for @apply.
  ///
  /// In en, this message translates to:
  /// **'Apply'**
  String get apply;

  /// No description provided for @reset.
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get reset;

  /// No description provided for @filterTitle.
  ///
  /// In en, this message translates to:
  /// **'Filter'**
  String get filterTitle;

  /// No description provided for @carBrands.
  ///
  /// In en, this message translates to:
  /// **'Car Brands'**
  String get carBrands;

  /// No description provided for @carCondition.
  ///
  /// In en, this message translates to:
  /// **'Car Condition'**
  String get carCondition;

  /// No description provided for @newCondition.
  ///
  /// In en, this message translates to:
  /// **'New'**
  String get newCondition;

  /// No description provided for @usedCondition.
  ///
  /// In en, this message translates to:
  /// **'Used'**
  String get usedCondition;

  /// No description provided for @mileageTitle.
  ///
  /// In en, this message translates to:
  /// **'Mileage'**
  String get mileageTitle;

  /// No description provided for @selectMileageRange.
  ///
  /// In en, this message translates to:
  /// **'Select Mileage Range:'**
  String get selectMileageRange;

  /// No description provided for @startMileageHint.
  ///
  /// In en, this message translates to:
  /// **'Start Mileage'**
  String get startMileageHint;

  /// No description provided for @endMileageHint.
  ///
  /// In en, this message translates to:
  /// **'End Mileage'**
  String get endMileageHint;

  /// No description provided for @priceRange.
  ///
  /// In en, this message translates to:
  /// **'Price Range'**
  String get priceRange;

  /// No description provided for @yearTitle.
  ///
  /// In en, this message translates to:
  /// **'Year'**
  String get yearTitle;

  /// No description provided for @selectYearRange.
  ///
  /// In en, this message translates to:
  /// **'Select Year Range:'**
  String get selectYearRange;

  /// No description provided for @startYearHint.
  ///
  /// In en, this message translates to:
  /// **'Start Year'**
  String get startYearHint;

  /// No description provided for @endYearHint.
  ///
  /// In en, this message translates to:
  /// **'End Year'**
  String get endYearHint;

  /// No description provided for @errorFetchingShowroom.
  ///
  /// In en, this message translates to:
  /// **'Error fetching showroom: {error}'**
  String errorFetchingShowroom(Object error);

  /// No description provided for @rentalButton.
  ///
  /// In en, this message translates to:
  /// **'Rental'**
  String get rentalButton;

  /// No description provided for @buyButton.
  ///
  /// In en, this message translates to:
  /// **'Buy '**
  String get buyButton;

  /// No description provided for @agreeTermsError.
  ///
  /// In en, this message translates to:
  /// **'You must agree to the rental terms to proceed.'**
  String get agreeTermsError;

  /// No description provided for @rentalInformation.
  ///
  /// In en, this message translates to:
  /// **'Rental Information:'**
  String get rentalInformation;

  /// No description provided for @location.
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get location;

  /// No description provided for @noDescription.
  ///
  /// In en, this message translates to:
  /// **'No description available.'**
  String get noDescription;

  /// No description provided for @rentalTerms.
  ///
  /// In en, this message translates to:
  /// **'Rental terms'**
  String get rentalTerms;

  /// No description provided for @dummyTermsText.
  ///
  /// In en, this message translates to:
  /// **'Lorem ipsum dolor sit amet consectetur. Consectetur pharetra proin sed nisi vitae purus vivamus in. Ornare pellentesque vivamus elementum lorem velit eget mauris senectus fusce.'**
  String get dummyTermsText;

  /// No description provided for @agreeRentalTermsPrompt.
  ///
  /// In en, this message translates to:
  /// **'Do you agree to the rental terms'**
  String get agreeRentalTermsPrompt;

  /// No description provided for @seller.
  ///
  /// In en, this message translates to:
  /// **'Seller'**
  String get seller;

  /// No description provided for @suggestedAds.
  ///
  /// In en, this message translates to:
  /// **'Suggested Ads'**
  String get suggestedAds;

  /// No description provided for @showroomDetails.
  ///
  /// In en, this message translates to:
  /// **'Showroom Details'**
  String get showroomDetails;

  /// No description provided for @addressNotAvailable.
  ///
  /// In en, this message translates to:
  /// **'Address not available'**
  String get addressNotAvailable;

  /// No description provided for @aboutShowroom.
  ///
  /// In en, this message translates to:
  /// **'About showroom'**
  String get aboutShowroom;

  /// No description provided for @showroomAds.
  ///
  /// In en, this message translates to:
  /// **'{showroomName} Ads'**
  String showroomAds(Object showroomName);

  /// No description provided for @orderHistoryTitle.
  ///
  /// In en, this message translates to:
  /// **'Order History'**
  String get orderHistoryTitle;

  /// No description provided for @noHistoryFound.
  ///
  /// In en, this message translates to:
  /// **'No orders found in your history.'**
  String get noHistoryFound;

  /// No description provided for @clearHistoryPrompt.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to clear all history?'**
  String get clearHistoryPrompt;

  /// No description provided for @orderStatus.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get orderStatus;

  /// No description provided for @orderDate.
  ///
  /// In en, this message translates to:
  /// **'Order Date'**
  String get orderDate;

  /// No description provided for @unknownCar.
  ///
  /// In en, this message translates to:
  /// **'Unknown Car'**
  String get unknownCar;

  /// No description provided for @statusPending.
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get statusPending;

  /// No description provided for @statusConfirmed.
  ///
  /// In en, this message translates to:
  /// **'Confirmed'**
  String get statusConfirmed;

  /// No description provided for @statusRejected.
  ///
  /// In en, this message translates to:
  /// **'Rejected'**
  String get statusRejected;

  /// No description provided for @clearHistoryTitle.
  ///
  /// In en, this message translates to:
  /// **'Clear Your History'**
  String get clearHistoryTitle;

  /// No description provided for @clearHistoryWarning.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to clear your history? This action cannot be undone, so proceed with caution.'**
  String get clearHistoryWarning;

  /// No description provided for @confirmClearHistory.
  ///
  /// In en, this message translates to:
  /// **'YES, CLEAR IT'**
  String get confirmClearHistory;

  /// No description provided for @cancelClearHistory.
  ///
  /// In en, this message translates to:
  /// **'NO, I CHANGED MY MIND!'**
  String get cancelClearHistory;

  /// No description provided for @statusActive.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get statusActive;

  /// No description provided for @statusCanceled.
  ///
  /// In en, this message translates to:
  /// **'Canceled'**
  String get statusCanceled;

  /// No description provided for @statusEnded.
  ///
  /// In en, this message translates to:
  /// **'Ended'**
  String get statusEnded;

  /// No description provided for @orderDateLabel.
  ///
  /// In en, this message translates to:
  /// **'Order Date :'**
  String get orderDateLabel;

  /// No description provided for @statusLabel.
  ///
  /// In en, this message translates to:
  /// **'Status :'**
  String get statusLabel;

  /// No description provided for @loginRequired.
  ///
  /// In en, this message translates to:
  /// **'Please log in first.'**
  String get loginRequired;

  /// No description provided for @noHistoryYet.
  ///
  /// In en, this message translates to:
  /// **'No history yet.'**
  String get noHistoryYet;

  /// No description provided for @welcomeUser.
  ///
  /// In en, this message translates to:
  /// **'Welcome {userName}'**
  String welcomeUser(Object userName);

  /// No description provided for @userPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'User'**
  String get userPlaceholder;

  /// No description provided for @noShowroomsFound.
  ///
  /// In en, this message translates to:
  /// **'No showrooms found'**
  String get noShowroomsFound;

  /// No description provided for @topRatedShowroom.
  ///
  /// In en, this message translates to:
  /// **'Top rated Showroom'**
  String get topRatedShowroom;

  /// No description provided for @unknown.
  ///
  /// In en, this message translates to:
  /// **'Unknown'**
  String get unknown;

  /// No description provided for @seatsCount.
  ///
  /// In en, this message translates to:
  /// **'{count} seats'**
  String seatsCount(Object count);

  /// No description provided for @requests.
  ///
  /// In en, this message translates to:
  /// **'Requests'**
  String get requests;

  /// No description provided for @notificationsTitle.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notificationsTitle;

  /// No description provided for @userNotLoggedIn.
  ///
  /// In en, this message translates to:
  /// **'User not logged in.'**
  String get userNotLoggedIn;

  /// No description provided for @errorWithDetails.
  ///
  /// In en, this message translates to:
  /// **'Error: {error}'**
  String errorWithDetails(Object error);

  /// No description provided for @noNotificationsYet.
  ///
  /// In en, this message translates to:
  /// **'No notifications yet.'**
  String get noNotificationsYet;

  /// No description provided for @faqsTitle.
  ///
  /// In en, this message translates to:
  /// **'FAQ\'S'**
  String get faqsTitle;

  /// No description provided for @faqHeader.
  ///
  /// In en, this message translates to:
  /// **'Have Questions? We Have Answers!'**
  String get faqHeader;

  /// No description provided for @faqQuestion1.
  ///
  /// In en, this message translates to:
  /// **'How do I book a car?'**
  String get faqQuestion1;

  /// No description provided for @faqAnswer1.
  ///
  /// In en, this message translates to:
  /// **'You can book a car by browsing our car listings, selecting a car that fits your needs, and following the checkout process to confirm your rental.'**
  String get faqAnswer1;

  /// No description provided for @faqQuestion2.
  ///
  /// In en, this message translates to:
  /// **'What documents are required for rental?'**
  String get faqQuestion2;

  /// No description provided for @faqAnswer2.
  ///
  /// In en, this message translates to:
  /// **'Typically, you will need a valid driving license, a national ID or passport, and in some cases, a credit card for the security deposit.'**
  String get faqAnswer2;

  /// No description provided for @faqQuestion3.
  ///
  /// In en, this message translates to:
  /// **'Can I cancel my booking?'**
  String get faqQuestion3;

  /// No description provided for @faqAnswer3.
  ///
  /// In en, this message translates to:
  /// **'Yes, bookings can be cancelled through the history section. Please review our cancellation policy for information on potential fees.'**
  String get faqAnswer3;

  /// No description provided for @faqQuestion4.
  ///
  /// In en, this message translates to:
  /// **'Is insurance included?'**
  String get faqQuestion4;

  /// No description provided for @faqAnswer4.
  ///
  /// In en, this message translates to:
  /// **'Most rentals include basic insurance. You can opt for additional coverage during the checkout process for extra peace of mind.'**
  String get faqAnswer4;

  /// No description provided for @faqQuestion5.
  ///
  /// In en, this message translates to:
  /// **'How do I contact customer support?'**
  String get faqQuestion5;

  /// No description provided for @faqAnswer5.
  ///
  /// In en, this message translates to:
  /// **'You can reach our support team via the contact details provided in the app or through the support section in your profile.'**
  String get faqAnswer5;

  /// No description provided for @privacyPolicyTitle.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicyTitle;

  /// No description provided for @privacyPolicyIntro.
  ///
  /// In en, this message translates to:
  /// **'At Car Ads, we are committed to safeguarding your privacy and ensuring the security of your personal information. This Privacy Policy outlines how we collect, use, and protect your data when you use our mobile application.'**
  String get privacyPolicyIntro;

  /// No description provided for @termsConditionsTitle.
  ///
  /// In en, this message translates to:
  /// **'Terms & Conditions'**
  String get termsConditionsTitle;

  /// No description provided for @privacySectionTitle1.
  ///
  /// In en, this message translates to:
  /// **'1. Information Collection and Use:'**
  String get privacySectionTitle1;

  /// No description provided for @privacySectionContent1.
  ///
  /// In en, this message translates to:
  /// **'We may collect certain personal information from you, such as your name, email address, and contact details when you sign up or use our services. This information is used to personalize your experience, improve our services, and communicate with you.'**
  String get privacySectionContent1;

  /// No description provided for @privacySectionTitle2.
  ///
  /// In en, this message translates to:
  /// **'2. Log Data:'**
  String get privacySectionTitle2;

  /// No description provided for @privacySectionContent2.
  ///
  /// In en, this message translates to:
  /// **'When you use our app, we may collect information that your mobile device sends, such as your device ID, IP address, device name, and operating system version. This data is used for app performance analysis and to enhance user experience.'**
  String get privacySectionContent2;

  /// No description provided for @privacySectionTitle3.
  ///
  /// In en, this message translates to:
  /// **'3. Cookies and Similar Technologies:'**
  String get privacySectionTitle3;

  /// No description provided for @privacySectionContent3.
  ///
  /// In en, this message translates to:
  /// **'We may use cookies and similar tracking technologies to track the activity on our application and hold certain information. You can instruct your browser to refuse all cookies or to indicate when a cookie is being sent.'**
  String get privacySectionContent3;

  /// No description provided for @privacySectionTitle4.
  ///
  /// In en, this message translates to:
  /// **'4. Service Providers:'**
  String get privacySectionTitle4;

  /// No description provided for @privacySectionContent4.
  ///
  /// In en, this message translates to:
  /// **'We may employ third-party companies and individuals to facilitate our services, perform service-related tasks, or assist us in analyzing how our application is used. These third parties have access to your personal information only to perform these tasks on our behalf.'**
  String get privacySectionContent4;

  /// No description provided for @privacySectionTitle5.
  ///
  /// In en, this message translates to:
  /// **'5. Security:'**
  String get privacySectionTitle5;

  /// No description provided for @privacySectionContent5.
  ///
  /// In en, this message translates to:
  /// **'The security of your personal information is important to us. We strive to use commercially acceptable means to protect your personal information, but please remember that no method of transmission over the internet or electronic storage is 100% secure.'**
  String get privacySectionContent5;

  /// No description provided for @privacySectionTitle6.
  ///
  /// In en, this message translates to:
  /// **'6. Links to Other Sites:'**
  String get privacySectionTitle6;

  /// No description provided for @privacySectionContent6.
  ///
  /// In en, this message translates to:
  /// **'Our application may contain links to other sites that are not operated by us. If you click on a third-party link, you will be directed to that third party\'s site. We strongly advise you to review the Privacy Policy of every site you visit.'**
  String get privacySectionContent6;

  /// No description provided for @privacySectionTitle7.
  ///
  /// In en, this message translates to:
  /// **'7. Changes to This Privacy Policy:'**
  String get privacySectionTitle7;

  /// No description provided for @privacySectionContent7.
  ///
  /// In en, this message translates to:
  /// **'We may update our Privacy Policy from time to time. We will notify you of any changes by posting the new Privacy Policy on this page. You are advised to review this Privacy Policy periodically for any changes.'**
  String get privacySectionContent7;

  /// No description provided for @emailVerificationSent.
  ///
  /// In en, this message translates to:
  /// **'A verification link has been sent to your new email. Please verify it and log in again.'**
  String get emailVerificationSent;

  /// No description provided for @emailChangeRequestedTitle.
  ///
  /// In en, this message translates to:
  /// **'Email Change Requested'**
  String get emailChangeRequestedTitle;

  /// No description provided for @emailChangeRequestedBody.
  ///
  /// In en, this message translates to:
  /// **'A request to change your email to {newEmail} has been initiated.'**
  String emailChangeRequestedBody(Object newEmail);

  /// No description provided for @emailAlreadyInUse.
  ///
  /// In en, this message translates to:
  /// **'This email is already in use by another account.'**
  String get emailAlreadyInUse;

  /// No description provided for @invalidEmailFormat.
  ///
  /// In en, this message translates to:
  /// **'The email address is badly formatted.'**
  String get invalidEmailFormat;

  /// No description provided for @sessionExpired.
  ///
  /// In en, this message translates to:
  /// **'User session not found. Please log in again.'**
  String get sessionExpired;

  /// No description provided for @recentLoginRequired.
  ///
  /// In en, this message translates to:
  /// **'For security reasons, please log in again before changing your email.'**
  String get recentLoginRequired;

  /// No description provided for @updateEmailError.
  ///
  /// In en, this message translates to:
  /// **'An error occurred while updating your email. Please try again.'**
  String get updateEmailError;

  /// No description provided for @passwordChangedTitle.
  ///
  /// In en, this message translates to:
  /// **'Password Changed'**
  String get passwordChangedTitle;

  /// No description provided for @passwordChangedBody.
  ///
  /// In en, this message translates to:
  /// **'Your account password has been changed successfully.'**
  String get passwordChangedBody;

  /// No description provided for @tooManyAttempts.
  ///
  /// In en, this message translates to:
  /// **'Too many attempts. Please try again later or reset your password.'**
  String get tooManyAttempts;

  /// No description provided for @anErrorOccurred.
  ///
  /// In en, this message translates to:
  /// **'An error occurred'**
  String get anErrorOccurred;

  /// No description provided for @verificationFailed.
  ///
  /// In en, this message translates to:
  /// **'Verification failed'**
  String get verificationFailed;

  /// No description provided for @enterOtpError.
  ///
  /// In en, this message translates to:
  /// **'Please enter the 6-digit OTP code'**
  String get enterOtpError;

  /// No description provided for @phoneUpdatedTitle.
  ///
  /// In en, this message translates to:
  /// **'Phone Number Updated'**
  String get phoneUpdatedTitle;

  /// No description provided for @phoneUpdatedBody.
  ///
  /// In en, this message translates to:
  /// **'Your phone number has been updated to {newPhone} successfully.'**
  String phoneUpdatedBody(Object newPhone);

  /// No description provided for @phoneUpdatedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Phone number updated successfully!'**
  String get phoneUpdatedSuccess;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @selectLanguage.
  ///
  /// In en, this message translates to:
  /// **'Select Language'**
  String get selectLanguage;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @arabic.
  ///
  /// In en, this message translates to:
  /// **'Arabic'**
  String get arabic;

  /// No description provided for @profileImageUploadError.
  ///
  /// In en, this message translates to:
  /// **'Failed to upload profile image. Please try again.'**
  String get profileImageUploadError;

  /// No description provided for @profileUpdatedTitle.
  ///
  /// In en, this message translates to:
  /// **'Profile Updated'**
  String get profileUpdatedTitle;

  /// No description provided for @profileUpdatedBody.
  ///
  /// In en, this message translates to:
  /// **'Your profile information has been updated successfully.'**
  String get profileUpdatedBody;

  /// No description provided for @profileUpdatedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Profile updated successfully!'**
  String get profileUpdatedSuccess;

  /// No description provided for @updateFailed.
  ///
  /// In en, this message translates to:
  /// **'Update failed'**
  String get updateFailed;

  /// No description provided for @changeEmailTitle.
  ///
  /// In en, this message translates to:
  /// **'Change Your Email'**
  String get changeEmailTitle;

  /// No description provided for @dataSecurityMessage.
  ///
  /// In en, this message translates to:
  /// **'Your data is kept secure by us!'**
  String get dataSecurityMessage;

  /// No description provided for @addCurrentEmailPrompt.
  ///
  /// In en, this message translates to:
  /// **'Add your Current Email Address'**
  String get addCurrentEmailPrompt;

  /// No description provided for @currentEmailHint.
  ///
  /// In en, this message translates to:
  /// **'Current Email Address'**
  String get currentEmailHint;

  /// No description provided for @currentPasswordHint.
  ///
  /// In en, this message translates to:
  /// **'Current Password'**
  String get currentPasswordHint;

  /// No description provided for @passwordRequiredError.
  ///
  /// In en, this message translates to:
  /// **'Password is required'**
  String get passwordRequiredError;

  /// No description provided for @continueButton.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueButton;

  /// No description provided for @changeLanguageTitle.
  ///
  /// In en, this message translates to:
  /// **'Change Language'**
  String get changeLanguageTitle;

  /// No description provided for @selectLanguageComfortable.
  ///
  /// In en, this message translates to:
  /// **'Select your comfortable language!'**
  String get selectLanguageComfortable;

  /// No description provided for @resetYourPasswordTitle.
  ///
  /// In en, this message translates to:
  /// **'Reset Your Password'**
  String get resetYourPasswordTitle;

  /// No description provided for @newPasswordHint.
  ///
  /// In en, this message translates to:
  /// **'New Password'**
  String get newPasswordHint;

  /// No description provided for @confirmPasswordHint.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirmPasswordHint;

  /// No description provided for @resetPasswordButton.
  ///
  /// In en, this message translates to:
  /// **'Reset Your Password'**
  String get resetPasswordButton;

  /// No description provided for @changePhoneTitle.
  ///
  /// In en, this message translates to:
  /// **'Change Phone'**
  String get changePhoneTitle;

  /// No description provided for @enterNewMobilePrompt.
  ///
  /// In en, this message translates to:
  /// **'Enter your new mobile number to receive an OTP code.'**
  String get enterNewMobilePrompt;

  /// No description provided for @mobileNumberLabel.
  ///
  /// In en, this message translates to:
  /// **'Mobile Number'**
  String get mobileNumberLabel;

  /// No description provided for @phoneHint.
  ///
  /// In en, this message translates to:
  /// **'+971 XXXXXXXXX'**
  String get phoneHint;

  /// No description provided for @enterPhoneError.
  ///
  /// In en, this message translates to:
  /// **'Please enter your phone number'**
  String get enterPhoneError;

  /// No description provided for @includeCountryCodeError.
  ///
  /// In en, this message translates to:
  /// **'Please include country code (e.g., +971)'**
  String get includeCountryCodeError;

  /// No description provided for @sendOtpButton.
  ///
  /// In en, this message translates to:
  /// **'Send OTP'**
  String get sendOtpButton;

  /// No description provided for @wellDoneTitle.
  ///
  /// In en, this message translates to:
  /// **'Well Done'**
  String get wellDoneTitle;

  /// No description provided for @changesSavedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Congratulations! Your changes have been saved successfully!'**
  String get changesSavedSuccess;

  /// No description provided for @backToProfileButton.
  ///
  /// In en, this message translates to:
  /// **'Back To Profile'**
  String get backToProfileButton;

  /// No description provided for @allDone.
  ///
  /// In en, this message translates to:
  /// **'All Done !'**
  String get allDone;

  /// No description provided for @addNewEmailPrompt.
  ///
  /// In en, this message translates to:
  /// **'Add your New Email Address'**
  String get addNewEmailPrompt;

  /// No description provided for @newEmailHint.
  ///
  /// In en, this message translates to:
  /// **'New Email Address'**
  String get newEmailHint;

  /// No description provided for @resetEmailButton.
  ///
  /// In en, this message translates to:
  /// **'Reset Your Email'**
  String get resetEmailButton;

  /// No description provided for @yourProfileTitle.
  ///
  /// In en, this message translates to:
  /// **'Your Profile'**
  String get yourProfileTitle;

  /// No description provided for @loading.
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get loading;

  /// No description provided for @paymentMethods.
  ///
  /// In en, this message translates to:
  /// **'Payment Methods'**
  String get paymentMethods;

  /// No description provided for @changeYourEmailMenu.
  ///
  /// In en, this message translates to:
  /// **'Change Your Email'**
  String get changeYourEmailMenu;

  /// No description provided for @changeYourPhoneMenu.
  ///
  /// In en, this message translates to:
  /// **'Change Your Phone Number'**
  String get changeYourPhoneMenu;

  /// No description provided for @changeYourPasswordMenu.
  ///
  /// In en, this message translates to:
  /// **'Change Your Password'**
  String get changeYourPasswordMenu;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @updateProfileTitle.
  ///
  /// In en, this message translates to:
  /// **'Update Your Profile'**
  String get updateProfileTitle;

  /// No description provided for @fullNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get fullNameLabel;

  /// No description provided for @enterNameHint.
  ///
  /// In en, this message translates to:
  /// **'Enter your name'**
  String get enterNameHint;

  /// No description provided for @enterNameError.
  ///
  /// In en, this message translates to:
  /// **'Please enter your name'**
  String get enterNameError;

  /// No description provided for @verifyOtpTitle.
  ///
  /// In en, this message translates to:
  /// **'Verify OTP'**
  String get verifyOtpTitle;

  /// No description provided for @enterOtpSentTo.
  ///
  /// In en, this message translates to:
  /// **'Enter the 6-digit code sent to {phoneNumber}'**
  String enterOtpSentTo(Object phoneNumber);

  /// No description provided for @verifyAndUpdate.
  ///
  /// In en, this message translates to:
  /// **'Verify & Update'**
  String get verifyAndUpdate;

  /// No description provided for @uploadNewPicture.
  ///
  /// In en, this message translates to:
  /// **'Upload New Picture'**
  String get uploadNewPicture;

  /// No description provided for @unknownUser.
  ///
  /// In en, this message translates to:
  /// **'Unknown User'**
  String get unknownUser;

  /// No description provided for @paymentFailedError.
  ///
  /// In en, this message translates to:
  /// **'Payment failed or was cancelled. Please try again.'**
  String get paymentFailedError;

  /// No description provided for @rentalRequestReceivedTitle.
  ///
  /// In en, this message translates to:
  /// **'Rental Request Received'**
  String get rentalRequestReceivedTitle;

  /// No description provided for @rentalRequestReceivedBody.
  ///
  /// In en, this message translates to:
  /// **'Your rental request for {carName} has been successfully submitted.'**
  String rentalRequestReceivedBody(Object carName);

  /// No description provided for @newRentalRequestTitle.
  ///
  /// In en, this message translates to:
  /// **'New Rental Request!'**
  String get newRentalRequestTitle;

  /// No description provided for @newRentalRequestShowroomBody.
  ///
  /// In en, this message translates to:
  /// **'A user has requested to rent {carName}. Check your orders.'**
  String newRentalRequestShowroomBody(Object carName);

  /// No description provided for @orderDetailsNotFound.
  ///
  /// In en, this message translates to:
  /// **'Order details not found.'**
  String get orderDetailsNotFound;

  /// No description provided for @loadingLocation.
  ///
  /// In en, this message translates to:
  /// **'Loading Location...'**
  String get loadingLocation;

  /// No description provided for @tapMapToSelectLocation.
  ///
  /// In en, this message translates to:
  /// **'Tap on the map to select a location.'**
  String get tapMapToSelectLocation;

  /// No description provided for @couldNotDetermineAddress.
  ///
  /// In en, this message translates to:
  /// **'Could not determine address. Please try again.'**
  String get couldNotDetermineAddress;

  /// No description provided for @pleaseSelectLocationOnMap.
  ///
  /// In en, this message translates to:
  /// **'Please select a location on the map'**
  String get pleaseSelectLocationOnMap;

  /// No description provided for @unableToDetermineLocation.
  ///
  /// In en, this message translates to:
  /// **'Unable to determine your location.'**
  String get unableToDetermineLocation;

  /// No description provided for @checkoutTitle.
  ///
  /// In en, this message translates to:
  /// **'Checkout'**
  String get checkoutTitle;

  /// No description provided for @carAvailableFromError.
  ///
  /// In en, this message translates to:
  /// **'Car is only available from {time} on this day.'**
  String carAvailableFromError(Object time);

  /// No description provided for @carReturnByError.
  ///
  /// In en, this message translates to:
  /// **'Car must be returned by {time} on the final day.'**
  String carReturnByError(Object time);

  /// No description provided for @completeRentalPeriodError.
  ///
  /// In en, this message translates to:
  /// **'Please select the complete rental period (Dates and Times).'**
  String get completeRentalPeriodError;

  /// No description provided for @confirmRentalButton.
  ///
  /// In en, this message translates to:
  /// **'Confirm Rental'**
  String get confirmRentalButton;

  /// No description provided for @confirmPurchaseButton.
  ///
  /// In en, this message translates to:
  /// **'Confirm Purchase'**
  String get confirmPurchaseButton;

  /// No description provided for @confirmBuyTitle.
  ///
  /// In en, this message translates to:
  /// **'Confirm Purchase'**
  String get confirmBuyTitle;

  /// No description provided for @rentalReceiptTitle.
  ///
  /// In en, this message translates to:
  /// **'Rental Receipt'**
  String get rentalReceiptTitle;

  /// No description provided for @purchaseReceiptTitle.
  ///
  /// In en, this message translates to:
  /// **'Purchase Receipt'**
  String get purchaseReceiptTitle;

  /// No description provided for @confirmRentTitle.
  ///
  /// In en, this message translates to:
  /// **'Confirm Rent'**
  String get confirmRentTitle;

  /// No description provided for @yourLocationLabel.
  ///
  /// In en, this message translates to:
  /// **'Your Location'**
  String get yourLocationLabel;

  /// No description provided for @noAddressProvided.
  ///
  /// In en, this message translates to:
  /// **'No address provided'**
  String get noAddressProvided;

  /// No description provided for @orderLabel.
  ///
  /// In en, this message translates to:
  /// **'Order'**
  String get orderLabel;

  /// No description provided for @drivingLicenseNoHint.
  ///
  /// In en, this message translates to:
  /// **'Driving License No'**
  String get drivingLicenseNoHint;

  /// No description provided for @idNumberHint.
  ///
  /// In en, this message translates to:
  /// **'ID Number'**
  String get idNumberHint;

  /// No description provided for @rentalCompletedTitle.
  ///
  /// In en, this message translates to:
  /// **'Rental Completed'**
  String get rentalCompletedTitle;

  /// No description provided for @rentalCompletedMessage.
  ///
  /// In en, this message translates to:
  /// **'Your car rental request has been received, and we will get back to you as soon as we can. Please keep an eye out for notifications to stay updated.'**
  String get rentalCompletedMessage;

  /// No description provided for @carSummaryTitle.
  ///
  /// In en, this message translates to:
  /// **'Car Summary'**
  String get carSummaryTitle;

  /// No description provided for @selectDateHint.
  ///
  /// In en, this message translates to:
  /// **'Select Date'**
  String get selectDateHint;

  /// No description provided for @selectTimeHint.
  ///
  /// In en, this message translates to:
  /// **'Select Time'**
  String get selectTimeHint;

  /// No description provided for @priceDetailsTitle.
  ///
  /// In en, this message translates to:
  /// **'Price Details'**
  String get priceDetailsTitle;

  /// No description provided for @amountLabel.
  ///
  /// In en, this message translates to:
  /// **'Amount'**
  String get amountLabel;

  /// No description provided for @shippingLabel.
  ///
  /// In en, this message translates to:
  /// **'Shipping'**
  String get shippingLabel;

  /// No description provided for @taxLabel.
  ///
  /// In en, this message translates to:
  /// **'Tax'**
  String get taxLabel;

  /// No description provided for @totalPaymentLabel.
  ///
  /// In en, this message translates to:
  /// **'Total payment'**
  String get totalPaymentLabel;

  /// No description provided for @rentalFrom.
  ///
  /// In en, this message translates to:
  /// **'Rental From'**
  String get rentalFrom;

  /// No description provided for @rentalUntil.
  ///
  /// In en, this message translates to:
  /// **'Rental Until'**
  String get rentalUntil;

  /// No description provided for @setLocationButton.
  ///
  /// In en, this message translates to:
  /// **'Set Location'**
  String get setLocationButton;

  /// No description provided for @requestDeniedTitle.
  ///
  /// In en, this message translates to:
  /// **'We apologize, the request was denied'**
  String get requestDeniedTitle;

  /// No description provided for @requestDeniedBody.
  ///
  /// In en, this message translates to:
  /// **'Car rental request {carName} rejected by the showroom.'**
  String requestDeniedBody(Object carName);

  /// No description provided for @rentalAcceptedTitle.
  ///
  /// In en, this message translates to:
  /// **'The rental request has been accepted'**
  String get rentalAcceptedTitle;

  /// No description provided for @purchaseAcceptedTitle.
  ///
  /// In en, this message translates to:
  /// **'The purchase request has been accepted'**
  String get purchaseAcceptedTitle;

  /// No description provided for @rentalAcceptedBody.
  ///
  /// In en, this message translates to:
  /// **'The showroom has accepted a request to rent a car {carName}. You can review the details in the record.'**
  String rentalAcceptedBody(Object carName);

  /// No description provided for @purchaseAcceptedBody.
  ///
  /// In en, this message translates to:
  /// **'The showroom has accepted your request to buy {carName}. The transaction is now complete.'**
  String purchaseAcceptedBody(Object carName);

  /// No description provided for @orderCompletedTitle.
  ///
  /// In en, this message translates to:
  /// **'Order Completed'**
  String get orderCompletedTitle;

  /// No description provided for @orderCompletedBody.
  ///
  /// In en, this message translates to:
  /// **'Your rental for {carName} has been marked as completed. Thank you for using our service!'**
  String orderCompletedBody(Object carName);

  /// No description provided for @pickImageError.
  ///
  /// In en, this message translates to:
  /// **'Failed to pick image: {error}'**
  String pickImageError(Object error);

  /// No description provided for @selectImageFirstError.
  ///
  /// In en, this message translates to:
  /// **'Please select an image first'**
  String get selectImageFirstError;

  /// No description provided for @uploadFailedError.
  ///
  /// In en, this message translates to:
  /// **'Upload failed. Please try again.'**
  String get uploadFailedError;

  /// No description provided for @verifyCommercialLicenseTitle.
  ///
  /// In en, this message translates to:
  /// **'Verify Your Commercial License'**
  String get verifyCommercialLicenseTitle;

  /// No description provided for @verifyCommercialLicenseDescription.
  ///
  /// In en, this message translates to:
  /// **'To ensure the authenticity of your business, please verify your commercial license.'**
  String get verifyCommercialLicenseDescription;

  /// No description provided for @uploadLicenseImageLabel.
  ///
  /// In en, this message translates to:
  /// **'Upload an Image of Your Commercial License'**
  String get uploadLicenseImageLabel;

  /// No description provided for @uploadFileLabel.
  ///
  /// In en, this message translates to:
  /// **'Upload a File'**
  String get uploadFileLabel;

  /// No description provided for @gallery.
  ///
  /// In en, this message translates to:
  /// **'Gallery'**
  String get gallery;

  /// No description provided for @camera.
  ///
  /// In en, this message translates to:
  /// **'Camera'**
  String get camera;

  /// No description provided for @requestDetailsTitle.
  ///
  /// In en, this message translates to:
  /// **'Request Details'**
  String get requestDetailsTitle;

  /// No description provided for @requestUpdatedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Request {status} successfully'**
  String requestUpdatedSuccess(Object status);

  /// No description provided for @requestUpdateError.
  ///
  /// In en, this message translates to:
  /// **'Failed to update request: {error}'**
  String requestUpdateError(Object error);

  /// No description provided for @requestByLabel.
  ///
  /// In en, this message translates to:
  /// **'Request By : '**
  String get requestByLabel;

  /// No description provided for @requestDateLabel.
  ///
  /// In en, this message translates to:
  /// **'The date of request : '**
  String get requestDateLabel;

  /// No description provided for @drivingLicenseLabel.
  ///
  /// In en, this message translates to:
  /// **'Driving License No : '**
  String get drivingLicenseLabel;

  /// No description provided for @idNumberLabel.
  ///
  /// In en, this message translates to:
  /// **'ID Number : '**
  String get idNumberLabel;

  /// No description provided for @phoneNumberLabel.
  ///
  /// In en, this message translates to:
  /// **'Phone Number : '**
  String get phoneNumberLabel;

  /// No description provided for @acceptRequestButton.
  ///
  /// In en, this message translates to:
  /// **'Accept Request'**
  String get acceptRequestButton;

  /// No description provided for @rejectRequestButton.
  ///
  /// In en, this message translates to:
  /// **'Reject Request'**
  String get rejectRequestButton;

  /// No description provided for @loginAsShowroomError.
  ///
  /// In en, this message translates to:
  /// **'Please log in as a showroom.'**
  String get loginAsShowroomError;

  /// No description provided for @noRentRequestsYet.
  ///
  /// In en, this message translates to:
  /// **'No rent requests yet.'**
  String get noRentRequestsYet;

  /// No description provided for @settingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTitle;

  /// No description provided for @salesProfit.
  ///
  /// In en, this message translates to:
  /// **'Sales profit'**
  String get salesProfit;

  /// No description provided for @rentProfit.
  ///
  /// In en, this message translates to:
  /// **'Rent profit'**
  String get rentProfit;

  /// No description provided for @last5RentRequests.
  ///
  /// In en, this message translates to:
  /// **'Last 5 Rent Request'**
  String get last5RentRequests;

  /// No description provided for @manageYourAds.
  ///
  /// In en, this message translates to:
  /// **'Manage your Ads!'**
  String get manageYourAds;

  /// No description provided for @noAdsPostedYet.
  ///
  /// In en, this message translates to:
  /// **'No ads posted yet.'**
  String get noAdsPostedYet;

  /// No description provided for @adDeletedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Advertisement deleted successfully'**
  String get adDeletedSuccess;

  /// No description provided for @adDeletedTitle.
  ///
  /// In en, this message translates to:
  /// **'Advertisement Deleted'**
  String get adDeletedTitle;

  /// No description provided for @adDeletedBody.
  ///
  /// In en, this message translates to:
  /// **'Your car advertisement for {carName} has been successfully deleted.'**
  String adDeletedBody(Object carName);

  /// No description provided for @deleteAdsTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete Your Ads'**
  String get deleteAdsTitle;

  /// No description provided for @deleteAdConfirmationPrompt.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this advertisement?'**
  String get deleteAdConfirmationPrompt;

  /// No description provided for @confirmDeleteAd.
  ///
  /// In en, this message translates to:
  /// **'YES, DELETE IT'**
  String get confirmDeleteAd;

  /// No description provided for @keepAd.
  ///
  /// In en, this message translates to:
  /// **'NO, KEEP IT'**
  String get keepAd;

  /// No description provided for @percentageDisplay.
  ///
  /// In en, this message translates to:
  /// **'{sign}{value}%'**
  String percentageDisplay(Object sign, Object value);

  /// No description provided for @seeAll.
  ///
  /// In en, this message translates to:
  /// **'See All'**
  String get seeAll;

  /// No description provided for @noRecentRequests.
  ///
  /// In en, this message translates to:
  /// **'No recent requests'**
  String get noRecentRequests;

  /// No description provided for @perDay.
  ///
  /// In en, this message translates to:
  /// **'/Day'**
  String get perDay;

  /// No description provided for @requestBy.
  ///
  /// In en, this message translates to:
  /// **'Request By : {name}'**
  String requestBy(Object name);

  /// No description provided for @requestDate.
  ///
  /// In en, this message translates to:
  /// **'The date of request : {date}'**
  String requestDate(Object date);

  /// No description provided for @deleteAds.
  ///
  /// In en, this message translates to:
  /// **'Delete Ads'**
  String get deleteAds;

  /// No description provided for @editAds.
  ///
  /// In en, this message translates to:
  /// **'Edit Ads'**
  String get editAds;

  /// No description provided for @dateLabel.
  ///
  /// In en, this message translates to:
  /// **'Date : {date}'**
  String dateLabel(Object date);

  /// No description provided for @manageShowroomToday.
  ///
  /// In en, this message translates to:
  /// **'Manage your showroom today'**
  String get manageShowroomToday;

  /// No description provided for @shippingAddressLabel.
  ///
  /// In en, this message translates to:
  /// **'Shipping Address'**
  String get shippingAddressLabel;

  /// No description provided for @merchantName.
  ///
  /// In en, this message translates to:
  /// **'CarAds Inc.'**
  String get merchantName;
}

class _SDelegate extends LocalizationsDelegate<S> {
  const _SDelegate();

  @override
  Future<S> load(Locale locale) {
    return SynchronousFuture<S>(lookupS(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_SDelegate old) => false;
}

S lookupS(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return SAr();
    case 'en':
      return SEn();
  }

  throw FlutterError(
    'S.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
