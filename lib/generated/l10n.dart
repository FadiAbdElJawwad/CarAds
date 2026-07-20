// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Page home confirm`
  String get pageHomeConfirm {
    return Intl.message(
      'Page home confirm',
      name: 'pageHomeConfirm',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to CarAds App`
  String get splashTitle {
    return Intl.message(
      'Welcome to CarAds App',
      name: 'splashTitle',
      desc: '',
      args: [],
    );
  }

  /// `Your Gateway to Car Showrooms and Rental Offices`
  String get splashBody {
    return Intl.message(
      'Your Gateway to Car Showrooms and Rental Offices',
      name: 'splashBody',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to CarAds App`
  String get onbordingModelTitle1 {
    return Intl.message(
      'Welcome to CarAds App',
      name: 'onbordingModelTitle1',
      desc: '',
      args: [],
    );
  }

  /// `CarAds is your ultimate destination for car showrooms and rental offices advertising. Whether you're a car showroom owner or looking to rent a vehicle, our platform has got you covered!`
  String get onbordingModelBody1 {
    return Intl.message(
      'CarAds is your ultimate destination for car showrooms and rental offices advertising. Whether you\'re a car showroom owner or looking to rent a vehicle, our platform has got you covered!',
      name: 'onbordingModelBody1',
      desc: '',
      args: [],
    );
  }

  /// `Effortless Ads Management`
  String get onbordingModelTitle2 {
    return Intl.message(
      'Effortless Ads Management',
      name: 'onbordingModelTitle2',
      desc: '',
      args: [],
    );
  }

  /// `Are you a car showroom or rental office owner? Create your special account now! Easily manage and promote your ads within a few taps. Reach a broader audience, receive inquiries with CarAds`
  String get onbordingModelBody2 {
    return Intl.message(
      'Are you a car showroom or rental office owner? Create your special account now! Easily manage and promote your ads within a few taps. Reach a broader audience, receive inquiries with CarAds',
      name: 'onbordingModelBody2',
      desc: '',
      args: [],
    );
  }

  /// `Explore Your Options`
  String get onbordingModelTitle3 {
    return Intl.message(
      'Explore Your Options',
      name: 'onbordingModelTitle3',
      desc: '',
      args: [],
    );
  }

  /// `Discover a wide range of car advertisements tailored to your preferences. Browse through various car models, rental offers, and exclusive deals from local showrooms. With CarAds`
  String get onbordingModelBody3 {
    return Intl.message(
      'Discover a wide range of car advertisements tailored to your preferences. Browse through various car models, rental offers, and exclusive deals from local showrooms. With CarAds',
      name: 'onbordingModelBody3',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message('Next', name: 'next', desc: '', args: []);
  }

  /// `Skip`
  String get skip {
    return Intl.message('Skip', name: 'skip', desc: '', args: []);
  }

  /// `Join Now As A User`
  String get userJoin {
    return Intl.message(
      'Join Now As A User',
      name: 'userJoin',
      desc: '',
      args: [],
    );
  }

  /// `Join Now As A Showrooms`
  String get showroomsJoin {
    return Intl.message(
      'Join Now As A Showrooms',
      name: 'showroomsJoin',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message('Login', name: 'login', desc: '', args: []);
  }

  /// `Welcome Back to CarAds!`
  String get loginTitle {
    return Intl.message(
      'Welcome Back to CarAds!',
      name: 'loginTitle',
      desc: '',
      args: [],
    );
  }

  /// `Sign in to your account and get back on track with CarAds`
  String get loginBody {
    return Intl.message(
      'Sign in to your account and get back on track with CarAds',
      name: 'loginBody',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get dontHaveAccount {
    return Intl.message(
      'Don\'t have an account?',
      name: 'dontHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signUp {
    return Intl.message('Sign Up', name: 'signUp', desc: '', args: []);
  }

  /// `Join CarAds Today!`
  String get signUpTitle {
    return Intl.message(
      'Join CarAds Today!',
      name: 'signUpTitle',
      desc: '',
      args: [],
    );
  }

  /// `Create your account and become a part of CarAds community's`
  String get signUpBody {
    return Intl.message(
      'Create your account and become a part of CarAds community\'s',
      name: 'signUpBody',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get alreadyHaveAccount {
    return Intl.message(
      'Already have an account?',
      name: 'alreadyHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Your Password?`
  String get forgotPassword {
    return Intl.message(
      'Forgot Your Password?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `No worries! We'll help you reset your password. Just enter your registered Phone Number, and we'll send you a code to reset your password.`
  String get forgotPasswordBody {
    return Intl.message(
      'No worries! We\'ll help you reset your password. Just enter your registered Phone Number, and we\'ll send you a code to reset your password.',
      name: 'forgotPasswordBody',
      desc: '',
      args: [],
    );
  }

  /// `Email Address`
  String get email {
    return Intl.message('Email Address', name: 'email', desc: '', args: []);
  }

  /// `Full Name`
  String get name {
    return Intl.message('Full Name', name: 'name', desc: '', args: []);
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Invalid email or password.`
  String get invalidCredential {
    return Intl.message(
      'Invalid email or password.',
      name: 'invalidCredential',
      desc: '',
      args: [],
    );
  }

  /// `Invalid email.`
  String get invalidEmail {
    return Intl.message(
      'Invalid email.',
      name: 'invalidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Authentication error`
  String get authenticationError {
    return Intl.message(
      'Authentication error',
      name: 'authenticationError',
      desc: '',
      args: [],
    );
  }

  /// `The password provided is too weak.`
  String get weakPassword {
    return Intl.message(
      'The password provided is too weak.',
      name: 'weakPassword',
      desc: '',
      args: [],
    );
  }

  /// `The account already exists for that email.`
  String get usedEmail {
    return Intl.message(
      'The account already exists for that email.',
      name: 'usedEmail',
      desc: '',
      args: [],
    );
  }

  /// `User not authenticated`
  String get userNotAuthenticated {
    return Intl.message(
      'User not authenticated',
      name: 'userNotAuthenticated',
      desc: '',
      args: [],
    );
  }

  /// `User must be logged in to update email.`
  String get updateEmailLoginRequired {
    return Intl.message(
      'User must be logged in to update email.',
      name: 'updateEmailLoginRequired',
      desc: '',
      args: [],
    );
  }

  /// `The current password you entered is incorrect.`
  String get incorrectCurrentPassword {
    return Intl.message(
      'The current password you entered is incorrect.',
      name: 'incorrectCurrentPassword',
      desc: '',
      args: [],
    );
  }

  /// `Welcome !`
  String get welcomeTitle {
    return Intl.message('Welcome !', name: 'welcomeTitle', desc: '', args: []);
  }

  /// `You have create account successfully.`
  String get accountCreatedSuccess {
    return Intl.message(
      'You have create account successfully.',
      name: 'accountCreatedSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Welcome Back!`
  String get welcomeBackTitle {
    return Intl.message(
      'Welcome Back!',
      name: 'welcomeBackTitle',
      desc: '',
      args: [],
    );
  }

  /// `You have logged in successfully.`
  String get loggedInSuccess {
    return Intl.message(
      'You have logged in successfully.',
      name: 'loggedInSuccess',
      desc: '',
      args: [],
    );
  }

  /// `User`
  String get userRole {
    return Intl.message('User', name: 'userRole', desc: '', args: []);
  }

  /// `Showroom`
  String get showroomRole {
    return Intl.message('Showroom', name: 'showroomRole', desc: '', args: []);
  }

  /// `Please enter license number`
  String get licenseNumberEmptyError {
    return Intl.message(
      'Please enter license number',
      name: 'licenseNumberEmptyError',
      desc: '',
      args: [],
    );
  }

  /// `Commercial License Number`
  String get commercialLicenseNumberHint {
    return Intl.message(
      'Commercial License Number',
      name: 'commercialLicenseNumberHint',
      desc: '',
      args: [],
    );
  }

  /// `Please enter address`
  String get addressEmptyError {
    return Intl.message(
      'Please enter address',
      name: 'addressEmptyError',
      desc: '',
      args: [],
    );
  }

  /// `Showroom Address`
  String get showroomAddressHint {
    return Intl.message(
      'Showroom Address',
      name: 'showroomAddressHint',
      desc: '',
      args: [],
    );
  }

  /// `Password reset email sent successfully!`
  String get passwordResetEmailSent {
    return Intl.message(
      'Password reset email sent successfully!',
      name: 'passwordResetEmailSent',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get send {
    return Intl.message('Send', name: 'send', desc: '', args: []);
  }

  /// `Something went wrong`
  String get somethingWentWrong {
    return Intl.message(
      'Something went wrong',
      name: 'somethingWentWrong',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phoneNumber {
    return Intl.message(
      'Phone Number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Verification`
  String get verification {
    return Intl.message(
      'Verification',
      name: 'verification',
      desc: '',
      args: [],
    );
  }

  /// `To use our services , we need to verify :`
  String get verificationPrompt {
    return Intl.message(
      'To use our services , we need to verify :',
      name: 'verificationPrompt',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number *`
  String get phoneNumberRequired {
    return Intl.message(
      'Phone Number *',
      name: 'phoneNumberRequired',
      desc: '',
      args: [],
    );
  }

  /// `Commercial license*`
  String get commercialLicenseRequired {
    return Intl.message(
      'Commercial license*',
      name: 'commercialLicenseRequired',
      desc: '',
      args: [],
    );
  }

  /// `N/A`
  String get notAvailable {
    return Intl.message('N/A', name: 'notAvailable', desc: '', args: []);
  }

  /// `Go to Home`
  String get goToHome {
    return Intl.message('Go to Home', name: 'goToHome', desc: '', args: []);
  }

  /// `Complete Verification`
  String get completeVerification {
    return Intl.message(
      'Complete Verification',
      name: 'completeVerification',
      desc: '',
      args: [],
    );
  }

  /// `Verified`
  String get verified {
    return Intl.message('Verified', name: 'verified', desc: '', args: []);
  }

  /// `Verify`
  String get verify {
    return Intl.message('Verify', name: 'verify', desc: '', args: []);
  }

  /// `Please Enter Your Name`
  String get emptyName {
    return Intl.message(
      'Please Enter Your Name',
      name: 'emptyName',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter Your Mobile Number`
  String get emptyMobile {
    return Intl.message(
      'Please Enter Your Mobile Number',
      name: 'emptyMobile',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter Your Email Address`
  String get emptyEmail {
    return Intl.message(
      'Please Enter Your Email Address',
      name: 'emptyEmail',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter A Valid Email Address`
  String get incorrectEmail {
    return Intl.message(
      'Please Enter A Valid Email Address',
      name: 'incorrectEmail',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter Your Password`
  String get emptyPassword {
    return Intl.message(
      'Please Enter Your Password',
      name: 'emptyPassword',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 6 characters long`
  String get incorrectPassword {
    return Intl.message(
      'Password must be at least 6 characters long',
      name: 'incorrectPassword',
      desc: '',
      args: [],
    );
  }

  /// `{fieldName} cannot be empty`
  String fieldCannotBeEmpty(Object fieldName) {
    return Intl.message(
      '$fieldName cannot be empty',
      name: 'fieldCannotBeEmpty',
      desc: '',
      args: [fieldName],
    );
  }

  /// `Driving License No cannot be empty`
  String get drivingLicenseEmpty {
    return Intl.message(
      'Driving License No cannot be empty',
      name: 'drivingLicenseEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Driving License No must be a number`
  String get drivingLicenseMustBeNumber {
    return Intl.message(
      'Driving License No must be a number',
      name: 'drivingLicenseMustBeNumber',
      desc: '',
      args: [],
    );
  }

  /// `Driving License No must be less than 10 digits`
  String get drivingLicenseTooLong {
    return Intl.message(
      'Driving License No must be less than 10 digits',
      name: 'drivingLicenseTooLong',
      desc: '',
      args: [],
    );
  }

  /// `ID Number cannot be empty`
  String get idNumberEmpty {
    return Intl.message(
      'ID Number cannot be empty',
      name: 'idNumberEmpty',
      desc: '',
      args: [],
    );
  }

  /// `ID Number must be a number`
  String get idNumberMustBeNumber {
    return Intl.message(
      'ID Number must be a number',
      name: 'idNumberMustBeNumber',
      desc: '',
      args: [],
    );
  }

  /// `ID Number must be less than 9 digits`
  String get idNumberTooLong {
    return Intl.message(
      'ID Number must be less than 9 digits',
      name: 'idNumberTooLong',
      desc: '',
      args: [],
    );
  }

  /// `Phone number must start with a country code (e.g. +971)`
  String get mobileStartWithCountryCode {
    return Intl.message(
      'Phone number must start with a country code (e.g. +971)',
      name: 'mobileStartWithCountryCode',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid phone number`
  String get invalidMobile {
    return Intl.message(
      'Please enter a valid phone number',
      name: 'invalidMobile',
      desc: '',
      args: [],
    );
  }

  /// `New password cannot be the same as current`
  String get passwordSameAsCurrent {
    return Intl.message(
      'New password cannot be the same as current',
      name: 'passwordSameAsCurrent',
      desc: '',
      args: [],
    );
  }

  /// `Passwords do not match`
  String get passwordsDoNotMatch {
    return Intl.message(
      'Passwords do not match',
      name: 'passwordsDoNotMatch',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message('Home', name: 'home', desc: '', args: []);
  }

  /// `Explore`
  String get explore {
    return Intl.message('Explore', name: 'explore', desc: '', args: []);
  }

  /// `Add`
  String get add {
    return Intl.message('Add', name: 'add', desc: '', args: []);
  }

  /// `History`
  String get history {
    return Intl.message('History', name: 'history', desc: '', args: []);
  }

  /// `Profile`
  String get profile {
    return Intl.message('Profile', name: 'profile', desc: '', args: []);
  }

  /// `Location services are disabled.`
  String get locationServicesDisabled {
    return Intl.message(
      'Location services are disabled.',
      name: 'locationServicesDisabled',
      desc: '',
      args: [],
    );
  }

  /// `Location permissions are denied`
  String get locationPermissionsDenied {
    return Intl.message(
      'Location permissions are denied',
      name: 'locationPermissionsDenied',
      desc: '',
      args: [],
    );
  }

  /// `Location permissions are permanently denied, we cannot request permissions.`
  String get locationPermissionsPermanentlyDenied {
    return Intl.message(
      'Location permissions are permanently denied, we cannot request permissions.',
      name: 'locationPermissionsPermanentlyDenied',
      desc: '',
      args: [],
    );
  }

  /// `Unknown Location`
  String get unknownLocation {
    return Intl.message(
      'Unknown Location',
      name: 'unknownLocation',
      desc: '',
      args: [],
    );
  }

  /// `High Importance Notifications`
  String get notificationChannelName {
    return Intl.message(
      'High Importance Notifications',
      name: 'notificationChannelName',
      desc: '',
      args: [],
    );
  }

  /// `This channel is used for important notifications.`
  String get notificationChannelDescription {
    return Intl.message(
      'This channel is used for important notifications.',
      name: 'notificationChannelDescription',
      desc: '',
      args: [],
    );
  }

  /// `Could not launch app. Is it installed?`
  String get urlLaunchError {
    return Intl.message(
      'Could not launch app. Is it installed?',
      name: 'urlLaunchError',
      desc: '',
      args: [],
    );
  }

  /// `Commercial`
  String get commercial {
    return Intl.message('Commercial', name: 'commercial', desc: '', args: []);
  }

  /// `Please select a vehicle image`
  String get selectVehicleImageError {
    return Intl.message(
      'Please select a vehicle image',
      name: 'selectVehicleImageError',
      desc: '',
      args: [],
    );
  }

  /// `Failed to upload image to Drive`
  String get uploadImageError {
    return Intl.message(
      'Failed to upload image to Drive',
      name: 'uploadImageError',
      desc: '',
      args: [],
    );
  }

  /// `Showroom`
  String get showroomDefaultName {
    return Intl.message(
      'Showroom',
      name: 'showroomDefaultName',
      desc: '',
      args: [],
    );
  }

  /// `Individual Seller`
  String get individualSellerLabel {
    return Intl.message(
      'Individual Seller',
      name: 'individualSellerLabel',
      desc: '',
      args: [],
    );
  }

  /// `Advertisement Updated`
  String get adUpdatedTitle {
    return Intl.message(
      'Advertisement Updated',
      name: 'adUpdatedTitle',
      desc: '',
      args: [],
    );
  }

  /// `Advertisement Posted`
  String get adPostedTitle {
    return Intl.message(
      'Advertisement Posted',
      name: 'adPostedTitle',
      desc: '',
      args: [],
    );
  }

  /// `Your car advertisement for {brand} has been successfully updated.`
  String adUpdatedBody(Object brand) {
    return Intl.message(
      'Your car advertisement for $brand has been successfully updated.',
      name: 'adUpdatedBody',
      desc: '',
      args: [brand],
    );
  }

  /// `Your car advertisement for {brand} has been successfully posted.`
  String adPostedBody(Object brand) {
    return Intl.message(
      'Your car advertisement for $brand has been successfully posted.',
      name: 'adPostedBody',
      desc: '',
      args: [brand],
    );
  }

  /// `Please select the advertising type`
  String get selectAdTypePrompt {
    return Intl.message(
      'Please select the advertising type',
      name: 'selectAdTypePrompt',
      desc: '',
      args: [],
    );
  }

  /// `Commercial ad`
  String get commercialAdLabel {
    return Intl.message(
      'Commercial ad',
      name: 'commercialAdLabel',
      desc: '',
      args: [],
    );
  }

  /// `Featured`
  String get featured {
    return Intl.message('Featured', name: 'featured', desc: '', args: []);
  }

  /// `Featured ad`
  String get featuredAdLabel {
    return Intl.message(
      'Featured ad',
      name: 'featuredAdLabel',
      desc: '',
      args: [],
    );
  }

  /// `Featured advertising enables you to connect with the widest range of users.`
  String get featuredAdDescription {
    return Intl.message(
      'Featured advertising enables you to connect with the widest range of users.',
      name: 'featuredAdDescription',
      desc: '',
      args: [],
    );
  }

  /// `Car Information`
  String get carInformation {
    return Intl.message(
      'Car Information',
      name: 'carInformation',
      desc: '',
      args: [],
    );
  }

  /// `Car Brand`
  String get carBrandHint {
    return Intl.message('Car Brand', name: 'carBrandHint', desc: '', args: []);
  }

  /// `Car Model`
  String get carModelHint {
    return Intl.message('Car Model', name: 'carModelHint', desc: '', args: []);
  }

  /// `Year`
  String get year {
    return Intl.message('Year', name: 'year', desc: '', args: []);
  }

  /// `Condition`
  String get condition {
    return Intl.message('Condition', name: 'condition', desc: '', args: []);
  }

  /// `Tank Size`
  String get tankSize {
    return Intl.message('Tank Size', name: 'tankSize', desc: '', args: []);
  }

  /// `Gear box`
  String get gearBox {
    return Intl.message('Gear box', name: 'gearBox', desc: '', args: []);
  }

  /// `Seats`
  String get seats {
    return Intl.message('Seats', name: 'seats', desc: '', args: []);
  }

  /// `Doors`
  String get doors {
    return Intl.message('Doors', name: 'doors', desc: '', args: []);
  }

  /// `Mileage`
  String get mileage {
    return Intl.message('Mileage', name: 'mileage', desc: '', args: []);
  }

  /// `Brand`
  String get brandLabel {
    return Intl.message('Brand', name: 'brandLabel', desc: '', args: []);
  }

  /// `Model`
  String get modelLabel {
    return Intl.message('Model', name: 'modelLabel', desc: '', args: []);
  }

  /// `Contact Information:`
  String get contactInformation {
    return Intl.message(
      'Contact Information:',
      name: 'contactInformation',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get nameHint {
    return Intl.message('Name', name: 'nameHint', desc: '', args: []);
  }

  /// `Phone Number`
  String get phoneNumberHint {
    return Intl.message(
      'Phone Number',
      name: 'phoneNumberHint',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get description {
    return Intl.message('Description', name: 'description', desc: '', args: []);
  }

  /// `Provide a brief description of your car`
  String get descriptionHint {
    return Intl.message(
      'Provide a brief description of your car',
      name: 'descriptionHint',
      desc: '',
      args: [],
    );
  }

  /// `Upload Photos`
  String get uploadPhotos {
    return Intl.message(
      'Upload Photos',
      name: 'uploadPhotos',
      desc: '',
      args: [],
    );
  }

  /// `Add high-quality photos to showcase your car`
  String get uploadPhotosDescription {
    return Intl.message(
      'Add high-quality photos to showcase your car',
      name: 'uploadPhotosDescription',
      desc: '',
      args: [],
    );
  }

  /// `SAVE CHANGES`
  String get saveChanges {
    return Intl.message(
      'SAVE CHANGES',
      name: 'saveChanges',
      desc: '',
      args: [],
    );
  }

  /// `POST ADVERTISEMENT`
  String get postAd {
    return Intl.message(
      'POST ADVERTISEMENT',
      name: 'postAd',
      desc: '',
      args: [],
    );
  }

  /// `Please select the advertising purpose`
  String get selectAdPurposePrompt {
    return Intl.message(
      'Please select the advertising purpose',
      name: 'selectAdPurposePrompt',
      desc: '',
      args: [],
    );
  }

  /// `Car for sale`
  String get carForSale {
    return Intl.message('Car for sale', name: 'carForSale', desc: '', args: []);
  }

  /// `Car for rent`
  String get carForRent {
    return Intl.message('Car for rent', name: 'carForRent', desc: '', args: []);
  }

  /// `Rental Duration`
  String get rentalDuration {
    return Intl.message(
      'Rental Duration',
      name: 'rentalDuration',
      desc: '',
      args: [],
    );
  }

  /// `Days`
  String get days {
    return Intl.message('Days', name: 'days', desc: '', args: []);
  }

  /// `Weeks`
  String get weeks {
    return Intl.message('Weeks', name: 'weeks', desc: '', args: []);
  }

  /// `Months`
  String get months {
    return Intl.message('Months', name: 'months', desc: '', args: []);
  }

  /// `Available From`
  String get availableFrom {
    return Intl.message(
      'Available From',
      name: 'availableFrom',
      desc: '',
      args: [],
    );
  }

  /// `Available Until`
  String get availableUntil {
    return Intl.message(
      'Available Until',
      name: 'availableUntil',
      desc: '',
      args: [],
    );
  }

  /// `Please fill all rental dates and times`
  String get fillRentalDatesError {
    return Intl.message(
      'Please fill all rental dates and times',
      name: 'fillRentalDatesError',
      desc: '',
      args: [],
    );
  }

  /// `Advertisement updated successfully!`
  String get adUpdatedSuccess {
    return Intl.message(
      'Advertisement updated successfully!',
      name: 'adUpdatedSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Advertisement posted successfully!`
  String get adPostedSuccess {
    return Intl.message(
      'Advertisement posted successfully!',
      name: 'adPostedSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Edit Your Advertisement`
  String get editAdTitle {
    return Intl.message(
      'Edit Your Advertisement',
      name: 'editAdTitle',
      desc: '',
      args: [],
    );
  }

  /// `Post Your Advertisement`
  String get postAdTitle {
    return Intl.message(
      'Post Your Advertisement',
      name: 'postAdTitle',
      desc: '',
      args: [],
    );
  }

  /// `Add Price`
  String get addPriceHint {
    return Intl.message('Add Price', name: 'addPriceHint', desc: '', args: []);
  }

  /// `Price cannot be empty`
  String get priceEmptyError {
    return Intl.message(
      'Price cannot be empty',
      name: 'priceEmptyError',
      desc: '',
      args: [],
    );
  }

  /// `Price`
  String get price {
    return Intl.message('Price', name: 'price', desc: '', args: []);
  }

  /// `No suggested ads available for this car.`
  String get noSuggestedAds {
    return Intl.message(
      'No suggested ads available for this car.',
      name: 'noSuggestedAds',
      desc: '',
      args: [],
    );
  }

  /// `All Cars`
  String get allCars {
    return Intl.message('All Cars', name: 'allCars', desc: '', args: []);
  }

  /// `All`
  String get all {
    return Intl.message('All', name: 'all', desc: '', args: []);
  }

  /// `Failed to load cars: {error}`
  String loadCarsFailed(Object error) {
    return Intl.message(
      'Failed to load cars: $error',
      name: 'loadCarsFailed',
      desc: '',
      args: [error],
    );
  }

  /// `All Categories`
  String get allCategories {
    return Intl.message(
      'All Categories',
      name: 'allCategories',
      desc: '',
      args: [],
    );
  }

  /// `Brands`
  String get brands {
    return Intl.message('Brands', name: 'brands', desc: '', args: []);
  }

  /// `Toyota`
  String get toyota {
    return Intl.message('Toyota', name: 'toyota', desc: '', args: []);
  }

  /// `Audi`
  String get audi {
    return Intl.message('Audi', name: 'audi', desc: '', args: []);
  }

  /// `Hyundai`
  String get hyundai {
    return Intl.message('Hyundai', name: 'hyundai', desc: '', args: []);
  }

  /// `Mazda`
  String get mazda {
    return Intl.message('Mazda', name: 'mazda', desc: '', args: []);
  }

  /// `No Name`
  String get noName {
    return Intl.message('No Name', name: 'noName', desc: '', args: []);
  }

  /// `K`
  String get thousandSuffix {
    return Intl.message('K', name: 'thousandSuffix', desc: '', args: []);
  }

  /// `AED/Day`
  String get aedPerDay {
    return Intl.message('AED/Day', name: 'aedPerDay', desc: '', args: []);
  }

  /// `AED`
  String get aed {
    return Intl.message('AED', name: 'aed', desc: '', args: []);
  }

  /// `No ads matching your filters`
  String get noAdsMatchingFilters {
    return Intl.message(
      'No ads matching your filters',
      name: 'noAdsMatchingFilters',
      desc: '',
      args: [],
    );
  }

  /// `Results for "{query}"`
  String resultsFor(Object query) {
    return Intl.message(
      'Results for "$query"',
      name: 'resultsFor',
      desc: '',
      args: [query],
    );
  }

  /// `{count} found`
  String itemsFound(Object count) {
    return Intl.message(
      '$count found',
      name: 'itemsFound',
      desc: '',
      args: [count],
    );
  }

  /// `Recent`
  String get recentSearchesTitle {
    return Intl.message(
      'Recent',
      name: 'recentSearchesTitle',
      desc: '',
      args: [],
    );
  }

  /// `Clear All`
  String get clearAll {
    return Intl.message('Clear All', name: 'clearAll', desc: '', args: []);
  }

  /// `Start your search ...`
  String get startSearchHint {
    return Intl.message(
      'Start your search ...',
      name: 'startSearchHint',
      desc: '',
      args: [],
    );
  }

  /// `Apply`
  String get apply {
    return Intl.message('Apply', name: 'apply', desc: '', args: []);
  }

  /// `Reset`
  String get reset {
    return Intl.message('Reset', name: 'reset', desc: '', args: []);
  }

  /// `Filter`
  String get filterTitle {
    return Intl.message('Filter', name: 'filterTitle', desc: '', args: []);
  }

  /// `Car Brands`
  String get carBrands {
    return Intl.message('Car Brands', name: 'carBrands', desc: '', args: []);
  }

  /// `Car Condition`
  String get carCondition {
    return Intl.message(
      'Car Condition',
      name: 'carCondition',
      desc: '',
      args: [],
    );
  }

  /// `New`
  String get newCondition {
    return Intl.message('New', name: 'newCondition', desc: '', args: []);
  }

  /// `Used`
  String get usedCondition {
    return Intl.message('Used', name: 'usedCondition', desc: '', args: []);
  }

  /// `Mileage`
  String get mileageTitle {
    return Intl.message('Mileage', name: 'mileageTitle', desc: '', args: []);
  }

  /// `Select Mileage Range:`
  String get selectMileageRange {
    return Intl.message(
      'Select Mileage Range:',
      name: 'selectMileageRange',
      desc: '',
      args: [],
    );
  }

  /// `Start Mileage`
  String get startMileageHint {
    return Intl.message(
      'Start Mileage',
      name: 'startMileageHint',
      desc: '',
      args: [],
    );
  }

  /// `End Mileage`
  String get endMileageHint {
    return Intl.message(
      'End Mileage',
      name: 'endMileageHint',
      desc: '',
      args: [],
    );
  }

  /// `Price Range`
  String get priceRange {
    return Intl.message('Price Range', name: 'priceRange', desc: '', args: []);
  }

  /// `Year`
  String get yearTitle {
    return Intl.message('Year', name: 'yearTitle', desc: '', args: []);
  }

  /// `Select Year Range:`
  String get selectYearRange {
    return Intl.message(
      'Select Year Range:',
      name: 'selectYearRange',
      desc: '',
      args: [],
    );
  }

  /// `Start Year`
  String get startYearHint {
    return Intl.message(
      'Start Year',
      name: 'startYearHint',
      desc: '',
      args: [],
    );
  }

  /// `End Year`
  String get endYearHint {
    return Intl.message('End Year', name: 'endYearHint', desc: '', args: []);
  }

  /// `Error fetching showroom: {error}`
  String errorFetchingShowroom(Object error) {
    return Intl.message(
      'Error fetching showroom: $error',
      name: 'errorFetchingShowroom',
      desc: '',
      args: [error],
    );
  }

  /// `Rental`
  String get rentalButton {
    return Intl.message('Rental', name: 'rentalButton', desc: '', args: []);
  }

  /// `Buy `
  String get buyButton {
    return Intl.message('Buy ', name: 'buyButton', desc: '', args: []);
  }

  /// `You must agree to the rental terms to proceed.`
  String get agreeTermsError {
    return Intl.message(
      'You must agree to the rental terms to proceed.',
      name: 'agreeTermsError',
      desc: '',
      args: [],
    );
  }

  /// `Rental Information:`
  String get rentalInformation {
    return Intl.message(
      'Rental Information:',
      name: 'rentalInformation',
      desc: '',
      args: [],
    );
  }

  /// `Location`
  String get location {
    return Intl.message('Location', name: 'location', desc: '', args: []);
  }

  /// `No description available.`
  String get noDescription {
    return Intl.message(
      'No description available.',
      name: 'noDescription',
      desc: '',
      args: [],
    );
  }

  /// `Rental terms`
  String get rentalTerms {
    return Intl.message(
      'Rental terms',
      name: 'rentalTerms',
      desc: '',
      args: [],
    );
  }

  /// `Lorem ipsum dolor sit amet consectetur. Consectetur pharetra proin sed nisi vitae purus vivamus in. Ornare pellentesque vivamus elementum lorem velit eget mauris senectus fusce.`
  String get dummyTermsText {
    return Intl.message(
      'Lorem ipsum dolor sit amet consectetur. Consectetur pharetra proin sed nisi vitae purus vivamus in. Ornare pellentesque vivamus elementum lorem velit eget mauris senectus fusce.',
      name: 'dummyTermsText',
      desc: '',
      args: [],
    );
  }

  /// `Do you agree to the rental terms`
  String get agreeRentalTermsPrompt {
    return Intl.message(
      'Do you agree to the rental terms',
      name: 'agreeRentalTermsPrompt',
      desc: '',
      args: [],
    );
  }

  /// `Seller`
  String get seller {
    return Intl.message('Seller', name: 'seller', desc: '', args: []);
  }

  /// `Suggested Ads`
  String get suggestedAds {
    return Intl.message(
      'Suggested Ads',
      name: 'suggestedAds',
      desc: '',
      args: [],
    );
  }

  /// `Showroom Details`
  String get showroomDetails {
    return Intl.message(
      'Showroom Details',
      name: 'showroomDetails',
      desc: '',
      args: [],
    );
  }

  /// `Address not available`
  String get addressNotAvailable {
    return Intl.message(
      'Address not available',
      name: 'addressNotAvailable',
      desc: '',
      args: [],
    );
  }

  /// `About showroom`
  String get aboutShowroom {
    return Intl.message(
      'About showroom',
      name: 'aboutShowroom',
      desc: '',
      args: [],
    );
  }

  /// `{showroomName} Ads`
  String showroomAds(Object showroomName) {
    return Intl.message(
      '$showroomName Ads',
      name: 'showroomAds',
      desc: '',
      args: [showroomName],
    );
  }

  /// `Order History`
  String get orderHistoryTitle {
    return Intl.message(
      'Order History',
      name: 'orderHistoryTitle',
      desc: '',
      args: [],
    );
  }

  /// `No orders found in your history.`
  String get noHistoryFound {
    return Intl.message(
      'No orders found in your history.',
      name: 'noHistoryFound',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to clear all history?`
  String get clearHistoryPrompt {
    return Intl.message(
      'Are you sure you want to clear all history?',
      name: 'clearHistoryPrompt',
      desc: '',
      args: [],
    );
  }

  /// `Status`
  String get orderStatus {
    return Intl.message('Status', name: 'orderStatus', desc: '', args: []);
  }

  /// `Order Date`
  String get orderDate {
    return Intl.message('Order Date', name: 'orderDate', desc: '', args: []);
  }

  /// `Unknown Car`
  String get unknownCar {
    return Intl.message('Unknown Car', name: 'unknownCar', desc: '', args: []);
  }

  /// `Pending`
  String get statusPending {
    return Intl.message('Pending', name: 'statusPending', desc: '', args: []);
  }

  /// `Confirmed`
  String get statusConfirmed {
    return Intl.message(
      'Confirmed',
      name: 'statusConfirmed',
      desc: '',
      args: [],
    );
  }

  /// `Rejected`
  String get statusRejected {
    return Intl.message('Rejected', name: 'statusRejected', desc: '', args: []);
  }

  /// `Clear Your History`
  String get clearHistoryTitle {
    return Intl.message(
      'Clear Your History',
      name: 'clearHistoryTitle',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to clear your history? This action cannot be undone, so proceed with caution.`
  String get clearHistoryWarning {
    return Intl.message(
      'Are you sure you want to clear your history? This action cannot be undone, so proceed with caution.',
      name: 'clearHistoryWarning',
      desc: '',
      args: [],
    );
  }

  /// `YES, CLEAR IT`
  String get confirmClearHistory {
    return Intl.message(
      'YES, CLEAR IT',
      name: 'confirmClearHistory',
      desc: '',
      args: [],
    );
  }

  /// `NO, I CHANGED MY MIND!`
  String get cancelClearHistory {
    return Intl.message(
      'NO, I CHANGED MY MIND!',
      name: 'cancelClearHistory',
      desc: '',
      args: [],
    );
  }

  /// `Active`
  String get statusActive {
    return Intl.message('Active', name: 'statusActive', desc: '', args: []);
  }

  /// `Canceled`
  String get statusCanceled {
    return Intl.message('Canceled', name: 'statusCanceled', desc: '', args: []);
  }

  /// `Ended`
  String get statusEnded {
    return Intl.message('Ended', name: 'statusEnded', desc: '', args: []);
  }

  /// `Order Date :`
  String get orderDateLabel {
    return Intl.message(
      'Order Date :',
      name: 'orderDateLabel',
      desc: '',
      args: [],
    );
  }

  /// `Status :`
  String get statusLabel {
    return Intl.message('Status :', name: 'statusLabel', desc: '', args: []);
  }

  /// `Please log in first.`
  String get loginRequired {
    return Intl.message(
      'Please log in first.',
      name: 'loginRequired',
      desc: '',
      args: [],
    );
  }

  /// `No history yet.`
  String get noHistoryYet {
    return Intl.message(
      'No history yet.',
      name: 'noHistoryYet',
      desc: '',
      args: [],
    );
  }

  /// `Welcome {userName}`
  String welcomeUser(Object userName) {
    return Intl.message(
      'Welcome $userName',
      name: 'welcomeUser',
      desc: '',
      args: [userName],
    );
  }

  /// `User`
  String get userPlaceholder {
    return Intl.message('User', name: 'userPlaceholder', desc: '', args: []);
  }

  /// `No showrooms found`
  String get noShowroomsFound {
    return Intl.message(
      'No showrooms found',
      name: 'noShowroomsFound',
      desc: '',
      args: [],
    );
  }

  /// `Top rated Showroom`
  String get topRatedShowroom {
    return Intl.message(
      'Top rated Showroom',
      name: 'topRatedShowroom',
      desc: '',
      args: [],
    );
  }

  /// `Unknown`
  String get unknown {
    return Intl.message('Unknown', name: 'unknown', desc: '', args: []);
  }

  /// `{count} seats`
  String seatsCount(Object count) {
    return Intl.message(
      '$count seats',
      name: 'seatsCount',
      desc: '',
      args: [count],
    );
  }

  /// `Requests`
  String get requests {
    return Intl.message('Requests', name: 'requests', desc: '', args: []);
  }

  /// `Notifications`
  String get notificationsTitle {
    return Intl.message(
      'Notifications',
      name: 'notificationsTitle',
      desc: '',
      args: [],
    );
  }

  /// `User not logged in.`
  String get userNotLoggedIn {
    return Intl.message(
      'User not logged in.',
      name: 'userNotLoggedIn',
      desc: '',
      args: [],
    );
  }

  /// `Error: {error}`
  String errorWithDetails(Object error) {
    return Intl.message(
      'Error: $error',
      name: 'errorWithDetails',
      desc: '',
      args: [error],
    );
  }

  /// `No notifications yet.`
  String get noNotificationsYet {
    return Intl.message(
      'No notifications yet.',
      name: 'noNotificationsYet',
      desc: '',
      args: [],
    );
  }

  /// `FAQ'S`
  String get faqsTitle {
    return Intl.message('FAQ\'S', name: 'faqsTitle', desc: '', args: []);
  }

  /// `Have Questions? We Have Answers!`
  String get faqHeader {
    return Intl.message(
      'Have Questions? We Have Answers!',
      name: 'faqHeader',
      desc: '',
      args: [],
    );
  }

  /// `How do I book a car?`
  String get faqQuestion1 {
    return Intl.message(
      'How do I book a car?',
      name: 'faqQuestion1',
      desc: '',
      args: [],
    );
  }

  /// `You can book a car by browsing our car listings, selecting a car that fits your needs, and following the checkout process to confirm your rental.`
  String get faqAnswer1 {
    return Intl.message(
      'You can book a car by browsing our car listings, selecting a car that fits your needs, and following the checkout process to confirm your rental.',
      name: 'faqAnswer1',
      desc: '',
      args: [],
    );
  }

  /// `What documents are required for rental?`
  String get faqQuestion2 {
    return Intl.message(
      'What documents are required for rental?',
      name: 'faqQuestion2',
      desc: '',
      args: [],
    );
  }

  /// `Typically, you will need a valid driving license, a national ID or passport, and in some cases, a credit card for the security deposit.`
  String get faqAnswer2 {
    return Intl.message(
      'Typically, you will need a valid driving license, a national ID or passport, and in some cases, a credit card for the security deposit.',
      name: 'faqAnswer2',
      desc: '',
      args: [],
    );
  }

  /// `Can I cancel my booking?`
  String get faqQuestion3 {
    return Intl.message(
      'Can I cancel my booking?',
      name: 'faqQuestion3',
      desc: '',
      args: [],
    );
  }

  /// `Yes, bookings can be cancelled through the history section. Please review our cancellation policy for information on potential fees.`
  String get faqAnswer3 {
    return Intl.message(
      'Yes, bookings can be cancelled through the history section. Please review our cancellation policy for information on potential fees.',
      name: 'faqAnswer3',
      desc: '',
      args: [],
    );
  }

  /// `Is insurance included?`
  String get faqQuestion4 {
    return Intl.message(
      'Is insurance included?',
      name: 'faqQuestion4',
      desc: '',
      args: [],
    );
  }

  /// `Most rentals include basic insurance. You can opt for additional coverage during the checkout process for extra peace of mind.`
  String get faqAnswer4 {
    return Intl.message(
      'Most rentals include basic insurance. You can opt for additional coverage during the checkout process for extra peace of mind.',
      name: 'faqAnswer4',
      desc: '',
      args: [],
    );
  }

  /// `How do I contact customer support?`
  String get faqQuestion5 {
    return Intl.message(
      'How do I contact customer support?',
      name: 'faqQuestion5',
      desc: '',
      args: [],
    );
  }

  /// `You can reach our support team via the contact details provided in the app or through the support section in your profile.`
  String get faqAnswer5 {
    return Intl.message(
      'You can reach our support team via the contact details provided in the app or through the support section in your profile.',
      name: 'faqAnswer5',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get privacyPolicyTitle {
    return Intl.message(
      'Privacy Policy',
      name: 'privacyPolicyTitle',
      desc: '',
      args: [],
    );
  }

  /// `At Car Ads, we are committed to safeguarding your privacy and ensuring the security of your personal information. This Privacy Policy outlines how we collect, use, and protect your data when you use our mobile application.`
  String get privacyPolicyIntro {
    return Intl.message(
      'At Car Ads, we are committed to safeguarding your privacy and ensuring the security of your personal information. This Privacy Policy outlines how we collect, use, and protect your data when you use our mobile application.',
      name: 'privacyPolicyIntro',
      desc: '',
      args: [],
    );
  }

  /// `Terms & Conditions`
  String get termsConditionsTitle {
    return Intl.message(
      'Terms & Conditions',
      name: 'termsConditionsTitle',
      desc: '',
      args: [],
    );
  }

  /// `1. Information Collection and Use:`
  String get privacySectionTitle1 {
    return Intl.message(
      '1. Information Collection and Use:',
      name: 'privacySectionTitle1',
      desc: '',
      args: [],
    );
  }

  /// `We may collect certain personal information from you, such as your name, email address, and contact details when you sign up or use our services. This information is used to personalize your experience, improve our services, and communicate with you.`
  String get privacySectionContent1 {
    return Intl.message(
      'We may collect certain personal information from you, such as your name, email address, and contact details when you sign up or use our services. This information is used to personalize your experience, improve our services, and communicate with you.',
      name: 'privacySectionContent1',
      desc: '',
      args: [],
    );
  }

  /// `2. Log Data:`
  String get privacySectionTitle2 {
    return Intl.message(
      '2. Log Data:',
      name: 'privacySectionTitle2',
      desc: '',
      args: [],
    );
  }

  /// `When you use our app, we may collect information that your mobile device sends, such as your device ID, IP address, device name, and operating system version. This data is used for app performance analysis and to enhance user experience.`
  String get privacySectionContent2 {
    return Intl.message(
      'When you use our app, we may collect information that your mobile device sends, such as your device ID, IP address, device name, and operating system version. This data is used for app performance analysis and to enhance user experience.',
      name: 'privacySectionContent2',
      desc: '',
      args: [],
    );
  }

  /// `3. Cookies and Similar Technologies:`
  String get privacySectionTitle3 {
    return Intl.message(
      '3. Cookies and Similar Technologies:',
      name: 'privacySectionTitle3',
      desc: '',
      args: [],
    );
  }

  /// `We may use cookies and similar tracking technologies to track the activity on our application and hold certain information. You can instruct your browser to refuse all cookies or to indicate when a cookie is being sent.`
  String get privacySectionContent3 {
    return Intl.message(
      'We may use cookies and similar tracking technologies to track the activity on our application and hold certain information. You can instruct your browser to refuse all cookies or to indicate when a cookie is being sent.',
      name: 'privacySectionContent3',
      desc: '',
      args: [],
    );
  }

  /// `4. Service Providers:`
  String get privacySectionTitle4 {
    return Intl.message(
      '4. Service Providers:',
      name: 'privacySectionTitle4',
      desc: '',
      args: [],
    );
  }

  /// `We may employ third-party companies and individuals to facilitate our services, perform service-related tasks, or assist us in analyzing how our application is used. These third parties have access to your personal information only to perform these tasks on our behalf.`
  String get privacySectionContent4 {
    return Intl.message(
      'We may employ third-party companies and individuals to facilitate our services, perform service-related tasks, or assist us in analyzing how our application is used. These third parties have access to your personal information only to perform these tasks on our behalf.',
      name: 'privacySectionContent4',
      desc: '',
      args: [],
    );
  }

  /// `5. Security:`
  String get privacySectionTitle5 {
    return Intl.message(
      '5. Security:',
      name: 'privacySectionTitle5',
      desc: '',
      args: [],
    );
  }

  /// `The security of your personal information is important to us. We strive to use commercially acceptable means to protect your personal information, but please remember that no method of transmission over the internet or electronic storage is 100% secure.`
  String get privacySectionContent5 {
    return Intl.message(
      'The security of your personal information is important to us. We strive to use commercially acceptable means to protect your personal information, but please remember that no method of transmission over the internet or electronic storage is 100% secure.',
      name: 'privacySectionContent5',
      desc: '',
      args: [],
    );
  }

  /// `6. Links to Other Sites:`
  String get privacySectionTitle6 {
    return Intl.message(
      '6. Links to Other Sites:',
      name: 'privacySectionTitle6',
      desc: '',
      args: [],
    );
  }

  /// `Our application may contain links to other sites that are not operated by us. If you click on a third-party link, you will be directed to that third party's site. We strongly advise you to review the Privacy Policy of every site you visit.`
  String get privacySectionContent6 {
    return Intl.message(
      'Our application may contain links to other sites that are not operated by us. If you click on a third-party link, you will be directed to that third party\'s site. We strongly advise you to review the Privacy Policy of every site you visit.',
      name: 'privacySectionContent6',
      desc: '',
      args: [],
    );
  }

  /// `7. Changes to This Privacy Policy:`
  String get privacySectionTitle7 {
    return Intl.message(
      '7. Changes to This Privacy Policy:',
      name: 'privacySectionTitle7',
      desc: '',
      args: [],
    );
  }

  /// `We may update our Privacy Policy from time to time. We will notify you of any changes by posting the new Privacy Policy on this page. You are advised to review this Privacy Policy periodically for any changes.`
  String get privacySectionContent7 {
    return Intl.message(
      'We may update our Privacy Policy from time to time. We will notify you of any changes by posting the new Privacy Policy on this page. You are advised to review this Privacy Policy periodically for any changes.',
      name: 'privacySectionContent7',
      desc: '',
      args: [],
    );
  }

  /// `A verification link has been sent to your new email. Please verify it and log in again.`
  String get emailVerificationSent {
    return Intl.message(
      'A verification link has been sent to your new email. Please verify it and log in again.',
      name: 'emailVerificationSent',
      desc: '',
      args: [],
    );
  }

  /// `Email Change Requested`
  String get emailChangeRequestedTitle {
    return Intl.message(
      'Email Change Requested',
      name: 'emailChangeRequestedTitle',
      desc: '',
      args: [],
    );
  }

  /// `A request to change your email to {newEmail} has been initiated.`
  String emailChangeRequestedBody(Object newEmail) {
    return Intl.message(
      'A request to change your email to $newEmail has been initiated.',
      name: 'emailChangeRequestedBody',
      desc: '',
      args: [newEmail],
    );
  }

  /// `This email is already in use by another account.`
  String get emailAlreadyInUse {
    return Intl.message(
      'This email is already in use by another account.',
      name: 'emailAlreadyInUse',
      desc: '',
      args: [],
    );
  }

  /// `The email address is badly formatted.`
  String get invalidEmailFormat {
    return Intl.message(
      'The email address is badly formatted.',
      name: 'invalidEmailFormat',
      desc: '',
      args: [],
    );
  }

  /// `User session not found. Please log in again.`
  String get sessionExpired {
    return Intl.message(
      'User session not found. Please log in again.',
      name: 'sessionExpired',
      desc: '',
      args: [],
    );
  }

  /// `For security reasons, please log in again before changing your email.`
  String get recentLoginRequired {
    return Intl.message(
      'For security reasons, please log in again before changing your email.',
      name: 'recentLoginRequired',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred while updating your email. Please try again.`
  String get updateEmailError {
    return Intl.message(
      'An error occurred while updating your email. Please try again.',
      name: 'updateEmailError',
      desc: '',
      args: [],
    );
  }

  /// `Password Changed`
  String get passwordChangedTitle {
    return Intl.message(
      'Password Changed',
      name: 'passwordChangedTitle',
      desc: '',
      args: [],
    );
  }

  /// `Your account password has been changed successfully.`
  String get passwordChangedBody {
    return Intl.message(
      'Your account password has been changed successfully.',
      name: 'passwordChangedBody',
      desc: '',
      args: [],
    );
  }

  /// `Too many attempts. Please try again later or reset your password.`
  String get tooManyAttempts {
    return Intl.message(
      'Too many attempts. Please try again later or reset your password.',
      name: 'tooManyAttempts',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred`
  String get anErrorOccurred {
    return Intl.message(
      'An error occurred',
      name: 'anErrorOccurred',
      desc: '',
      args: [],
    );
  }

  /// `Verification failed`
  String get verificationFailed {
    return Intl.message(
      'Verification failed',
      name: 'verificationFailed',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the 6-digit OTP code`
  String get enterOtpError {
    return Intl.message(
      'Please enter the 6-digit OTP code',
      name: 'enterOtpError',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number Updated`
  String get phoneUpdatedTitle {
    return Intl.message(
      'Phone Number Updated',
      name: 'phoneUpdatedTitle',
      desc: '',
      args: [],
    );
  }

  /// `Your phone number has been updated to {newPhone} successfully.`
  String phoneUpdatedBody(Object newPhone) {
    return Intl.message(
      'Your phone number has been updated to $newPhone successfully.',
      name: 'phoneUpdatedBody',
      desc: '',
      args: [newPhone],
    );
  }

  /// `Phone number updated successfully!`
  String get phoneUpdatedSuccess {
    return Intl.message(
      'Phone number updated successfully!',
      name: 'phoneUpdatedSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message('Language', name: 'language', desc: '', args: []);
  }

  /// `Select Language`
  String get selectLanguage {
    return Intl.message(
      'Select Language',
      name: 'selectLanguage',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message('English', name: 'english', desc: '', args: []);
  }

  /// `Arabic`
  String get arabic {
    return Intl.message('Arabic', name: 'arabic', desc: '', args: []);
  }

  /// `Failed to upload profile image. Please try again.`
  String get profileImageUploadError {
    return Intl.message(
      'Failed to upload profile image. Please try again.',
      name: 'profileImageUploadError',
      desc: '',
      args: [],
    );
  }

  /// `Profile Updated`
  String get profileUpdatedTitle {
    return Intl.message(
      'Profile Updated',
      name: 'profileUpdatedTitle',
      desc: '',
      args: [],
    );
  }

  /// `Your profile information has been updated successfully.`
  String get profileUpdatedBody {
    return Intl.message(
      'Your profile information has been updated successfully.',
      name: 'profileUpdatedBody',
      desc: '',
      args: [],
    );
  }

  /// `Profile updated successfully!`
  String get profileUpdatedSuccess {
    return Intl.message(
      'Profile updated successfully!',
      name: 'profileUpdatedSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Update failed`
  String get updateFailed {
    return Intl.message(
      'Update failed',
      name: 'updateFailed',
      desc: '',
      args: [],
    );
  }

  /// `Change Your Email`
  String get changeEmailTitle {
    return Intl.message(
      'Change Your Email',
      name: 'changeEmailTitle',
      desc: '',
      args: [],
    );
  }

  /// `Your data is kept secure by us!`
  String get dataSecurityMessage {
    return Intl.message(
      'Your data is kept secure by us!',
      name: 'dataSecurityMessage',
      desc: '',
      args: [],
    );
  }

  /// `Add your Current Email Address`
  String get addCurrentEmailPrompt {
    return Intl.message(
      'Add your Current Email Address',
      name: 'addCurrentEmailPrompt',
      desc: '',
      args: [],
    );
  }

  /// `Current Email Address`
  String get currentEmailHint {
    return Intl.message(
      'Current Email Address',
      name: 'currentEmailHint',
      desc: '',
      args: [],
    );
  }

  /// `Current Password`
  String get currentPasswordHint {
    return Intl.message(
      'Current Password',
      name: 'currentPasswordHint',
      desc: '',
      args: [],
    );
  }

  /// `Password is required`
  String get passwordRequiredError {
    return Intl.message(
      'Password is required',
      name: 'passwordRequiredError',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get continueButton {
    return Intl.message('Continue', name: 'continueButton', desc: '', args: []);
  }

  /// `Change Language`
  String get changeLanguageTitle {
    return Intl.message(
      'Change Language',
      name: 'changeLanguageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Select your comfortable language!`
  String get selectLanguageComfortable {
    return Intl.message(
      'Select your comfortable language!',
      name: 'selectLanguageComfortable',
      desc: '',
      args: [],
    );
  }

  /// `Reset Your Password`
  String get resetYourPasswordTitle {
    return Intl.message(
      'Reset Your Password',
      name: 'resetYourPasswordTitle',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get newPasswordHint {
    return Intl.message(
      'New Password',
      name: 'newPasswordHint',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirmPasswordHint {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPasswordHint',
      desc: '',
      args: [],
    );
  }

  /// `Reset Your Password`
  String get resetPasswordButton {
    return Intl.message(
      'Reset Your Password',
      name: 'resetPasswordButton',
      desc: '',
      args: [],
    );
  }

  /// `Change Phone`
  String get changePhoneTitle {
    return Intl.message(
      'Change Phone',
      name: 'changePhoneTitle',
      desc: '',
      args: [],
    );
  }

  /// `Enter your new mobile number to receive an OTP code.`
  String get enterNewMobilePrompt {
    return Intl.message(
      'Enter your new mobile number to receive an OTP code.',
      name: 'enterNewMobilePrompt',
      desc: '',
      args: [],
    );
  }

  /// `Mobile Number`
  String get mobileNumberLabel {
    return Intl.message(
      'Mobile Number',
      name: 'mobileNumberLabel',
      desc: '',
      args: [],
    );
  }

  /// `+971 XXXXXXXXX`
  String get phoneHint {
    return Intl.message(
      '+971 XXXXXXXXX',
      name: 'phoneHint',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your phone number`
  String get enterPhoneError {
    return Intl.message(
      'Please enter your phone number',
      name: 'enterPhoneError',
      desc: '',
      args: [],
    );
  }

  /// `Please include country code (e.g., +971)`
  String get includeCountryCodeError {
    return Intl.message(
      'Please include country code (e.g., +971)',
      name: 'includeCountryCodeError',
      desc: '',
      args: [],
    );
  }

  /// `Send OTP`
  String get sendOtpButton {
    return Intl.message('Send OTP', name: 'sendOtpButton', desc: '', args: []);
  }

  /// `Well Done`
  String get wellDoneTitle {
    return Intl.message('Well Done', name: 'wellDoneTitle', desc: '', args: []);
  }

  /// `Congratulations! Your changes have been saved successfully!`
  String get changesSavedSuccess {
    return Intl.message(
      'Congratulations! Your changes have been saved successfully!',
      name: 'changesSavedSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Back To Profile`
  String get backToProfileButton {
    return Intl.message(
      'Back To Profile',
      name: 'backToProfileButton',
      desc: '',
      args: [],
    );
  }

  /// `All Done !`
  String get allDone {
    return Intl.message('All Done !', name: 'allDone', desc: '', args: []);
  }

  /// `Add your New Email Address`
  String get addNewEmailPrompt {
    return Intl.message(
      'Add your New Email Address',
      name: 'addNewEmailPrompt',
      desc: '',
      args: [],
    );
  }

  /// `New Email Address`
  String get newEmailHint {
    return Intl.message(
      'New Email Address',
      name: 'newEmailHint',
      desc: '',
      args: [],
    );
  }

  /// `Reset Your Email`
  String get resetEmailButton {
    return Intl.message(
      'Reset Your Email',
      name: 'resetEmailButton',
      desc: '',
      args: [],
    );
  }

  /// `Your Profile`
  String get yourProfileTitle {
    return Intl.message(
      'Your Profile',
      name: 'yourProfileTitle',
      desc: '',
      args: [],
    );
  }

  /// `Loading...`
  String get loading {
    return Intl.message('Loading...', name: 'loading', desc: '', args: []);
  }

  /// `Payment Methods`
  String get paymentMethods {
    return Intl.message(
      'Payment Methods',
      name: 'paymentMethods',
      desc: '',
      args: [],
    );
  }

  /// `Change Your Email`
  String get changeYourEmailMenu {
    return Intl.message(
      'Change Your Email',
      name: 'changeYourEmailMenu',
      desc: '',
      args: [],
    );
  }

  /// `Change Your Phone Number`
  String get changeYourPhoneMenu {
    return Intl.message(
      'Change Your Phone Number',
      name: 'changeYourPhoneMenu',
      desc: '',
      args: [],
    );
  }

  /// `Change Your Password`
  String get changeYourPasswordMenu {
    return Intl.message(
      'Change Your Password',
      name: 'changeYourPasswordMenu',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message('Logout', name: 'logout', desc: '', args: []);
  }

  /// `Update Your Profile`
  String get updateProfileTitle {
    return Intl.message(
      'Update Your Profile',
      name: 'updateProfileTitle',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get fullNameLabel {
    return Intl.message('Full Name', name: 'fullNameLabel', desc: '', args: []);
  }

  /// `Enter your name`
  String get enterNameHint {
    return Intl.message(
      'Enter your name',
      name: 'enterNameHint',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your name`
  String get enterNameError {
    return Intl.message(
      'Please enter your name',
      name: 'enterNameError',
      desc: '',
      args: [],
    );
  }

  /// `Verify OTP`
  String get verifyOtpTitle {
    return Intl.message(
      'Verify OTP',
      name: 'verifyOtpTitle',
      desc: '',
      args: [],
    );
  }

  /// `Enter the 6-digit code sent to {phoneNumber}`
  String enterOtpSentTo(Object phoneNumber) {
    return Intl.message(
      'Enter the 6-digit code sent to $phoneNumber',
      name: 'enterOtpSentTo',
      desc: '',
      args: [phoneNumber],
    );
  }

  /// `Verify & Update`
  String get verifyAndUpdate {
    return Intl.message(
      'Verify & Update',
      name: 'verifyAndUpdate',
      desc: '',
      args: [],
    );
  }

  /// `Upload New Picture`
  String get uploadNewPicture {
    return Intl.message(
      'Upload New Picture',
      name: 'uploadNewPicture',
      desc: '',
      args: [],
    );
  }

  /// `Unknown User`
  String get unknownUser {
    return Intl.message(
      'Unknown User',
      name: 'unknownUser',
      desc: '',
      args: [],
    );
  }

  /// `Payment failed or was cancelled. Please try again.`
  String get paymentFailedError {
    return Intl.message(
      'Payment failed or was cancelled. Please try again.',
      name: 'paymentFailedError',
      desc: '',
      args: [],
    );
  }

  /// `Rental Request Received`
  String get rentalRequestReceivedTitle {
    return Intl.message(
      'Rental Request Received',
      name: 'rentalRequestReceivedTitle',
      desc: '',
      args: [],
    );
  }

  /// `Your rental request for {carName} has been successfully submitted.`
  String rentalRequestReceivedBody(Object carName) {
    return Intl.message(
      'Your rental request for $carName has been successfully submitted.',
      name: 'rentalRequestReceivedBody',
      desc: '',
      args: [carName],
    );
  }

  /// `New Rental Request!`
  String get newRentalRequestTitle {
    return Intl.message(
      'New Rental Request!',
      name: 'newRentalRequestTitle',
      desc: '',
      args: [],
    );
  }

  /// `A user has requested to rent {carName}. Check your orders.`
  String newRentalRequestShowroomBody(Object carName) {
    return Intl.message(
      'A user has requested to rent $carName. Check your orders.',
      name: 'newRentalRequestShowroomBody',
      desc: '',
      args: [carName],
    );
  }

  /// `Order details not found.`
  String get orderDetailsNotFound {
    return Intl.message(
      'Order details not found.',
      name: 'orderDetailsNotFound',
      desc: '',
      args: [],
    );
  }

  /// `Loading Location...`
  String get loadingLocation {
    return Intl.message(
      'Loading Location...',
      name: 'loadingLocation',
      desc: '',
      args: [],
    );
  }

  /// `Tap on the map to select a location.`
  String get tapMapToSelectLocation {
    return Intl.message(
      'Tap on the map to select a location.',
      name: 'tapMapToSelectLocation',
      desc: '',
      args: [],
    );
  }

  /// `Could not determine address. Please try again.`
  String get couldNotDetermineAddress {
    return Intl.message(
      'Could not determine address. Please try again.',
      name: 'couldNotDetermineAddress',
      desc: '',
      args: [],
    );
  }

  /// `Please select a location on the map`
  String get pleaseSelectLocationOnMap {
    return Intl.message(
      'Please select a location on the map',
      name: 'pleaseSelectLocationOnMap',
      desc: '',
      args: [],
    );
  }

  /// `Unable to determine your location.`
  String get unableToDetermineLocation {
    return Intl.message(
      'Unable to determine your location.',
      name: 'unableToDetermineLocation',
      desc: '',
      args: [],
    );
  }

  /// `Checkout`
  String get checkoutTitle {
    return Intl.message('Checkout', name: 'checkoutTitle', desc: '', args: []);
  }

  /// `Car is only available from {time} on this day.`
  String carAvailableFromError(Object time) {
    return Intl.message(
      'Car is only available from $time on this day.',
      name: 'carAvailableFromError',
      desc: '',
      args: [time],
    );
  }

  /// `Car must be returned by {time} on the final day.`
  String carReturnByError(Object time) {
    return Intl.message(
      'Car must be returned by $time on the final day.',
      name: 'carReturnByError',
      desc: '',
      args: [time],
    );
  }

  /// `Please select the complete rental period (Dates and Times).`
  String get completeRentalPeriodError {
    return Intl.message(
      'Please select the complete rental period (Dates and Times).',
      name: 'completeRentalPeriodError',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Rental`
  String get confirmRentalButton {
    return Intl.message(
      'Confirm Rental',
      name: 'confirmRentalButton',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Purchase`
  String get confirmPurchaseButton {
    return Intl.message(
      'Confirm Purchase',
      name: 'confirmPurchaseButton',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Purchase`
  String get confirmBuyTitle {
    return Intl.message(
      'Confirm Purchase',
      name: 'confirmBuyTitle',
      desc: '',
      args: [],
    );
  }

  /// `Rental Receipt`
  String get rentalReceiptTitle {
    return Intl.message(
      'Rental Receipt',
      name: 'rentalReceiptTitle',
      desc: '',
      args: [],
    );
  }

  /// `Purchase Receipt`
  String get purchaseReceiptTitle {
    return Intl.message(
      'Purchase Receipt',
      name: 'purchaseReceiptTitle',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Rent`
  String get confirmRentTitle {
    return Intl.message(
      'Confirm Rent',
      name: 'confirmRentTitle',
      desc: '',
      args: [],
    );
  }

  /// `Your Location`
  String get yourLocationLabel {
    return Intl.message(
      'Your Location',
      name: 'yourLocationLabel',
      desc: '',
      args: [],
    );
  }

  /// `No address provided`
  String get noAddressProvided {
    return Intl.message(
      'No address provided',
      name: 'noAddressProvided',
      desc: '',
      args: [],
    );
  }

  /// `Order`
  String get orderLabel {
    return Intl.message('Order', name: 'orderLabel', desc: '', args: []);
  }

  /// `Driving License No`
  String get drivingLicenseNoHint {
    return Intl.message(
      'Driving License No',
      name: 'drivingLicenseNoHint',
      desc: '',
      args: [],
    );
  }

  /// `ID Number`
  String get idNumberHint {
    return Intl.message('ID Number', name: 'idNumberHint', desc: '', args: []);
  }

  /// `Rental Completed`
  String get rentalCompletedTitle {
    return Intl.message(
      'Rental Completed',
      name: 'rentalCompletedTitle',
      desc: '',
      args: [],
    );
  }

  /// `Your car rental request has been received, and we will get back to you as soon as we can. Please keep an eye out for notifications to stay updated.`
  String get rentalCompletedMessage {
    return Intl.message(
      'Your car rental request has been received, and we will get back to you as soon as we can. Please keep an eye out for notifications to stay updated.',
      name: 'rentalCompletedMessage',
      desc: '',
      args: [],
    );
  }

  /// `Car Summary`
  String get carSummaryTitle {
    return Intl.message(
      'Car Summary',
      name: 'carSummaryTitle',
      desc: '',
      args: [],
    );
  }

  /// `Select Date`
  String get selectDateHint {
    return Intl.message(
      'Select Date',
      name: 'selectDateHint',
      desc: '',
      args: [],
    );
  }

  /// `Select Time`
  String get selectTimeHint {
    return Intl.message(
      'Select Time',
      name: 'selectTimeHint',
      desc: '',
      args: [],
    );
  }

  /// `Price Details`
  String get priceDetailsTitle {
    return Intl.message(
      'Price Details',
      name: 'priceDetailsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Amount`
  String get amountLabel {
    return Intl.message('Amount', name: 'amountLabel', desc: '', args: []);
  }

  /// `Shipping`
  String get shippingLabel {
    return Intl.message('Shipping', name: 'shippingLabel', desc: '', args: []);
  }

  /// `Tax`
  String get taxLabel {
    return Intl.message('Tax', name: 'taxLabel', desc: '', args: []);
  }

  /// `Total payment`
  String get totalPaymentLabel {
    return Intl.message(
      'Total payment',
      name: 'totalPaymentLabel',
      desc: '',
      args: [],
    );
  }

  /// `Rental From`
  String get rentalFrom {
    return Intl.message('Rental From', name: 'rentalFrom', desc: '', args: []);
  }

  /// `Rental Until`
  String get rentalUntil {
    return Intl.message(
      'Rental Until',
      name: 'rentalUntil',
      desc: '',
      args: [],
    );
  }

  /// `Set Location`
  String get setLocationButton {
    return Intl.message(
      'Set Location',
      name: 'setLocationButton',
      desc: '',
      args: [],
    );
  }

  /// `We apologize, the request was denied`
  String get requestDeniedTitle {
    return Intl.message(
      'We apologize, the request was denied',
      name: 'requestDeniedTitle',
      desc: '',
      args: [],
    );
  }

  /// `Car rental request {carName} rejected by the showroom.`
  String requestDeniedBody(Object carName) {
    return Intl.message(
      'Car rental request $carName rejected by the showroom.',
      name: 'requestDeniedBody',
      desc: '',
      args: [carName],
    );
  }

  /// `The rental request has been accepted`
  String get rentalAcceptedTitle {
    return Intl.message(
      'The rental request has been accepted',
      name: 'rentalAcceptedTitle',
      desc: '',
      args: [],
    );
  }

  /// `The purchase request has been accepted`
  String get purchaseAcceptedTitle {
    return Intl.message(
      'The purchase request has been accepted',
      name: 'purchaseAcceptedTitle',
      desc: '',
      args: [],
    );
  }

  /// `The showroom has accepted a request to rent a car {carName}. You can review the details in the record.`
  String rentalAcceptedBody(Object carName) {
    return Intl.message(
      'The showroom has accepted a request to rent a car $carName. You can review the details in the record.',
      name: 'rentalAcceptedBody',
      desc: '',
      args: [carName],
    );
  }

  /// `The showroom has accepted your request to buy {carName}. The transaction is now complete.`
  String purchaseAcceptedBody(Object carName) {
    return Intl.message(
      'The showroom has accepted your request to buy $carName. The transaction is now complete.',
      name: 'purchaseAcceptedBody',
      desc: '',
      args: [carName],
    );
  }

  /// `Order Completed`
  String get orderCompletedTitle {
    return Intl.message(
      'Order Completed',
      name: 'orderCompletedTitle',
      desc: '',
      args: [],
    );
  }

  /// `Your rental for {carName} has been marked as completed. Thank you for using our service!`
  String orderCompletedBody(Object carName) {
    return Intl.message(
      'Your rental for $carName has been marked as completed. Thank you for using our service!',
      name: 'orderCompletedBody',
      desc: '',
      args: [carName],
    );
  }

  /// `Failed to pick image: {error}`
  String pickImageError(Object error) {
    return Intl.message(
      'Failed to pick image: $error',
      name: 'pickImageError',
      desc: '',
      args: [error],
    );
  }

  /// `Please select an image first`
  String get selectImageFirstError {
    return Intl.message(
      'Please select an image first',
      name: 'selectImageFirstError',
      desc: '',
      args: [],
    );
  }

  /// `Upload failed. Please try again.`
  String get uploadFailedError {
    return Intl.message(
      'Upload failed. Please try again.',
      name: 'uploadFailedError',
      desc: '',
      args: [],
    );
  }

  /// `Verify Your Commercial License`
  String get verifyCommercialLicenseTitle {
    return Intl.message(
      'Verify Your Commercial License',
      name: 'verifyCommercialLicenseTitle',
      desc: '',
      args: [],
    );
  }

  /// `To ensure the authenticity of your business, please verify your commercial license.`
  String get verifyCommercialLicenseDescription {
    return Intl.message(
      'To ensure the authenticity of your business, please verify your commercial license.',
      name: 'verifyCommercialLicenseDescription',
      desc: '',
      args: [],
    );
  }

  /// `Upload an Image of Your Commercial License`
  String get uploadLicenseImageLabel {
    return Intl.message(
      'Upload an Image of Your Commercial License',
      name: 'uploadLicenseImageLabel',
      desc: '',
      args: [],
    );
  }

  /// `Upload a File`
  String get uploadFileLabel {
    return Intl.message(
      'Upload a File',
      name: 'uploadFileLabel',
      desc: '',
      args: [],
    );
  }

  /// `Gallery`
  String get gallery {
    return Intl.message('Gallery', name: 'gallery', desc: '', args: []);
  }

  /// `Camera`
  String get camera {
    return Intl.message('Camera', name: 'camera', desc: '', args: []);
  }

  /// `Request Details`
  String get requestDetailsTitle {
    return Intl.message(
      'Request Details',
      name: 'requestDetailsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Request {status} successfully`
  String requestUpdatedSuccess(Object status) {
    return Intl.message(
      'Request $status successfully',
      name: 'requestUpdatedSuccess',
      desc: '',
      args: [status],
    );
  }

  /// `Failed to update request: {error}`
  String requestUpdateError(Object error) {
    return Intl.message(
      'Failed to update request: $error',
      name: 'requestUpdateError',
      desc: '',
      args: [error],
    );
  }

  /// `Request By : `
  String get requestByLabel {
    return Intl.message(
      'Request By : ',
      name: 'requestByLabel',
      desc: '',
      args: [],
    );
  }

  /// `The date of request : `
  String get requestDateLabel {
    return Intl.message(
      'The date of request : ',
      name: 'requestDateLabel',
      desc: '',
      args: [],
    );
  }

  /// `Driving License No : `
  String get drivingLicenseLabel {
    return Intl.message(
      'Driving License No : ',
      name: 'drivingLicenseLabel',
      desc: '',
      args: [],
    );
  }

  /// `ID Number : `
  String get idNumberLabel {
    return Intl.message(
      'ID Number : ',
      name: 'idNumberLabel',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number : `
  String get phoneNumberLabel {
    return Intl.message(
      'Phone Number : ',
      name: 'phoneNumberLabel',
      desc: '',
      args: [],
    );
  }

  /// `Accept Request`
  String get acceptRequestButton {
    return Intl.message(
      'Accept Request',
      name: 'acceptRequestButton',
      desc: '',
      args: [],
    );
  }

  /// `Reject Request`
  String get rejectRequestButton {
    return Intl.message(
      'Reject Request',
      name: 'rejectRequestButton',
      desc: '',
      args: [],
    );
  }

  /// `Please log in as a showroom.`
  String get loginAsShowroomError {
    return Intl.message(
      'Please log in as a showroom.',
      name: 'loginAsShowroomError',
      desc: '',
      args: [],
    );
  }

  /// `No rent requests yet.`
  String get noRentRequestsYet {
    return Intl.message(
      'No rent requests yet.',
      name: 'noRentRequestsYet',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settingsTitle {
    return Intl.message('Settings', name: 'settingsTitle', desc: '', args: []);
  }

  /// `Sales profit`
  String get salesProfit {
    return Intl.message(
      'Sales profit',
      name: 'salesProfit',
      desc: '',
      args: [],
    );
  }

  /// `Rent profit`
  String get rentProfit {
    return Intl.message('Rent profit', name: 'rentProfit', desc: '', args: []);
  }

  /// `Last 5 Rent Request`
  String get last5RentRequests {
    return Intl.message(
      'Last 5 Rent Request',
      name: 'last5RentRequests',
      desc: '',
      args: [],
    );
  }

  /// `Manage your Ads!`
  String get manageYourAds {
    return Intl.message(
      'Manage your Ads!',
      name: 'manageYourAds',
      desc: '',
      args: [],
    );
  }

  /// `No ads posted yet.`
  String get noAdsPostedYet {
    return Intl.message(
      'No ads posted yet.',
      name: 'noAdsPostedYet',
      desc: '',
      args: [],
    );
  }

  /// `Advertisement deleted successfully`
  String get adDeletedSuccess {
    return Intl.message(
      'Advertisement deleted successfully',
      name: 'adDeletedSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Advertisement Deleted`
  String get adDeletedTitle {
    return Intl.message(
      'Advertisement Deleted',
      name: 'adDeletedTitle',
      desc: '',
      args: [],
    );
  }

  /// `Your car advertisement for {carName} has been successfully deleted.`
  String adDeletedBody(Object carName) {
    return Intl.message(
      'Your car advertisement for $carName has been successfully deleted.',
      name: 'adDeletedBody',
      desc: '',
      args: [carName],
    );
  }

  /// `Delete Your Ads`
  String get deleteAdsTitle {
    return Intl.message(
      'Delete Your Ads',
      name: 'deleteAdsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete this advertisement?`
  String get deleteAdConfirmationPrompt {
    return Intl.message(
      'Are you sure you want to delete this advertisement?',
      name: 'deleteAdConfirmationPrompt',
      desc: '',
      args: [],
    );
  }

  /// `YES, DELETE IT`
  String get confirmDeleteAd {
    return Intl.message(
      'YES, DELETE IT',
      name: 'confirmDeleteAd',
      desc: '',
      args: [],
    );
  }

  /// `NO, KEEP IT`
  String get keepAd {
    return Intl.message('NO, KEEP IT', name: 'keepAd', desc: '', args: []);
  }

  /// `{sign}{value}%`
  String percentageDisplay(Object sign, Object value) {
    return Intl.message(
      '$sign$value%',
      name: 'percentageDisplay',
      desc: '',
      args: [sign, value],
    );
  }

  /// `See All`
  String get seeAll {
    return Intl.message('See All', name: 'seeAll', desc: '', args: []);
  }

  /// `No recent requests`
  String get noRecentRequests {
    return Intl.message(
      'No recent requests',
      name: 'noRecentRequests',
      desc: '',
      args: [],
    );
  }

  /// `/Day`
  String get perDay {
    return Intl.message('/Day', name: 'perDay', desc: '', args: []);
  }

  /// `Request By : {name}`
  String requestBy(Object name) {
    return Intl.message(
      'Request By : $name',
      name: 'requestBy',
      desc: '',
      args: [name],
    );
  }

  /// `The date of request : {date}`
  String requestDate(Object date) {
    return Intl.message(
      'The date of request : $date',
      name: 'requestDate',
      desc: '',
      args: [date],
    );
  }

  /// `Delete Ads`
  String get deleteAds {
    return Intl.message('Delete Ads', name: 'deleteAds', desc: '', args: []);
  }

  /// `Edit Ads`
  String get editAds {
    return Intl.message('Edit Ads', name: 'editAds', desc: '', args: []);
  }

  /// `Date : {date}`
  String dateLabel(Object date) {
    return Intl.message(
      'Date : $date',
      name: 'dateLabel',
      desc: '',
      args: [date],
    );
  }

  /// `Manage your showroom today`
  String get manageShowroomToday {
    return Intl.message(
      'Manage your showroom today',
      name: 'manageShowroomToday',
      desc: '',
      args: [],
    );
  }

  /// `Shipping Address`
  String get shippingAddressLabel {
    return Intl.message(
      'Shipping Address',
      name: 'shippingAddressLabel',
      desc: '',
      args: [],
    );
  }

  /// `CarAds Inc.`
  String get merchantName {
    return Intl.message(
      'CarAds Inc.',
      name: 'merchantName',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
