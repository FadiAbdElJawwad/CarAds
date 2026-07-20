// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(carName) =>
      "Your car advertisement for ${carName} has been successfully deleted.";

  static String m1(brand) =>
      "Your car advertisement for ${brand} has been successfully posted.";

  static String m2(brand) =>
      "Your car advertisement for ${brand} has been successfully updated.";

  static String m3(time) => "Car is only available from ${time} on this day.";

  static String m4(time) => "Car must be returned by ${time} on the final day.";

  static String m5(date) => "Date : ${date}";

  static String m6(newEmail) =>
      "A request to change your email to ${newEmail} has been initiated.";

  static String m7(phoneNumber) =>
      "Enter the 6-digit code sent to ${phoneNumber}";

  static String m8(error) => "Error fetching showroom: ${error}";

  static String m9(error) => "Error: ${error}";

  static String m10(fieldName) => "${fieldName} cannot be empty";

  static String m11(count) => "${count} found";

  static String m12(error) => "Failed to load cars: ${error}";

  static String m13(carName) =>
      "A user has requested to rent ${carName}. Check your orders.";

  static String m14(carName) =>
      "Your rental for ${carName} has been marked as completed. Thank you for using our service!";

  static String m15(sign, value) => "${sign}${value}%";

  static String m16(newPhone) =>
      "Your phone number has been updated to ${newPhone} successfully.";

  static String m17(error) => "Failed to pick image: ${error}";

  static String m18(carName) =>
      "The showroom has accepted your request to buy ${carName}. The transaction is now complete.";

  static String m19(carName) =>
      "The showroom has accepted a request to rent a car ${carName}. You can review the details in the record.";

  static String m20(carName) =>
      "Your rental request for ${carName} has been successfully submitted.";

  static String m21(name) => "Request By : ${name}";

  static String m22(date) => "The date of request : ${date}";

  static String m23(carName) =>
      "Car rental request ${carName} rejected by the showroom.";

  static String m24(error) => "Failed to update request: ${error}";

  static String m25(status) => "Request ${status} successfully";

  static String m26(query) => "Results for \"${query}\"";

  static String m27(count) => "${count} seats";

  static String m28(showroomName) => "${showroomName} Ads";

  static String m29(userName) => "Welcome ${userName}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "aboutShowroom": MessageLookupByLibrary.simpleMessage("About showroom"),
    "acceptRequestButton": MessageLookupByLibrary.simpleMessage(
      "Accept Request",
    ),
    "accountCreatedSuccess": MessageLookupByLibrary.simpleMessage(
      "You have create account successfully.",
    ),
    "adDeletedBody": m0,
    "adDeletedSuccess": MessageLookupByLibrary.simpleMessage(
      "Advertisement deleted successfully",
    ),
    "adDeletedTitle": MessageLookupByLibrary.simpleMessage(
      "Advertisement Deleted",
    ),
    "adPostedBody": m1,
    "adPostedSuccess": MessageLookupByLibrary.simpleMessage(
      "Advertisement posted successfully!",
    ),
    "adPostedTitle": MessageLookupByLibrary.simpleMessage(
      "Advertisement Posted",
    ),
    "adUpdatedBody": m2,
    "adUpdatedSuccess": MessageLookupByLibrary.simpleMessage(
      "Advertisement updated successfully!",
    ),
    "adUpdatedTitle": MessageLookupByLibrary.simpleMessage(
      "Advertisement Updated",
    ),
    "add": MessageLookupByLibrary.simpleMessage("Add"),
    "addCurrentEmailPrompt": MessageLookupByLibrary.simpleMessage(
      "Add your Current Email Address",
    ),
    "addNewEmailPrompt": MessageLookupByLibrary.simpleMessage(
      "Add your New Email Address",
    ),
    "addPriceHint": MessageLookupByLibrary.simpleMessage("Add Price"),
    "addressEmptyError": MessageLookupByLibrary.simpleMessage(
      "Please enter address",
    ),
    "addressNotAvailable": MessageLookupByLibrary.simpleMessage(
      "Address not available",
    ),
    "aed": MessageLookupByLibrary.simpleMessage("AED"),
    "aedPerDay": MessageLookupByLibrary.simpleMessage("AED/Day"),
    "agreeRentalTermsPrompt": MessageLookupByLibrary.simpleMessage(
      "Do you agree to the rental terms",
    ),
    "agreeTermsError": MessageLookupByLibrary.simpleMessage(
      "You must agree to the rental terms to proceed.",
    ),
    "all": MessageLookupByLibrary.simpleMessage("All"),
    "allCars": MessageLookupByLibrary.simpleMessage("All Cars"),
    "allCategories": MessageLookupByLibrary.simpleMessage("All Categories"),
    "allDone": MessageLookupByLibrary.simpleMessage("All Done !"),
    "alreadyHaveAccount": MessageLookupByLibrary.simpleMessage(
      "Already have an account?",
    ),
    "amountLabel": MessageLookupByLibrary.simpleMessage("Amount"),
    "anErrorOccurred": MessageLookupByLibrary.simpleMessage(
      "An error occurred",
    ),
    "apply": MessageLookupByLibrary.simpleMessage("Apply"),
    "arabic": MessageLookupByLibrary.simpleMessage("Arabic"),
    "audi": MessageLookupByLibrary.simpleMessage("Audi"),
    "authenticationError": MessageLookupByLibrary.simpleMessage(
      "Authentication error",
    ),
    "availableFrom": MessageLookupByLibrary.simpleMessage("Available From"),
    "availableUntil": MessageLookupByLibrary.simpleMessage("Available Until"),
    "backToProfileButton": MessageLookupByLibrary.simpleMessage(
      "Back To Profile",
    ),
    "brandLabel": MessageLookupByLibrary.simpleMessage("Brand"),
    "brands": MessageLookupByLibrary.simpleMessage("Brands"),
    "buyButton": MessageLookupByLibrary.simpleMessage("Buy "),
    "camera": MessageLookupByLibrary.simpleMessage("Camera"),
    "cancelClearHistory": MessageLookupByLibrary.simpleMessage(
      "NO, I CHANGED MY MIND!",
    ),
    "carAvailableFromError": m3,
    "carBrandHint": MessageLookupByLibrary.simpleMessage("Car Brand"),
    "carBrands": MessageLookupByLibrary.simpleMessage("Car Brands"),
    "carCondition": MessageLookupByLibrary.simpleMessage("Car Condition"),
    "carForRent": MessageLookupByLibrary.simpleMessage("Car for rent"),
    "carForSale": MessageLookupByLibrary.simpleMessage("Car for sale"),
    "carInformation": MessageLookupByLibrary.simpleMessage("Car Information"),
    "carModelHint": MessageLookupByLibrary.simpleMessage("Car Model"),
    "carReturnByError": m4,
    "carSummaryTitle": MessageLookupByLibrary.simpleMessage("Car Summary"),
    "changeEmailTitle": MessageLookupByLibrary.simpleMessage(
      "Change Your Email",
    ),
    "changeLanguageTitle": MessageLookupByLibrary.simpleMessage(
      "Change Language",
    ),
    "changePhoneTitle": MessageLookupByLibrary.simpleMessage("Change Phone"),
    "changeYourEmailMenu": MessageLookupByLibrary.simpleMessage(
      "Change Your Email",
    ),
    "changeYourPasswordMenu": MessageLookupByLibrary.simpleMessage(
      "Change Your Password",
    ),
    "changeYourPhoneMenu": MessageLookupByLibrary.simpleMessage(
      "Change Your Phone Number",
    ),
    "changesSavedSuccess": MessageLookupByLibrary.simpleMessage(
      "Congratulations! Your changes have been saved successfully!",
    ),
    "checkoutTitle": MessageLookupByLibrary.simpleMessage("Checkout"),
    "clearAll": MessageLookupByLibrary.simpleMessage("Clear All"),
    "clearHistoryPrompt": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to clear all history?",
    ),
    "clearHistoryTitle": MessageLookupByLibrary.simpleMessage(
      "Clear Your History",
    ),
    "clearHistoryWarning": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to clear your history? This action cannot be undone, so proceed with caution.",
    ),
    "commercial": MessageLookupByLibrary.simpleMessage("Commercial"),
    "commercialAdLabel": MessageLookupByLibrary.simpleMessage("Commercial ad"),
    "commercialLicenseNumberHint": MessageLookupByLibrary.simpleMessage(
      "Commercial License Number",
    ),
    "commercialLicenseRequired": MessageLookupByLibrary.simpleMessage(
      "Commercial license*",
    ),
    "completeRentalPeriodError": MessageLookupByLibrary.simpleMessage(
      "Please select the complete rental period (Dates and Times).",
    ),
    "completeVerification": MessageLookupByLibrary.simpleMessage(
      "Complete Verification",
    ),
    "condition": MessageLookupByLibrary.simpleMessage("Condition"),
    "confirmBuyTitle": MessageLookupByLibrary.simpleMessage("Confirm Purchase"),
    "confirmClearHistory": MessageLookupByLibrary.simpleMessage(
      "YES, CLEAR IT",
    ),
    "confirmDeleteAd": MessageLookupByLibrary.simpleMessage("YES, DELETE IT"),
    "confirmPasswordHint": MessageLookupByLibrary.simpleMessage(
      "Confirm Password",
    ),
    "confirmPurchaseButton": MessageLookupByLibrary.simpleMessage(
      "Confirm Purchase",
    ),
    "confirmRentTitle": MessageLookupByLibrary.simpleMessage("Confirm Rent"),
    "confirmRentalButton": MessageLookupByLibrary.simpleMessage(
      "Confirm Rental",
    ),
    "contactInformation": MessageLookupByLibrary.simpleMessage(
      "Contact Information:",
    ),
    "continueButton": MessageLookupByLibrary.simpleMessage("Continue"),
    "couldNotDetermineAddress": MessageLookupByLibrary.simpleMessage(
      "Could not determine address. Please try again.",
    ),
    "currentEmailHint": MessageLookupByLibrary.simpleMessage(
      "Current Email Address",
    ),
    "currentPasswordHint": MessageLookupByLibrary.simpleMessage(
      "Current Password",
    ),
    "dataSecurityMessage": MessageLookupByLibrary.simpleMessage(
      "Your data is kept secure by us!",
    ),
    "dateLabel": m5,
    "days": MessageLookupByLibrary.simpleMessage("Days"),
    "deleteAdConfirmationPrompt": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to delete this advertisement?",
    ),
    "deleteAds": MessageLookupByLibrary.simpleMessage("Delete Ads"),
    "deleteAdsTitle": MessageLookupByLibrary.simpleMessage("Delete Your Ads"),
    "description": MessageLookupByLibrary.simpleMessage("Description"),
    "descriptionHint": MessageLookupByLibrary.simpleMessage(
      "Provide a brief description of your car",
    ),
    "dontHaveAccount": MessageLookupByLibrary.simpleMessage(
      "Don\'t have an account?",
    ),
    "doors": MessageLookupByLibrary.simpleMessage("Doors"),
    "drivingLicenseEmpty": MessageLookupByLibrary.simpleMessage(
      "Driving License No cannot be empty",
    ),
    "drivingLicenseLabel": MessageLookupByLibrary.simpleMessage(
      "Driving License No : ",
    ),
    "drivingLicenseMustBeNumber": MessageLookupByLibrary.simpleMessage(
      "Driving License No must be a number",
    ),
    "drivingLicenseNoHint": MessageLookupByLibrary.simpleMessage(
      "Driving License No",
    ),
    "drivingLicenseTooLong": MessageLookupByLibrary.simpleMessage(
      "Driving License No must be less than 10 digits",
    ),
    "dummyTermsText": MessageLookupByLibrary.simpleMessage(
      "Lorem ipsum dolor sit amet consectetur. Consectetur pharetra proin sed nisi vitae purus vivamus in. Ornare pellentesque vivamus elementum lorem velit eget mauris senectus fusce.",
    ),
    "editAdTitle": MessageLookupByLibrary.simpleMessage(
      "Edit Your Advertisement",
    ),
    "editAds": MessageLookupByLibrary.simpleMessage("Edit Ads"),
    "email": MessageLookupByLibrary.simpleMessage("Email Address"),
    "emailAlreadyInUse": MessageLookupByLibrary.simpleMessage(
      "This email is already in use by another account.",
    ),
    "emailChangeRequestedBody": m6,
    "emailChangeRequestedTitle": MessageLookupByLibrary.simpleMessage(
      "Email Change Requested",
    ),
    "emailVerificationSent": MessageLookupByLibrary.simpleMessage(
      "A verification link has been sent to your new email. Please verify it and log in again.",
    ),
    "emptyEmail": MessageLookupByLibrary.simpleMessage(
      "Please Enter Your Email Address",
    ),
    "emptyMobile": MessageLookupByLibrary.simpleMessage(
      "Please Enter Your Mobile Number",
    ),
    "emptyName": MessageLookupByLibrary.simpleMessage("Please Enter Your Name"),
    "emptyPassword": MessageLookupByLibrary.simpleMessage(
      "Please Enter Your Password",
    ),
    "endMileageHint": MessageLookupByLibrary.simpleMessage("End Mileage"),
    "endYearHint": MessageLookupByLibrary.simpleMessage("End Year"),
    "english": MessageLookupByLibrary.simpleMessage("English"),
    "enterNameError": MessageLookupByLibrary.simpleMessage(
      "Please enter your name",
    ),
    "enterNameHint": MessageLookupByLibrary.simpleMessage("Enter your name"),
    "enterNewMobilePrompt": MessageLookupByLibrary.simpleMessage(
      "Enter your new mobile number to receive an OTP code.",
    ),
    "enterOtpError": MessageLookupByLibrary.simpleMessage(
      "Please enter the 6-digit OTP code",
    ),
    "enterOtpSentTo": m7,
    "enterPhoneError": MessageLookupByLibrary.simpleMessage(
      "Please enter your phone number",
    ),
    "errorFetchingShowroom": m8,
    "errorWithDetails": m9,
    "explore": MessageLookupByLibrary.simpleMessage("Explore"),
    "faqAnswer1": MessageLookupByLibrary.simpleMessage(
      "You can book a car by browsing our car listings, selecting a car that fits your needs, and following the checkout process to confirm your rental.",
    ),
    "faqAnswer2": MessageLookupByLibrary.simpleMessage(
      "Typically, you will need a valid driving license, a national ID or passport, and in some cases, a credit card for the security deposit.",
    ),
    "faqAnswer3": MessageLookupByLibrary.simpleMessage(
      "Yes, bookings can be cancelled through the history section. Please review our cancellation policy for information on potential fees.",
    ),
    "faqAnswer4": MessageLookupByLibrary.simpleMessage(
      "Most rentals include basic insurance. You can opt for additional coverage during the checkout process for extra peace of mind.",
    ),
    "faqAnswer5": MessageLookupByLibrary.simpleMessage(
      "You can reach our support team via the contact details provided in the app or through the support section in your profile.",
    ),
    "faqHeader": MessageLookupByLibrary.simpleMessage(
      "Have Questions? We Have Answers!",
    ),
    "faqQuestion1": MessageLookupByLibrary.simpleMessage(
      "How do I book a car?",
    ),
    "faqQuestion2": MessageLookupByLibrary.simpleMessage(
      "What documents are required for rental?",
    ),
    "faqQuestion3": MessageLookupByLibrary.simpleMessage(
      "Can I cancel my booking?",
    ),
    "faqQuestion4": MessageLookupByLibrary.simpleMessage(
      "Is insurance included?",
    ),
    "faqQuestion5": MessageLookupByLibrary.simpleMessage(
      "How do I contact customer support?",
    ),
    "faqsTitle": MessageLookupByLibrary.simpleMessage("FAQ\'S"),
    "featured": MessageLookupByLibrary.simpleMessage("Featured"),
    "featuredAdDescription": MessageLookupByLibrary.simpleMessage(
      "Featured advertising enables you to connect with the widest range of users.",
    ),
    "featuredAdLabel": MessageLookupByLibrary.simpleMessage("Featured ad"),
    "fieldCannotBeEmpty": m10,
    "fillRentalDatesError": MessageLookupByLibrary.simpleMessage(
      "Please fill all rental dates and times",
    ),
    "filterTitle": MessageLookupByLibrary.simpleMessage("Filter"),
    "forgotPassword": MessageLookupByLibrary.simpleMessage(
      "Forgot Your Password?",
    ),
    "forgotPasswordBody": MessageLookupByLibrary.simpleMessage(
      "No worries! We\'ll help you reset your password. Just enter your registered Phone Number, and we\'ll send you a code to reset your password.",
    ),
    "fullNameLabel": MessageLookupByLibrary.simpleMessage("Full Name"),
    "gallery": MessageLookupByLibrary.simpleMessage("Gallery"),
    "gearBox": MessageLookupByLibrary.simpleMessage("Gear box"),
    "goToHome": MessageLookupByLibrary.simpleMessage("Go to Home"),
    "history": MessageLookupByLibrary.simpleMessage("History"),
    "home": MessageLookupByLibrary.simpleMessage("Home"),
    "hyundai": MessageLookupByLibrary.simpleMessage("Hyundai"),
    "idNumberEmpty": MessageLookupByLibrary.simpleMessage(
      "ID Number cannot be empty",
    ),
    "idNumberHint": MessageLookupByLibrary.simpleMessage("ID Number"),
    "idNumberLabel": MessageLookupByLibrary.simpleMessage("ID Number : "),
    "idNumberMustBeNumber": MessageLookupByLibrary.simpleMessage(
      "ID Number must be a number",
    ),
    "idNumberTooLong": MessageLookupByLibrary.simpleMessage(
      "ID Number must be less than 9 digits",
    ),
    "includeCountryCodeError": MessageLookupByLibrary.simpleMessage(
      "Please include country code (e.g., +971)",
    ),
    "incorrectCurrentPassword": MessageLookupByLibrary.simpleMessage(
      "The current password you entered is incorrect.",
    ),
    "incorrectEmail": MessageLookupByLibrary.simpleMessage(
      "Please Enter A Valid Email Address",
    ),
    "incorrectPassword": MessageLookupByLibrary.simpleMessage(
      "Password must be at least 6 characters long",
    ),
    "individualSellerLabel": MessageLookupByLibrary.simpleMessage(
      "Individual Seller",
    ),
    "invalidCredential": MessageLookupByLibrary.simpleMessage(
      "Invalid email or password.",
    ),
    "invalidEmail": MessageLookupByLibrary.simpleMessage("Invalid email."),
    "invalidEmailFormat": MessageLookupByLibrary.simpleMessage(
      "The email address is badly formatted.",
    ),
    "invalidMobile": MessageLookupByLibrary.simpleMessage(
      "Please enter a valid phone number",
    ),
    "itemsFound": m11,
    "keepAd": MessageLookupByLibrary.simpleMessage("NO, KEEP IT"),
    "language": MessageLookupByLibrary.simpleMessage("Language"),
    "last5RentRequests": MessageLookupByLibrary.simpleMessage(
      "Last 5 Rent Request",
    ),
    "licenseNumberEmptyError": MessageLookupByLibrary.simpleMessage(
      "Please enter license number",
    ),
    "loadCarsFailed": m12,
    "loading": MessageLookupByLibrary.simpleMessage("Loading..."),
    "loadingLocation": MessageLookupByLibrary.simpleMessage(
      "Loading Location...",
    ),
    "location": MessageLookupByLibrary.simpleMessage("Location"),
    "locationPermissionsDenied": MessageLookupByLibrary.simpleMessage(
      "Location permissions are denied",
    ),
    "locationPermissionsPermanentlyDenied":
        MessageLookupByLibrary.simpleMessage(
          "Location permissions are permanently denied, we cannot request permissions.",
        ),
    "locationServicesDisabled": MessageLookupByLibrary.simpleMessage(
      "Location services are disabled.",
    ),
    "loggedInSuccess": MessageLookupByLibrary.simpleMessage(
      "You have logged in successfully.",
    ),
    "login": MessageLookupByLibrary.simpleMessage("Login"),
    "loginAsShowroomError": MessageLookupByLibrary.simpleMessage(
      "Please log in as a showroom.",
    ),
    "loginBody": MessageLookupByLibrary.simpleMessage(
      "Sign in to your account and get back on track with CarAds",
    ),
    "loginRequired": MessageLookupByLibrary.simpleMessage(
      "Please log in first.",
    ),
    "loginTitle": MessageLookupByLibrary.simpleMessage(
      "Welcome Back to CarAds!",
    ),
    "logout": MessageLookupByLibrary.simpleMessage("Logout"),
    "manageShowroomToday": MessageLookupByLibrary.simpleMessage(
      "Manage your showroom today",
    ),
    "manageYourAds": MessageLookupByLibrary.simpleMessage("Manage your Ads!"),
    "mazda": MessageLookupByLibrary.simpleMessage("Mazda"),
    "merchantName": MessageLookupByLibrary.simpleMessage("CarAds Inc."),
    "mileage": MessageLookupByLibrary.simpleMessage("Mileage"),
    "mileageTitle": MessageLookupByLibrary.simpleMessage("Mileage"),
    "mobileNumberLabel": MessageLookupByLibrary.simpleMessage("Mobile Number"),
    "mobileStartWithCountryCode": MessageLookupByLibrary.simpleMessage(
      "Phone number must start with a country code (e.g. +971)",
    ),
    "modelLabel": MessageLookupByLibrary.simpleMessage("Model"),
    "months": MessageLookupByLibrary.simpleMessage("Months"),
    "name": MessageLookupByLibrary.simpleMessage("Full Name"),
    "nameHint": MessageLookupByLibrary.simpleMessage("Name"),
    "newCondition": MessageLookupByLibrary.simpleMessage("New"),
    "newEmailHint": MessageLookupByLibrary.simpleMessage("New Email Address"),
    "newPasswordHint": MessageLookupByLibrary.simpleMessage("New Password"),
    "newRentalRequestShowroomBody": m13,
    "newRentalRequestTitle": MessageLookupByLibrary.simpleMessage(
      "New Rental Request!",
    ),
    "next": MessageLookupByLibrary.simpleMessage("Next"),
    "noAddressProvided": MessageLookupByLibrary.simpleMessage(
      "No address provided",
    ),
    "noAdsMatchingFilters": MessageLookupByLibrary.simpleMessage(
      "No ads matching your filters",
    ),
    "noAdsPostedYet": MessageLookupByLibrary.simpleMessage(
      "No ads posted yet.",
    ),
    "noDescription": MessageLookupByLibrary.simpleMessage(
      "No description available.",
    ),
    "noHistoryFound": MessageLookupByLibrary.simpleMessage(
      "No orders found in your history.",
    ),
    "noHistoryYet": MessageLookupByLibrary.simpleMessage("No history yet."),
    "noName": MessageLookupByLibrary.simpleMessage("No Name"),
    "noNotificationsYet": MessageLookupByLibrary.simpleMessage(
      "No notifications yet.",
    ),
    "noRecentRequests": MessageLookupByLibrary.simpleMessage(
      "No recent requests",
    ),
    "noRentRequestsYet": MessageLookupByLibrary.simpleMessage(
      "No rent requests yet.",
    ),
    "noShowroomsFound": MessageLookupByLibrary.simpleMessage(
      "No showrooms found",
    ),
    "noSuggestedAds": MessageLookupByLibrary.simpleMessage(
      "No suggested ads available for this car.",
    ),
    "notAvailable": MessageLookupByLibrary.simpleMessage("N/A"),
    "notificationChannelDescription": MessageLookupByLibrary.simpleMessage(
      "This channel is used for important notifications.",
    ),
    "notificationChannelName": MessageLookupByLibrary.simpleMessage(
      "High Importance Notifications",
    ),
    "notificationsTitle": MessageLookupByLibrary.simpleMessage("Notifications"),
    "onbordingModelBody1": MessageLookupByLibrary.simpleMessage(
      "CarAds is your ultimate destination for car showrooms and rental offices advertising. Whether you\'re a car showroom owner or looking to rent a vehicle, our platform has got you covered!",
    ),
    "onbordingModelBody2": MessageLookupByLibrary.simpleMessage(
      "Are you a car showroom or rental office owner? Create your special account now! Easily manage and promote your ads within a few taps. Reach a broader audience, receive inquiries with CarAds",
    ),
    "onbordingModelBody3": MessageLookupByLibrary.simpleMessage(
      "Discover a wide range of car advertisements tailored to your preferences. Browse through various car models, rental offers, and exclusive deals from local showrooms. With CarAds",
    ),
    "onbordingModelTitle1": MessageLookupByLibrary.simpleMessage(
      "Welcome to CarAds App",
    ),
    "onbordingModelTitle2": MessageLookupByLibrary.simpleMessage(
      "Effortless Ads Management",
    ),
    "onbordingModelTitle3": MessageLookupByLibrary.simpleMessage(
      "Explore Your Options",
    ),
    "orderCompletedBody": m14,
    "orderCompletedTitle": MessageLookupByLibrary.simpleMessage(
      "Order Completed",
    ),
    "orderDate": MessageLookupByLibrary.simpleMessage("Order Date"),
    "orderDateLabel": MessageLookupByLibrary.simpleMessage("Order Date :"),
    "orderDetailsNotFound": MessageLookupByLibrary.simpleMessage(
      "Order details not found.",
    ),
    "orderHistoryTitle": MessageLookupByLibrary.simpleMessage("Order History"),
    "orderLabel": MessageLookupByLibrary.simpleMessage("Order"),
    "orderStatus": MessageLookupByLibrary.simpleMessage("Status"),
    "pageHomeConfirm": MessageLookupByLibrary.simpleMessage(
      "Page home confirm",
    ),
    "password": MessageLookupByLibrary.simpleMessage("Password"),
    "passwordChangedBody": MessageLookupByLibrary.simpleMessage(
      "Your account password has been changed successfully.",
    ),
    "passwordChangedTitle": MessageLookupByLibrary.simpleMessage(
      "Password Changed",
    ),
    "passwordRequiredError": MessageLookupByLibrary.simpleMessage(
      "Password is required",
    ),
    "passwordResetEmailSent": MessageLookupByLibrary.simpleMessage(
      "Password reset email sent successfully!",
    ),
    "passwordSameAsCurrent": MessageLookupByLibrary.simpleMessage(
      "New password cannot be the same as current",
    ),
    "passwordsDoNotMatch": MessageLookupByLibrary.simpleMessage(
      "Passwords do not match",
    ),
    "paymentFailedError": MessageLookupByLibrary.simpleMessage(
      "Payment failed or was cancelled. Please try again.",
    ),
    "paymentMethods": MessageLookupByLibrary.simpleMessage("Payment Methods"),
    "perDay": MessageLookupByLibrary.simpleMessage("/Day"),
    "percentageDisplay": m15,
    "phoneHint": MessageLookupByLibrary.simpleMessage("+971 XXXXXXXXX"),
    "phoneNumber": MessageLookupByLibrary.simpleMessage("Phone Number"),
    "phoneNumberHint": MessageLookupByLibrary.simpleMessage("Phone Number"),
    "phoneNumberLabel": MessageLookupByLibrary.simpleMessage("Phone Number : "),
    "phoneNumberRequired": MessageLookupByLibrary.simpleMessage(
      "Phone Number *",
    ),
    "phoneUpdatedBody": m16,
    "phoneUpdatedSuccess": MessageLookupByLibrary.simpleMessage(
      "Phone number updated successfully!",
    ),
    "phoneUpdatedTitle": MessageLookupByLibrary.simpleMessage(
      "Phone Number Updated",
    ),
    "pickImageError": m17,
    "pleaseSelectLocationOnMap": MessageLookupByLibrary.simpleMessage(
      "Please select a location on the map",
    ),
    "postAd": MessageLookupByLibrary.simpleMessage("POST ADVERTISEMENT"),
    "postAdTitle": MessageLookupByLibrary.simpleMessage(
      "Post Your Advertisement",
    ),
    "price": MessageLookupByLibrary.simpleMessage("Price"),
    "priceDetailsTitle": MessageLookupByLibrary.simpleMessage("Price Details"),
    "priceEmptyError": MessageLookupByLibrary.simpleMessage(
      "Price cannot be empty",
    ),
    "priceRange": MessageLookupByLibrary.simpleMessage("Price Range"),
    "privacyPolicyIntro": MessageLookupByLibrary.simpleMessage(
      "At Car Ads, we are committed to safeguarding your privacy and ensuring the security of your personal information. This Privacy Policy outlines how we collect, use, and protect your data when you use our mobile application.",
    ),
    "privacyPolicyTitle": MessageLookupByLibrary.simpleMessage(
      "Privacy Policy",
    ),
    "privacySectionContent1": MessageLookupByLibrary.simpleMessage(
      "We may collect certain personal information from you, such as your name, email address, and contact details when you sign up or use our services. This information is used to personalize your experience, improve our services, and communicate with you.",
    ),
    "privacySectionContent2": MessageLookupByLibrary.simpleMessage(
      "When you use our app, we may collect information that your mobile device sends, such as your device ID, IP address, device name, and operating system version. This data is used for app performance analysis and to enhance user experience.",
    ),
    "privacySectionContent3": MessageLookupByLibrary.simpleMessage(
      "We may use cookies and similar tracking technologies to track the activity on our application and hold certain information. You can instruct your browser to refuse all cookies or to indicate when a cookie is being sent.",
    ),
    "privacySectionContent4": MessageLookupByLibrary.simpleMessage(
      "We may employ third-party companies and individuals to facilitate our services, perform service-related tasks, or assist us in analyzing how our application is used. These third parties have access to your personal information only to perform these tasks on our behalf.",
    ),
    "privacySectionContent5": MessageLookupByLibrary.simpleMessage(
      "The security of your personal information is important to us. We strive to use commercially acceptable means to protect your personal information, but please remember that no method of transmission over the internet or electronic storage is 100% secure.",
    ),
    "privacySectionContent6": MessageLookupByLibrary.simpleMessage(
      "Our application may contain links to other sites that are not operated by us. If you click on a third-party link, you will be directed to that third party\'s site. We strongly advise you to review the Privacy Policy of every site you visit.",
    ),
    "privacySectionContent7": MessageLookupByLibrary.simpleMessage(
      "We may update our Privacy Policy from time to time. We will notify you of any changes by posting the new Privacy Policy on this page. You are advised to review this Privacy Policy periodically for any changes.",
    ),
    "privacySectionTitle1": MessageLookupByLibrary.simpleMessage(
      "1. Information Collection and Use:",
    ),
    "privacySectionTitle2": MessageLookupByLibrary.simpleMessage(
      "2. Log Data:",
    ),
    "privacySectionTitle3": MessageLookupByLibrary.simpleMessage(
      "3. Cookies and Similar Technologies:",
    ),
    "privacySectionTitle4": MessageLookupByLibrary.simpleMessage(
      "4. Service Providers:",
    ),
    "privacySectionTitle5": MessageLookupByLibrary.simpleMessage(
      "5. Security:",
    ),
    "privacySectionTitle6": MessageLookupByLibrary.simpleMessage(
      "6. Links to Other Sites:",
    ),
    "privacySectionTitle7": MessageLookupByLibrary.simpleMessage(
      "7. Changes to This Privacy Policy:",
    ),
    "profile": MessageLookupByLibrary.simpleMessage("Profile"),
    "profileImageUploadError": MessageLookupByLibrary.simpleMessage(
      "Failed to upload profile image. Please try again.",
    ),
    "profileUpdatedBody": MessageLookupByLibrary.simpleMessage(
      "Your profile information has been updated successfully.",
    ),
    "profileUpdatedSuccess": MessageLookupByLibrary.simpleMessage(
      "Profile updated successfully!",
    ),
    "profileUpdatedTitle": MessageLookupByLibrary.simpleMessage(
      "Profile Updated",
    ),
    "purchaseAcceptedBody": m18,
    "purchaseAcceptedTitle": MessageLookupByLibrary.simpleMessage(
      "The purchase request has been accepted",
    ),
    "purchaseReceiptTitle": MessageLookupByLibrary.simpleMessage(
      "Purchase Receipt",
    ),
    "recentLoginRequired": MessageLookupByLibrary.simpleMessage(
      "For security reasons, please log in again before changing your email.",
    ),
    "recentSearchesTitle": MessageLookupByLibrary.simpleMessage("Recent"),
    "rejectRequestButton": MessageLookupByLibrary.simpleMessage(
      "Reject Request",
    ),
    "rentProfit": MessageLookupByLibrary.simpleMessage("Rent profit"),
    "rentalAcceptedBody": m19,
    "rentalAcceptedTitle": MessageLookupByLibrary.simpleMessage(
      "The rental request has been accepted",
    ),
    "rentalButton": MessageLookupByLibrary.simpleMessage("Rental"),
    "rentalCompletedMessage": MessageLookupByLibrary.simpleMessage(
      "Your car rental request has been received, and we will get back to you as soon as we can. Please keep an eye out for notifications to stay updated.",
    ),
    "rentalCompletedTitle": MessageLookupByLibrary.simpleMessage(
      "Rental Completed",
    ),
    "rentalDuration": MessageLookupByLibrary.simpleMessage("Rental Duration"),
    "rentalFrom": MessageLookupByLibrary.simpleMessage("Rental From"),
    "rentalInformation": MessageLookupByLibrary.simpleMessage(
      "Rental Information:",
    ),
    "rentalReceiptTitle": MessageLookupByLibrary.simpleMessage(
      "Rental Receipt",
    ),
    "rentalRequestReceivedBody": m20,
    "rentalRequestReceivedTitle": MessageLookupByLibrary.simpleMessage(
      "Rental Request Received",
    ),
    "rentalTerms": MessageLookupByLibrary.simpleMessage("Rental terms"),
    "rentalUntil": MessageLookupByLibrary.simpleMessage("Rental Until"),
    "requestBy": m21,
    "requestByLabel": MessageLookupByLibrary.simpleMessage("Request By : "),
    "requestDate": m22,
    "requestDateLabel": MessageLookupByLibrary.simpleMessage(
      "The date of request : ",
    ),
    "requestDeniedBody": m23,
    "requestDeniedTitle": MessageLookupByLibrary.simpleMessage(
      "We apologize, the request was denied",
    ),
    "requestDetailsTitle": MessageLookupByLibrary.simpleMessage(
      "Request Details",
    ),
    "requestUpdateError": m24,
    "requestUpdatedSuccess": m25,
    "requests": MessageLookupByLibrary.simpleMessage("Requests"),
    "reset": MessageLookupByLibrary.simpleMessage("Reset"),
    "resetEmailButton": MessageLookupByLibrary.simpleMessage(
      "Reset Your Email",
    ),
    "resetPasswordButton": MessageLookupByLibrary.simpleMessage(
      "Reset Your Password",
    ),
    "resetYourPasswordTitle": MessageLookupByLibrary.simpleMessage(
      "Reset Your Password",
    ),
    "resultsFor": m26,
    "salesProfit": MessageLookupByLibrary.simpleMessage("Sales profit"),
    "saveChanges": MessageLookupByLibrary.simpleMessage("SAVE CHANGES"),
    "seats": MessageLookupByLibrary.simpleMessage("Seats"),
    "seatsCount": m27,
    "seeAll": MessageLookupByLibrary.simpleMessage("See All"),
    "selectAdPurposePrompt": MessageLookupByLibrary.simpleMessage(
      "Please select the advertising purpose",
    ),
    "selectAdTypePrompt": MessageLookupByLibrary.simpleMessage(
      "Please select the advertising type",
    ),
    "selectDateHint": MessageLookupByLibrary.simpleMessage("Select Date"),
    "selectImageFirstError": MessageLookupByLibrary.simpleMessage(
      "Please select an image first",
    ),
    "selectLanguage": MessageLookupByLibrary.simpleMessage("Select Language"),
    "selectLanguageComfortable": MessageLookupByLibrary.simpleMessage(
      "Select your comfortable language!",
    ),
    "selectMileageRange": MessageLookupByLibrary.simpleMessage(
      "Select Mileage Range:",
    ),
    "selectTimeHint": MessageLookupByLibrary.simpleMessage("Select Time"),
    "selectVehicleImageError": MessageLookupByLibrary.simpleMessage(
      "Please select a vehicle image",
    ),
    "selectYearRange": MessageLookupByLibrary.simpleMessage(
      "Select Year Range:",
    ),
    "seller": MessageLookupByLibrary.simpleMessage("Seller"),
    "send": MessageLookupByLibrary.simpleMessage("Send"),
    "sendOtpButton": MessageLookupByLibrary.simpleMessage("Send OTP"),
    "sessionExpired": MessageLookupByLibrary.simpleMessage(
      "User session not found. Please log in again.",
    ),
    "setLocationButton": MessageLookupByLibrary.simpleMessage("Set Location"),
    "settingsTitle": MessageLookupByLibrary.simpleMessage("Settings"),
    "shippingAddressLabel": MessageLookupByLibrary.simpleMessage(
      "Shipping Address",
    ),
    "shippingLabel": MessageLookupByLibrary.simpleMessage("Shipping"),
    "showroomAddressHint": MessageLookupByLibrary.simpleMessage(
      "Showroom Address",
    ),
    "showroomAds": m28,
    "showroomDefaultName": MessageLookupByLibrary.simpleMessage("Showroom"),
    "showroomDetails": MessageLookupByLibrary.simpleMessage("Showroom Details"),
    "showroomRole": MessageLookupByLibrary.simpleMessage("Showroom"),
    "showroomsJoin": MessageLookupByLibrary.simpleMessage(
      "Join Now As A Showrooms",
    ),
    "signUp": MessageLookupByLibrary.simpleMessage("Sign Up"),
    "signUpBody": MessageLookupByLibrary.simpleMessage(
      "Create your account and become a part of CarAds community\'s",
    ),
    "signUpTitle": MessageLookupByLibrary.simpleMessage("Join CarAds Today!"),
    "skip": MessageLookupByLibrary.simpleMessage("Skip"),
    "somethingWentWrong": MessageLookupByLibrary.simpleMessage(
      "Something went wrong",
    ),
    "splashBody": MessageLookupByLibrary.simpleMessage(
      "Your Gateway to Car Showrooms and Rental Offices",
    ),
    "splashTitle": MessageLookupByLibrary.simpleMessage(
      "Welcome to CarAds App",
    ),
    "startMileageHint": MessageLookupByLibrary.simpleMessage("Start Mileage"),
    "startSearchHint": MessageLookupByLibrary.simpleMessage(
      "Start your search ...",
    ),
    "startYearHint": MessageLookupByLibrary.simpleMessage("Start Year"),
    "statusActive": MessageLookupByLibrary.simpleMessage("Active"),
    "statusCanceled": MessageLookupByLibrary.simpleMessage("Canceled"),
    "statusConfirmed": MessageLookupByLibrary.simpleMessage("Confirmed"),
    "statusEnded": MessageLookupByLibrary.simpleMessage("Ended"),
    "statusLabel": MessageLookupByLibrary.simpleMessage("Status :"),
    "statusPending": MessageLookupByLibrary.simpleMessage("Pending"),
    "statusRejected": MessageLookupByLibrary.simpleMessage("Rejected"),
    "suggestedAds": MessageLookupByLibrary.simpleMessage("Suggested Ads"),
    "tankSize": MessageLookupByLibrary.simpleMessage("Tank Size"),
    "tapMapToSelectLocation": MessageLookupByLibrary.simpleMessage(
      "Tap on the map to select a location.",
    ),
    "taxLabel": MessageLookupByLibrary.simpleMessage("Tax"),
    "termsConditionsTitle": MessageLookupByLibrary.simpleMessage(
      "Terms & Conditions",
    ),
    "thousandSuffix": MessageLookupByLibrary.simpleMessage("K"),
    "tooManyAttempts": MessageLookupByLibrary.simpleMessage(
      "Too many attempts. Please try again later or reset your password.",
    ),
    "topRatedShowroom": MessageLookupByLibrary.simpleMessage(
      "Top rated Showroom",
    ),
    "totalPaymentLabel": MessageLookupByLibrary.simpleMessage("Total payment"),
    "toyota": MessageLookupByLibrary.simpleMessage("Toyota"),
    "unableToDetermineLocation": MessageLookupByLibrary.simpleMessage(
      "Unable to determine your location.",
    ),
    "unknown": MessageLookupByLibrary.simpleMessage("Unknown"),
    "unknownCar": MessageLookupByLibrary.simpleMessage("Unknown Car"),
    "unknownLocation": MessageLookupByLibrary.simpleMessage("Unknown Location"),
    "unknownUser": MessageLookupByLibrary.simpleMessage("Unknown User"),
    "updateEmailError": MessageLookupByLibrary.simpleMessage(
      "An error occurred while updating your email. Please try again.",
    ),
    "updateEmailLoginRequired": MessageLookupByLibrary.simpleMessage(
      "User must be logged in to update email.",
    ),
    "updateFailed": MessageLookupByLibrary.simpleMessage("Update failed"),
    "updateProfileTitle": MessageLookupByLibrary.simpleMessage(
      "Update Your Profile",
    ),
    "uploadFailedError": MessageLookupByLibrary.simpleMessage(
      "Upload failed. Please try again.",
    ),
    "uploadFileLabel": MessageLookupByLibrary.simpleMessage("Upload a File"),
    "uploadImageError": MessageLookupByLibrary.simpleMessage(
      "Failed to upload image to Drive",
    ),
    "uploadLicenseImageLabel": MessageLookupByLibrary.simpleMessage(
      "Upload an Image of Your Commercial License",
    ),
    "uploadNewPicture": MessageLookupByLibrary.simpleMessage(
      "Upload New Picture",
    ),
    "uploadPhotos": MessageLookupByLibrary.simpleMessage("Upload Photos"),
    "uploadPhotosDescription": MessageLookupByLibrary.simpleMessage(
      "Add high-quality photos to showcase your car",
    ),
    "urlLaunchError": MessageLookupByLibrary.simpleMessage(
      "Could not launch app. Is it installed?",
    ),
    "usedCondition": MessageLookupByLibrary.simpleMessage("Used"),
    "usedEmail": MessageLookupByLibrary.simpleMessage(
      "The account already exists for that email.",
    ),
    "userJoin": MessageLookupByLibrary.simpleMessage("Join Now As A User"),
    "userNotAuthenticated": MessageLookupByLibrary.simpleMessage(
      "User not authenticated",
    ),
    "userNotLoggedIn": MessageLookupByLibrary.simpleMessage(
      "User not logged in.",
    ),
    "userPlaceholder": MessageLookupByLibrary.simpleMessage("User"),
    "userRole": MessageLookupByLibrary.simpleMessage("User"),
    "verification": MessageLookupByLibrary.simpleMessage("Verification"),
    "verificationFailed": MessageLookupByLibrary.simpleMessage(
      "Verification failed",
    ),
    "verificationPrompt": MessageLookupByLibrary.simpleMessage(
      "To use our services , we need to verify :",
    ),
    "verified": MessageLookupByLibrary.simpleMessage("Verified"),
    "verify": MessageLookupByLibrary.simpleMessage("Verify"),
    "verifyAndUpdate": MessageLookupByLibrary.simpleMessage("Verify & Update"),
    "verifyCommercialLicenseDescription": MessageLookupByLibrary.simpleMessage(
      "To ensure the authenticity of your business, please verify your commercial license.",
    ),
    "verifyCommercialLicenseTitle": MessageLookupByLibrary.simpleMessage(
      "Verify Your Commercial License",
    ),
    "verifyOtpTitle": MessageLookupByLibrary.simpleMessage("Verify OTP"),
    "weakPassword": MessageLookupByLibrary.simpleMessage(
      "The password provided is too weak.",
    ),
    "weeks": MessageLookupByLibrary.simpleMessage("Weeks"),
    "welcomeBackTitle": MessageLookupByLibrary.simpleMessage("Welcome Back!"),
    "welcomeTitle": MessageLookupByLibrary.simpleMessage("Welcome !"),
    "welcomeUser": m29,
    "wellDoneTitle": MessageLookupByLibrary.simpleMessage("Well Done"),
    "year": MessageLookupByLibrary.simpleMessage("Year"),
    "yearTitle": MessageLookupByLibrary.simpleMessage("Year"),
    "yourLocationLabel": MessageLookupByLibrary.simpleMessage("Your Location"),
    "yourProfileTitle": MessageLookupByLibrary.simpleMessage("Your Profile"),
  };
}
