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
