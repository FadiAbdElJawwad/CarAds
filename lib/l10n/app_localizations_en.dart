// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class SEn extends S {
  SEn([String locale = 'en']) : super(locale);

  @override
  String get pageHomeConfirm => 'Page home confirm';

  @override
  String get splashTitle => 'Welcome to CarAds App';

  @override
  String get splashBody => 'Your Gateway to Car Showrooms and Rental Offices';

  @override
  String get onbordingModelTitle1 => 'Welcome to CarAds App';

  @override
  String get onbordingModelBody1 =>
      'CarAds is your ultimate destination for car showrooms and rental offices advertising. Whether you\'re a car showroom owner or looking to rent a vehicle, our platform has got you covered!';

  @override
  String get onbordingModelTitle2 => 'Effortless Ads Management';

  @override
  String get onbordingModelBody2 =>
      'Are you a car showroom or rental office owner? Create your special account now! Easily manage and promote your ads within a few taps. Reach a broader audience, receive inquiries with CarAds';

  @override
  String get onbordingModelTitle3 => 'Explore Your Options';

  @override
  String get onbordingModelBody3 =>
      'Discover a wide range of car advertisements tailored to your preferences. Browse through various car models, rental offers, and exclusive deals from local showrooms. With CarAds';

  @override
  String get next => 'Next';

  @override
  String get skip => 'Skip';

  @override
  String get userJoin => 'Join Now As A User';

  @override
  String get showroomsJoin => 'Join Now As A Showrooms';

  @override
  String get login => 'Login';

  @override
  String get loginTitle => 'Welcome Back to CarAds!';

  @override
  String get loginBody =>
      'Sign in to your account and get back on track with CarAds';

  @override
  String get dontHaveAccount => 'Don\'t have an account?';

  @override
  String get signUp => 'Sign Up';

  @override
  String get signUpTitle => 'Join CarAds Today!';

  @override
  String get signUpBody =>
      'Create your account and become a part of CarAds community\'s';

  @override
  String get alreadyHaveAccount => 'Already have an account?';

  @override
  String get forgotPassword => 'Forgot Your Password?';

  @override
  String get forgotPasswordBody =>
      'No worries! We\'ll help you reset your password. Just enter your registered Phone Number, and we\'ll send you a code to reset your password.';

  @override
  String get email => 'Email Address';

  @override
  String get name => 'Full Name';

  @override
  String get password => 'Password';

  @override
  String get invalidCredential => 'Invalid email or password.';

  @override
  String get invalidEmail => 'Invalid email.';

  @override
  String get authenticationError => 'Authentication error';

  @override
  String get weakPassword => 'The password provided is too weak.';

  @override
  String get usedEmail => 'The account already exists for that email.';

  @override
  String get userNotAuthenticated => 'User not authenticated';

  @override
  String get updateEmailLoginRequired =>
      'User must be logged in to update email.';

  @override
  String get incorrectCurrentPassword =>
      'The current password you entered is incorrect.';

  @override
  String get welcomeTitle => 'Welcome !';

  @override
  String get accountCreatedSuccess => 'You have create account successfully.';

  @override
  String get welcomeBackTitle => 'Welcome Back!';

  @override
  String get loggedInSuccess => 'You have logged in successfully.';

  @override
  String get userRole => 'User';

  @override
  String get showroomRole => 'Showroom';

  @override
  String get licenseNumberEmptyError => 'Please enter license number';

  @override
  String get commercialLicenseNumberHint => 'Commercial License Number';

  @override
  String get addressEmptyError => 'Please enter address';

  @override
  String get showroomAddressHint => 'Showroom Address';

  @override
  String get passwordResetEmailSent =>
      'Password reset email sent successfully!';

  @override
  String get send => 'Send';

  @override
  String get somethingWentWrong => 'Something went wrong';

  @override
  String get phoneNumber => 'Phone Number';

  @override
  String get verification => 'Verification';

  @override
  String get verificationPrompt => 'To use our services , we need to verify :';

  @override
  String get phoneNumberRequired => 'Phone Number *';

  @override
  String get commercialLicenseRequired => 'Commercial license*';

  @override
  String get notAvailable => 'N/A';

  @override
  String get goToHome => 'Go to Home';

  @override
  String get completeVerification => 'Complete Verification';

  @override
  String get verified => 'Verified';

  @override
  String get verify => 'Verify';

  @override
  String get emptyName => 'Please Enter Your Name';

  @override
  String get emptyMobile => 'Please Enter Your Mobile Number';

  @override
  String get emptyEmail => 'Please Enter Your Email Address';

  @override
  String get incorrectEmail => 'Please Enter A Valid Email Address';

  @override
  String get emptyPassword => 'Please Enter Your Password';

  @override
  String get incorrectPassword => 'Password must be at least 6 characters long';

  @override
  String fieldCannotBeEmpty(Object fieldName) {
    return '$fieldName cannot be empty';
  }

  @override
  String get drivingLicenseEmpty => 'Driving License No cannot be empty';

  @override
  String get drivingLicenseMustBeNumber =>
      'Driving License No must be a number';

  @override
  String get drivingLicenseTooLong =>
      'Driving License No must be less than 10 digits';

  @override
  String get idNumberEmpty => 'ID Number cannot be empty';

  @override
  String get idNumberMustBeNumber => 'ID Number must be a number';

  @override
  String get idNumberTooLong => 'ID Number must be less than 9 digits';

  @override
  String get mobileStartWithCountryCode =>
      'Phone number must start with a country code (e.g. +971)';

  @override
  String get invalidMobile => 'Please enter a valid phone number';

  @override
  String get passwordSameAsCurrent =>
      'New password cannot be the same as current';

  @override
  String get passwordsDoNotMatch => 'Passwords do not match';

  @override
  String get home => 'Home';

  @override
  String get explore => 'Explore';

  @override
  String get add => 'Add';

  @override
  String get history => 'History';

  @override
  String get profile => 'Profile';

  @override
  String get locationServicesDisabled => 'Location services are disabled.';

  @override
  String get locationPermissionsDenied => 'Location permissions are denied';

  @override
  String get locationPermissionsPermanentlyDenied =>
      'Location permissions are permanently denied, we cannot request permissions.';

  @override
  String get unknownLocation => 'Unknown Location';

  @override
  String get notificationChannelName => 'High Importance Notifications';

  @override
  String get notificationChannelDescription =>
      'This channel is used for important notifications.';

  @override
  String get urlLaunchError => 'Could not launch app. Is it installed?';

  @override
  String get commercial => 'Commercial';

  @override
  String get selectVehicleImageError => 'Please select a vehicle image';

  @override
  String get uploadImageError => 'Failed to upload image to Drive';

  @override
  String get showroomDefaultName => 'Showroom';

  @override
  String get individualSellerLabel => 'Individual Seller';

  @override
  String get adUpdatedTitle => 'Advertisement Updated';

  @override
  String get adPostedTitle => 'Advertisement Posted';

  @override
  String adUpdatedBody(Object brand) {
    return 'Your car advertisement for $brand has been successfully updated.';
  }

  @override
  String adPostedBody(Object brand) {
    return 'Your car advertisement for $brand has been successfully posted.';
  }

  @override
  String get selectAdTypePrompt => 'Please select the advertising type';

  @override
  String get commercialAdLabel => 'Commercial ad';

  @override
  String get featured => 'Featured';

  @override
  String get featuredAdLabel => 'Featured ad';

  @override
  String get featuredAdDescription =>
      'Featured advertising enables you to connect with the widest range of users.';

  @override
  String get carInformation => 'Car Information';

  @override
  String get carBrandHint => 'Car Brand';

  @override
  String get carModelHint => 'Car Model';

  @override
  String get year => 'Year';

  @override
  String get condition => 'Condition';

  @override
  String get tankSize => 'Tank Size';

  @override
  String get gearBox => 'Gear box';

  @override
  String get seats => 'Seats';

  @override
  String get doors => 'Doors';

  @override
  String get mileage => 'Mileage';

  @override
  String get brandLabel => 'Brand';

  @override
  String get modelLabel => 'Model';

  @override
  String get contactInformation => 'Contact Information:';

  @override
  String get nameHint => 'Name';

  @override
  String get phoneNumberHint => 'Phone Number';

  @override
  String get description => 'Description';

  @override
  String get descriptionHint => 'Provide a brief description of your car';

  @override
  String get uploadPhotos => 'Upload Photos';

  @override
  String get uploadPhotosDescription =>
      'Add high-quality photos to showcase your car';

  @override
  String get saveChanges => 'SAVE CHANGES';

  @override
  String get postAd => 'POST ADVERTISEMENT';

  @override
  String get selectAdPurposePrompt => 'Please select the advertising purpose';

  @override
  String get carForSale => 'Car for sale';

  @override
  String get carForRent => 'Car for rent';

  @override
  String get rentalDuration => 'Rental Duration';

  @override
  String get days => 'Days';

  @override
  String get weeks => 'Weeks';

  @override
  String get months => 'Months';

  @override
  String get availableFrom => 'Available From';

  @override
  String get availableUntil => 'Available Until';

  @override
  String get fillRentalDatesError => 'Please fill all rental dates and times';

  @override
  String get adUpdatedSuccess => 'Advertisement updated successfully!';

  @override
  String get adPostedSuccess => 'Advertisement posted successfully!';

  @override
  String get editAdTitle => 'Edit Your Advertisement';

  @override
  String get postAdTitle => 'Post Your Advertisement';

  @override
  String get addPriceHint => 'Add Price';

  @override
  String get priceEmptyError => 'Price cannot be empty';

  @override
  String get price => 'Price';

  @override
  String get noSuggestedAds => 'No suggested ads available for this car.';

  @override
  String get allCars => 'All Cars';

  @override
  String get all => 'All';

  @override
  String loadCarsFailed(Object error) {
    return 'Failed to load cars: $error';
  }

  @override
  String get allCategories => 'All Categories';

  @override
  String get brands => 'Brands';

  @override
  String get toyota => 'Toyota';

  @override
  String get audi => 'Audi';

  @override
  String get hyundai => 'Hyundai';

  @override
  String get mazda => 'Mazda';

  @override
  String get noName => 'No Name';

  @override
  String get thousandSuffix => 'K';

  @override
  String get aedPerDay => 'AED/Day';

  @override
  String get aed => 'AED';

  @override
  String get noAdsMatchingFilters => 'No ads matching your filters';

  @override
  String resultsFor(Object query) {
    return 'Results for \"$query\"';
  }

  @override
  String itemsFound(Object count) {
    return '$count found';
  }

  @override
  String get recentSearchesTitle => 'Recent';

  @override
  String get clearAll => 'Clear All';

  @override
  String get startSearchHint => 'Start your search ...';

  @override
  String get apply => 'Apply';

  @override
  String get reset => 'Reset';

  @override
  String get filterTitle => 'Filter';

  @override
  String get carBrands => 'Car Brands';

  @override
  String get carCondition => 'Car Condition';

  @override
  String get newCondition => 'New';

  @override
  String get usedCondition => 'Used';

  @override
  String get mileageTitle => 'Mileage';

  @override
  String get selectMileageRange => 'Select Mileage Range:';

  @override
  String get startMileageHint => 'Start Mileage';

  @override
  String get endMileageHint => 'End Mileage';

  @override
  String get priceRange => 'Price Range';

  @override
  String get yearTitle => 'Year';

  @override
  String get selectYearRange => 'Select Year Range:';

  @override
  String get startYearHint => 'Start Year';

  @override
  String get endYearHint => 'End Year';

  @override
  String errorFetchingShowroom(Object error) {
    return 'Error fetching showroom: $error';
  }

  @override
  String get rentalButton => 'Rental';

  @override
  String get buyButton => 'Buy ';

  @override
  String get agreeTermsError =>
      'You must agree to the rental terms to proceed.';

  @override
  String get rentalInformation => 'Rental Information:';

  @override
  String get location => 'Location';

  @override
  String get noDescription => 'No description available.';

  @override
  String get rentalTerms => 'Rental terms';

  @override
  String get dummyTermsText =>
      'Lorem ipsum dolor sit amet consectetur. Consectetur pharetra proin sed nisi vitae purus vivamus in. Ornare pellentesque vivamus elementum lorem velit eget mauris senectus fusce.';

  @override
  String get agreeRentalTermsPrompt => 'Do you agree to the rental terms';

  @override
  String get seller => 'Seller';

  @override
  String get suggestedAds => 'Suggested Ads';

  @override
  String get showroomDetails => 'Showroom Details';

  @override
  String get addressNotAvailable => 'Address not available';

  @override
  String get aboutShowroom => 'About showroom';

  @override
  String showroomAds(Object showroomName) {
    return '$showroomName Ads';
  }

  @override
  String get orderHistoryTitle => 'Order History';

  @override
  String get noHistoryFound => 'No orders found in your history.';

  @override
  String get clearHistoryPrompt =>
      'Are you sure you want to clear all history?';

  @override
  String get orderStatus => 'Status';

  @override
  String get orderDate => 'Order Date';

  @override
  String get unknownCar => 'Unknown Car';

  @override
  String get statusPending => 'Pending';

  @override
  String get statusConfirmed => 'Confirmed';

  @override
  String get statusRejected => 'Rejected';

  @override
  String get clearHistoryTitle => 'Clear Your History';

  @override
  String get clearHistoryWarning =>
      'Are you sure you want to clear your history? This action cannot be undone, so proceed with caution.';

  @override
  String get confirmClearHistory => 'YES, CLEAR IT';

  @override
  String get cancelClearHistory => 'NO, I CHANGED MY MIND!';

  @override
  String get statusActive => 'Active';

  @override
  String get statusCanceled => 'Canceled';

  @override
  String get statusEnded => 'Ended';

  @override
  String get orderDateLabel => 'Order Date :';

  @override
  String get statusLabel => 'Status :';

  @override
  String get loginRequired => 'Please log in first.';

  @override
  String get noHistoryYet => 'No history yet.';

  @override
  String welcomeUser(Object userName) {
    return 'Welcome $userName';
  }

  @override
  String get userPlaceholder => 'User';

  @override
  String get noShowroomsFound => 'No showrooms found';

  @override
  String get topRatedShowroom => 'Top rated Showroom';

  @override
  String get unknown => 'Unknown';

  @override
  String seatsCount(Object count) {
    return '$count seats';
  }

  @override
  String get requests => 'Requests';

  @override
  String get notificationsTitle => 'Notifications';

  @override
  String get userNotLoggedIn => 'User not logged in.';

  @override
  String errorWithDetails(Object error) {
    return 'Error: $error';
  }

  @override
  String get noNotificationsYet => 'No notifications yet.';

  @override
  String get faqsTitle => 'FAQ\'S';

  @override
  String get faqHeader => 'Have Questions? We Have Answers!';

  @override
  String get faqQuestion1 => 'How do I book a car?';

  @override
  String get faqAnswer1 =>
      'You can book a car by browsing our car listings, selecting a car that fits your needs, and following the checkout process to confirm your rental.';

  @override
  String get faqQuestion2 => 'What documents are required for rental?';

  @override
  String get faqAnswer2 =>
      'Typically, you will need a valid driving license, a national ID or passport, and in some cases, a credit card for the security deposit.';

  @override
  String get faqQuestion3 => 'Can I cancel my booking?';

  @override
  String get faqAnswer3 =>
      'Yes, bookings can be cancelled through the history section. Please review our cancellation policy for information on potential fees.';

  @override
  String get faqQuestion4 => 'Is insurance included?';

  @override
  String get faqAnswer4 =>
      'Most rentals include basic insurance. You can opt for additional coverage during the checkout process for extra peace of mind.';

  @override
  String get faqQuestion5 => 'How do I contact customer support?';

  @override
  String get faqAnswer5 =>
      'You can reach our support team via the contact details provided in the app or through the support section in your profile.';

  @override
  String get privacyPolicyTitle => 'Privacy Policy';

  @override
  String get privacyPolicyIntro =>
      'At Car Ads, we are committed to safeguarding your privacy and ensuring the security of your personal information. This Privacy Policy outlines how we collect, use, and protect your data when you use our mobile application.';

  @override
  String get termsConditionsTitle => 'Terms & Conditions';

  @override
  String get privacySectionTitle1 => '1. Information Collection and Use:';

  @override
  String get privacySectionContent1 =>
      'We may collect certain personal information from you, such as your name, email address, and contact details when you sign up or use our services. This information is used to personalize your experience, improve our services, and communicate with you.';

  @override
  String get privacySectionTitle2 => '2. Log Data:';

  @override
  String get privacySectionContent2 =>
      'When you use our app, we may collect information that your mobile device sends, such as your device ID, IP address, device name, and operating system version. This data is used for app performance analysis and to enhance user experience.';

  @override
  String get privacySectionTitle3 => '3. Cookies and Similar Technologies:';

  @override
  String get privacySectionContent3 =>
      'We may use cookies and similar tracking technologies to track the activity on our application and hold certain information. You can instruct your browser to refuse all cookies or to indicate when a cookie is being sent.';

  @override
  String get privacySectionTitle4 => '4. Service Providers:';

  @override
  String get privacySectionContent4 =>
      'We may employ third-party companies and individuals to facilitate our services, perform service-related tasks, or assist us in analyzing how our application is used. These third parties have access to your personal information only to perform these tasks on our behalf.';

  @override
  String get privacySectionTitle5 => '5. Security:';

  @override
  String get privacySectionContent5 =>
      'The security of your personal information is important to us. We strive to use commercially acceptable means to protect your personal information, but please remember that no method of transmission over the internet or electronic storage is 100% secure.';

  @override
  String get privacySectionTitle6 => '6. Links to Other Sites:';

  @override
  String get privacySectionContent6 =>
      'Our application may contain links to other sites that are not operated by us. If you click on a third-party link, you will be directed to that third party\'s site. We strongly advise you to review the Privacy Policy of every site you visit.';

  @override
  String get privacySectionTitle7 => '7. Changes to This Privacy Policy:';

  @override
  String get privacySectionContent7 =>
      'We may update our Privacy Policy from time to time. We will notify you of any changes by posting the new Privacy Policy on this page. You are advised to review this Privacy Policy periodically for any changes.';

  @override
  String get emailVerificationSent =>
      'A verification link has been sent to your new email. Please verify it and log in again.';

  @override
  String get emailChangeRequestedTitle => 'Email Change Requested';

  @override
  String emailChangeRequestedBody(Object newEmail) {
    return 'A request to change your email to $newEmail has been initiated.';
  }

  @override
  String get emailAlreadyInUse =>
      'This email is already in use by another account.';

  @override
  String get invalidEmailFormat => 'The email address is badly formatted.';

  @override
  String get sessionExpired => 'User session not found. Please log in again.';

  @override
  String get recentLoginRequired =>
      'For security reasons, please log in again before changing your email.';

  @override
  String get updateEmailError =>
      'An error occurred while updating your email. Please try again.';

  @override
  String get passwordChangedTitle => 'Password Changed';

  @override
  String get passwordChangedBody =>
      'Your account password has been changed successfully.';

  @override
  String get tooManyAttempts =>
      'Too many attempts. Please try again later or reset your password.';

  @override
  String get anErrorOccurred => 'An error occurred';

  @override
  String get verificationFailed => 'Verification failed';

  @override
  String get enterOtpError => 'Please enter the 6-digit OTP code';

  @override
  String get phoneUpdatedTitle => 'Phone Number Updated';

  @override
  String phoneUpdatedBody(Object newPhone) {
    return 'Your phone number has been updated to $newPhone successfully.';
  }

  @override
  String get phoneUpdatedSuccess => 'Phone number updated successfully!';

  @override
  String get language => 'Language';

  @override
  String get selectLanguage => 'Select Language';

  @override
  String get english => 'English';

  @override
  String get arabic => 'Arabic';

  @override
  String get profileImageUploadError =>
      'Failed to upload profile image. Please try again.';

  @override
  String get profileUpdatedTitle => 'Profile Updated';

  @override
  String get profileUpdatedBody =>
      'Your profile information has been updated successfully.';

  @override
  String get profileUpdatedSuccess => 'Profile updated successfully!';

  @override
  String get updateFailed => 'Update failed';

  @override
  String get changeEmailTitle => 'Change Your Email';

  @override
  String get dataSecurityMessage => 'Your data is kept secure by us!';

  @override
  String get addCurrentEmailPrompt => 'Add your Current Email Address';

  @override
  String get currentEmailHint => 'Current Email Address';

  @override
  String get currentPasswordHint => 'Current Password';

  @override
  String get passwordRequiredError => 'Password is required';

  @override
  String get continueButton => 'Continue';

  @override
  String get changeLanguageTitle => 'Change Language';

  @override
  String get selectLanguageComfortable => 'Select your comfortable language!';

  @override
  String get resetYourPasswordTitle => 'Reset Your Password';

  @override
  String get newPasswordHint => 'New Password';

  @override
  String get confirmPasswordHint => 'Confirm Password';

  @override
  String get resetPasswordButton => 'Reset Your Password';

  @override
  String get changePhoneTitle => 'Change Phone';

  @override
  String get enterNewMobilePrompt =>
      'Enter your new mobile number to receive an OTP code.';

  @override
  String get mobileNumberLabel => 'Mobile Number';

  @override
  String get phoneHint => '+971 XXXXXXXXX';

  @override
  String get enterPhoneError => 'Please enter your phone number';

  @override
  String get includeCountryCodeError =>
      'Please include country code (e.g., +971)';

  @override
  String get sendOtpButton => 'Send OTP';

  @override
  String get wellDoneTitle => 'Well Done';

  @override
  String get changesSavedSuccess =>
      'Congratulations! Your changes have been saved successfully!';

  @override
  String get backToProfileButton => 'Back To Profile';

  @override
  String get allDone => 'All Done !';

  @override
  String get addNewEmailPrompt => 'Add your New Email Address';

  @override
  String get newEmailHint => 'New Email Address';

  @override
  String get resetEmailButton => 'Reset Your Email';

  @override
  String get yourProfileTitle => 'Your Profile';

  @override
  String get loading => 'Loading...';

  @override
  String get paymentMethods => 'Payment Methods';

  @override
  String get changeYourEmailMenu => 'Change Your Email';

  @override
  String get changeYourPhoneMenu => 'Change Your Phone Number';

  @override
  String get changeYourPasswordMenu => 'Change Your Password';

  @override
  String get logout => 'Logout';

  @override
  String get updateProfileTitle => 'Update Your Profile';

  @override
  String get fullNameLabel => 'Full Name';

  @override
  String get enterNameHint => 'Enter your name';

  @override
  String get enterNameError => 'Please enter your name';

  @override
  String get verifyOtpTitle => 'Verify OTP';

  @override
  String enterOtpSentTo(Object phoneNumber) {
    return 'Enter the 6-digit code sent to $phoneNumber';
  }

  @override
  String get verifyAndUpdate => 'Verify & Update';

  @override
  String get uploadNewPicture => 'Upload New Picture';

  @override
  String get unknownUser => 'Unknown User';

  @override
  String get paymentFailedError =>
      'Payment failed or was cancelled. Please try again.';

  @override
  String get rentalRequestReceivedTitle => 'Rental Request Received';

  @override
  String rentalRequestReceivedBody(Object carName) {
    return 'Your rental request for $carName has been successfully submitted.';
  }

  @override
  String get newRentalRequestTitle => 'New Rental Request!';

  @override
  String newRentalRequestShowroomBody(Object carName) {
    return 'A user has requested to rent $carName. Check your orders.';
  }

  @override
  String get orderDetailsNotFound => 'Order details not found.';

  @override
  String get loadingLocation => 'Loading Location...';

  @override
  String get tapMapToSelectLocation => 'Tap on the map to select a location.';

  @override
  String get couldNotDetermineAddress =>
      'Could not determine address. Please try again.';

  @override
  String get pleaseSelectLocationOnMap => 'Please select a location on the map';

  @override
  String get unableToDetermineLocation => 'Unable to determine your location.';

  @override
  String get checkoutTitle => 'Checkout';

  @override
  String carAvailableFromError(Object time) {
    return 'Car is only available from $time on this day.';
  }

  @override
  String carReturnByError(Object time) {
    return 'Car must be returned by $time on the final day.';
  }

  @override
  String get completeRentalPeriodError =>
      'Please select the complete rental period (Dates and Times).';

  @override
  String get confirmRentalButton => 'Confirm Rental';

  @override
  String get confirmPurchaseButton => 'Confirm Purchase';

  @override
  String get confirmBuyTitle => 'Confirm Purchase';

  @override
  String get rentalReceiptTitle => 'Rental Receipt';

  @override
  String get purchaseReceiptTitle => 'Purchase Receipt';

  @override
  String get confirmRentTitle => 'Confirm Rent';

  @override
  String get yourLocationLabel => 'Your Location';

  @override
  String get noAddressProvided => 'No address provided';

  @override
  String get orderLabel => 'Order';

  @override
  String get drivingLicenseNoHint => 'Driving License No';

  @override
  String get idNumberHint => 'ID Number';

  @override
  String get rentalCompletedTitle => 'Rental Completed';

  @override
  String get rentalCompletedMessage =>
      'Your car rental request has been received, and we will get back to you as soon as we can. Please keep an eye out for notifications to stay updated.';

  @override
  String get carSummaryTitle => 'Car Summary';

  @override
  String get selectDateHint => 'Select Date';

  @override
  String get selectTimeHint => 'Select Time';

  @override
  String get priceDetailsTitle => 'Price Details';

  @override
  String get amountLabel => 'Amount';

  @override
  String get shippingLabel => 'Shipping';

  @override
  String get taxLabel => 'Tax';

  @override
  String get totalPaymentLabel => 'Total payment';

  @override
  String get rentalFrom => 'Rental From';

  @override
  String get rentalUntil => 'Rental Until';

  @override
  String get setLocationButton => 'Set Location';

  @override
  String get requestDeniedTitle => 'We apologize, the request was denied';

  @override
  String requestDeniedBody(Object carName) {
    return 'Car rental request $carName rejected by the showroom.';
  }

  @override
  String get rentalAcceptedTitle => 'The rental request has been accepted';

  @override
  String get purchaseAcceptedTitle => 'The purchase request has been accepted';

  @override
  String rentalAcceptedBody(Object carName) {
    return 'The showroom has accepted a request to rent a car $carName. You can review the details in the record.';
  }

  @override
  String purchaseAcceptedBody(Object carName) {
    return 'The showroom has accepted your request to buy $carName. The transaction is now complete.';
  }

  @override
  String get orderCompletedTitle => 'Order Completed';

  @override
  String orderCompletedBody(Object carName) {
    return 'Your rental for $carName has been marked as completed. Thank you for using our service!';
  }

  @override
  String pickImageError(Object error) {
    return 'Failed to pick image: $error';
  }

  @override
  String get selectImageFirstError => 'Please select an image first';

  @override
  String get uploadFailedError => 'Upload failed. Please try again.';

  @override
  String get verifyCommercialLicenseTitle => 'Verify Your Commercial License';

  @override
  String get verifyCommercialLicenseDescription =>
      'To ensure the authenticity of your business, please verify your commercial license.';

  @override
  String get uploadLicenseImageLabel =>
      'Upload an Image of Your Commercial License';

  @override
  String get uploadFileLabel => 'Upload a File';

  @override
  String get gallery => 'Gallery';

  @override
  String get camera => 'Camera';

  @override
  String get requestDetailsTitle => 'Request Details';

  @override
  String requestUpdatedSuccess(Object status) {
    return 'Request $status successfully';
  }

  @override
  String requestUpdateError(Object error) {
    return 'Failed to update request: $error';
  }

  @override
  String get requestByLabel => 'Request By : ';

  @override
  String get requestDateLabel => 'The date of request : ';

  @override
  String get drivingLicenseLabel => 'Driving License No : ';

  @override
  String get idNumberLabel => 'ID Number : ';

  @override
  String get phoneNumberLabel => 'Phone Number : ';

  @override
  String get acceptRequestButton => 'Accept Request';

  @override
  String get rejectRequestButton => 'Reject Request';

  @override
  String get loginAsShowroomError => 'Please log in as a showroom.';

  @override
  String get noRentRequestsYet => 'No rent requests yet.';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get salesProfit => 'Sales profit';

  @override
  String get rentProfit => 'Rent profit';

  @override
  String get last5RentRequests => 'Last 5 Rent Request';

  @override
  String get manageYourAds => 'Manage your Ads!';

  @override
  String get noAdsPostedYet => 'No ads posted yet.';

  @override
  String get adDeletedSuccess => 'Advertisement deleted successfully';

  @override
  String get adDeletedTitle => 'Advertisement Deleted';

  @override
  String adDeletedBody(Object carName) {
    return 'Your car advertisement for $carName has been successfully deleted.';
  }

  @override
  String get deleteAdsTitle => 'Delete Your Ads';

  @override
  String get deleteAdConfirmationPrompt =>
      'Are you sure you want to delete this advertisement?';

  @override
  String get confirmDeleteAd => 'YES, DELETE IT';

  @override
  String get keepAd => 'NO, KEEP IT';

  @override
  String percentageDisplay(Object sign, Object value) {
    return '$sign$value%';
  }

  @override
  String get seeAll => 'See All';

  @override
  String get noRecentRequests => 'No recent requests';

  @override
  String get perDay => '/Day';

  @override
  String requestBy(Object name) {
    return 'Request By : $name';
  }

  @override
  String requestDate(Object date) {
    return 'The date of request : $date';
  }

  @override
  String get deleteAds => 'Delete Ads';

  @override
  String get editAds => 'Edit Ads';

  @override
  String dateLabel(Object date) {
    return 'Date : $date';
  }

  @override
  String get manageShowroomToday => 'Manage your showroom today';

  @override
  String get shippingAddressLabel => 'Shipping Address';

  @override
  String get merchantName => 'CarAds Inc.';
}
