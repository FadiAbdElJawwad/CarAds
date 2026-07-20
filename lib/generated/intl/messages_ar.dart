// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ar locale. All the
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
  String get localeName => 'ar';

  static String m0(carName) => "تم حذف إعلان سيارتك لـ ${carName} بنجاح.";

  static String m1(brand) => "تم نشر إعلان سيارتك لـ ${brand} بنجاح.";

  static String m2(brand) => "تم تحديث إعلان سيارتك لـ ${brand} بنجاح.";

  static String m3(time) => "السيارة متاحة فقط من ${time} في هذا اليوم.";

  static String m4(time) => "يجب إعادة السيارة بحلول ${time} في اليوم الأخير.";

  static String m5(date) => "التاريخ: ${date}";

  static String m6(newEmail) =>
      "تم بدء طلب لتغيير بريدك الإلكتروني إلى ${newEmail}.";

  static String m7(phoneNumber) =>
      "أدخل الرمز المكون من 6 أرقام المرسل إلى ${phoneNumber}";

  static String m8(error) => "خطأ في جلب بيانات المعرض: ${error}";

  static String m9(error) => "خطأ: ${error}";

  static String m10(fieldName) => "${fieldName} لا يمكن أن يكون فارغاً";

  static String m11(count) => "تم العثور على ${count}";

  static String m12(error) => "فشل تحميل السيارات: ${error}";

  static String m13(carName) =>
      "طلب مستخدم استئجار ${carName}. تحقق من طلباتك.";

  static String m14(carName) =>
      "تم وضع علامة على استئجار ${carName} كمكتمل. شكراً لاستخدامك خدمتنا!";

  static String m15(sign, value) => "${sign}${value}%";

  static String m16(newPhone) => "تم تحديث رقم هاتفك إلى ${newPhone} بنجاح.";

  static String m17(error) => "فشل اختيار الصورة: ${error}";

  static String m18(carName) =>
      "لقد قبل المعرض طلبك لشراء ${carName}. المعاملة اكتملت الآن.";

  static String m19(carName) =>
      "لقد قبل المعرض طلب استئجار سيارة ${carName}. يمكنك مراجعة التفاصيل في السجل.";

  static String m20(carName) => "تم تقديم طلب الإيجار لسيارة ${carName} بنجاح.";

  static String m21(name) => "طلب بواسطة: ${name}";

  static String m22(date) => "تاريخ الطلب: ${date}";

  static String m23(carName) =>
      "تم رفض طلب استئجار السيارة ${carName} من قبل المعرض.";

  static String m24(error) => "فشل تحديث الطلب: ${error}";

  static String m25(status) => "تم ${status} الطلب بنجاح";

  static String m26(query) => "نتائج البحث عن \"${query}\"";

  static String m27(count) => "${count} مقاعد";

  static String m28(showroomName) => "إعلانات ${showroomName}";

  static String m29(userName) => "مرحباً ${userName}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "aboutShowroom": MessageLookupByLibrary.simpleMessage("عن المعرض"),
    "acceptRequestButton": MessageLookupByLibrary.simpleMessage("قبول الطلب"),
    "accountCreatedSuccess": MessageLookupByLibrary.simpleMessage(
      "تم إنشاء الحساب بنجاح.",
    ),
    "adDeletedBody": m0,
    "adDeletedSuccess": MessageLookupByLibrary.simpleMessage(
      "تم حذف الإعلان بنجاح",
    ),
    "adDeletedTitle": MessageLookupByLibrary.simpleMessage("تم حذف الإعلان"),
    "adPostedBody": m1,
    "adPostedSuccess": MessageLookupByLibrary.simpleMessage(
      "تم نشر الإعلان بنجاح!",
    ),
    "adPostedTitle": MessageLookupByLibrary.simpleMessage("تم نشر الإعلان"),
    "adUpdatedBody": m2,
    "adUpdatedSuccess": MessageLookupByLibrary.simpleMessage(
      "تم تحديث الإعلان بنجاح!",
    ),
    "adUpdatedTitle": MessageLookupByLibrary.simpleMessage("تم تحديث الإعلان"),
    "add": MessageLookupByLibrary.simpleMessage("أضف"),
    "addCurrentEmailPrompt": MessageLookupByLibrary.simpleMessage(
      "أضف بريدك الإلكتروني الحالي",
    ),
    "addNewEmailPrompt": MessageLookupByLibrary.simpleMessage(
      "أضف بريدك الإلكتروني الجديد",
    ),
    "addPriceHint": MessageLookupByLibrary.simpleMessage("إضافة السعر"),
    "addressEmptyError": MessageLookupByLibrary.simpleMessage(
      "يرجى إدخال العنوان",
    ),
    "addressNotAvailable": MessageLookupByLibrary.simpleMessage(
      "العنوان غير متوفر",
    ),
    "aed": MessageLookupByLibrary.simpleMessage("درهم"),
    "aedPerDay": MessageLookupByLibrary.simpleMessage("درهم/يوم"),
    "agreeRentalTermsPrompt": MessageLookupByLibrary.simpleMessage(
      "هل توافق على شروط الإيجار",
    ),
    "agreeTermsError": MessageLookupByLibrary.simpleMessage(
      "يجب عليك الموافقة على شروط الإيجار للمتابعة.",
    ),
    "all": MessageLookupByLibrary.simpleMessage("الكل"),
    "allCars": MessageLookupByLibrary.simpleMessage("كل السيارات"),
    "allCategories": MessageLookupByLibrary.simpleMessage("جميع الفئات"),
    "allDone": MessageLookupByLibrary.simpleMessage("تم بنجاح !"),
    "alreadyHaveAccount": MessageLookupByLibrary.simpleMessage(
      "هل لديك حساب بالفعل؟",
    ),
    "amountLabel": MessageLookupByLibrary.simpleMessage("المبلغ"),
    "anErrorOccurred": MessageLookupByLibrary.simpleMessage("حدث خطأ ما"),
    "apply": MessageLookupByLibrary.simpleMessage("تطبيق"),
    "arabic": MessageLookupByLibrary.simpleMessage("العربية"),
    "audi": MessageLookupByLibrary.simpleMessage("أودي"),
    "authenticationError": MessageLookupByLibrary.simpleMessage(
      "خطأ في المصادقة",
    ),
    "availableFrom": MessageLookupByLibrary.simpleMessage("متاح من"),
    "availableUntil": MessageLookupByLibrary.simpleMessage("متاح حتى"),
    "backToProfileButton": MessageLookupByLibrary.simpleMessage(
      "العودة إلى الملف الشخصي",
    ),
    "brandLabel": MessageLookupByLibrary.simpleMessage("الماركة"),
    "brands": MessageLookupByLibrary.simpleMessage("الماركات"),
    "buyButton": MessageLookupByLibrary.simpleMessage("شراء"),
    "camera": MessageLookupByLibrary.simpleMessage("الكاميرا"),
    "cancelClearHistory": MessageLookupByLibrary.simpleMessage(
      "لا، لقد غيرت رأيي!",
    ),
    "carAvailableFromError": m3,
    "carBrandHint": MessageLookupByLibrary.simpleMessage("ماركة السيارة"),
    "carBrands": MessageLookupByLibrary.simpleMessage("Car Brands"),
    "carCondition": MessageLookupByLibrary.simpleMessage("حالة السيارة"),
    "carForRent": MessageLookupByLibrary.simpleMessage("سيارة للإيجار"),
    "carForSale": MessageLookupByLibrary.simpleMessage("سيارة للبيع"),
    "carInformation": MessageLookupByLibrary.simpleMessage("معلومات السيارة"),
    "carModelHint": MessageLookupByLibrary.simpleMessage("موديل السيارة"),
    "carReturnByError": m4,
    "carSummaryTitle": MessageLookupByLibrary.simpleMessage("ملخص السيارة"),
    "changeEmailTitle": MessageLookupByLibrary.simpleMessage(
      "تغيير البريد الإلكتروني",
    ),
    "changeLanguageTitle": MessageLookupByLibrary.simpleMessage("تغيير اللغة"),
    "changePhoneTitle": MessageLookupByLibrary.simpleMessage(
      "تغيير رقم الهاتف",
    ),
    "changeYourEmailMenu": MessageLookupByLibrary.simpleMessage(
      "تغيير بريدك الإلكتروني",
    ),
    "changeYourPasswordMenu": MessageLookupByLibrary.simpleMessage(
      "تغيير كلمة المرور",
    ),
    "changeYourPhoneMenu": MessageLookupByLibrary.simpleMessage(
      "تغيير رقم هاتفك",
    ),
    "changesSavedSuccess": MessageLookupByLibrary.simpleMessage(
      "تهانينا! تم حفظ تغييراتك بنجاح!",
    ),
    "checkoutTitle": MessageLookupByLibrary.simpleMessage("إتمام الطلب"),
    "clearAll": MessageLookupByLibrary.simpleMessage("مسح الكل"),
    "clearHistoryPrompt": MessageLookupByLibrary.simpleMessage(
      "هل أنت متأكد أنك تريد مسح السجل بالكامل؟",
    ),
    "clearHistoryTitle": MessageLookupByLibrary.simpleMessage("مسح السجل"),
    "clearHistoryWarning": MessageLookupByLibrary.simpleMessage(
      "هل أنت متأكد من أنك تريد مسح السجل الخاص بك؟ لا يمكن التراجع عن هذا الإجراء، لذا يرجى المتابعة بحذر.",
    ),
    "commercial": MessageLookupByLibrary.simpleMessage("تجاري"),
    "commercialAdLabel": MessageLookupByLibrary.simpleMessage("إعلان تجاري"),
    "commercialLicenseNumberHint": MessageLookupByLibrary.simpleMessage(
      "رقم الرخصة التجارية",
    ),
    "commercialLicenseRequired": MessageLookupByLibrary.simpleMessage(
      "الرخصة التجارية*",
    ),
    "completeRentalPeriodError": MessageLookupByLibrary.simpleMessage(
      "يرجى اختيار فترة الإيجار كاملة (التواريخ والأوقات).",
    ),
    "completeVerification": MessageLookupByLibrary.simpleMessage(
      "إكمال التحقق",
    ),
    "condition": MessageLookupByLibrary.simpleMessage("الحالة"),
    "confirmBuyTitle": MessageLookupByLibrary.simpleMessage("تأكيد الشراء"),
    "confirmClearHistory": MessageLookupByLibrary.simpleMessage("نعم، امسحه"),
    "confirmDeleteAd": MessageLookupByLibrary.simpleMessage("نعم، احذفه"),
    "confirmPasswordHint": MessageLookupByLibrary.simpleMessage(
      "تأكيد كلمة المرور",
    ),
    "confirmPurchaseButton": MessageLookupByLibrary.simpleMessage(
      "تأكيد الشراء",
    ),
    "confirmRentTitle": MessageLookupByLibrary.simpleMessage("تأكيد الإيجار"),
    "confirmRentalButton": MessageLookupByLibrary.simpleMessage(
      "تأكيد الإيجار",
    ),
    "contactInformation": MessageLookupByLibrary.simpleMessage(
      "معلومات الاتصال:",
    ),
    "continueButton": MessageLookupByLibrary.simpleMessage("متابعة"),
    "couldNotDetermineAddress": MessageLookupByLibrary.simpleMessage(
      "تعذر تحديد العنوان. يرجى المحاولة مرة أخرى.",
    ),
    "currentEmailHint": MessageLookupByLibrary.simpleMessage(
      "البريد الإلكتروني الحالي",
    ),
    "currentPasswordHint": MessageLookupByLibrary.simpleMessage(
      "كلمة المرور الحالية",
    ),
    "dataSecurityMessage": MessageLookupByLibrary.simpleMessage(
      "بياناتك محفوظة بأمان لدينا!",
    ),
    "dateLabel": m5,
    "days": MessageLookupByLibrary.simpleMessage("أيام"),
    "deleteAdConfirmationPrompt": MessageLookupByLibrary.simpleMessage(
      "هل أنت متأكد أنك تريد حذف هذا الإعلان؟",
    ),
    "deleteAds": MessageLookupByLibrary.simpleMessage("حذف الإعلانات"),
    "deleteAdsTitle": MessageLookupByLibrary.simpleMessage("حذف إعلاناتك"),
    "description": MessageLookupByLibrary.simpleMessage("الوصف"),
    "descriptionHint": MessageLookupByLibrary.simpleMessage(
      "قدم وصفاً موجزاً لسيارتك",
    ),
    "dontHaveAccount": MessageLookupByLibrary.simpleMessage("لا تملك حسابا؟"),
    "doors": MessageLookupByLibrary.simpleMessage("الأبواب"),
    "drivingLicenseEmpty": MessageLookupByLibrary.simpleMessage(
      "رقم رخصة القيادة لا يمكن أن يكون فارغاً",
    ),
    "drivingLicenseLabel": MessageLookupByLibrary.simpleMessage(
      "رقم رخصة القيادة: ",
    ),
    "drivingLicenseMustBeNumber": MessageLookupByLibrary.simpleMessage(
      "رقم رخصة القيادة يجب أن يكون رقماً",
    ),
    "drivingLicenseNoHint": MessageLookupByLibrary.simpleMessage(
      "رقم رخصة القيادة",
    ),
    "drivingLicenseTooLong": MessageLookupByLibrary.simpleMessage(
      "رقم رخصة القيادة يجب أن يكون أقل من 10 أرقام",
    ),
    "dummyTermsText": MessageLookupByLibrary.simpleMessage(
      "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التى يولدها التطبيق.",
    ),
    "editAdTitle": MessageLookupByLibrary.simpleMessage("تعديل إعلانك"),
    "editAds": MessageLookupByLibrary.simpleMessage("تعديل الإعلانات"),
    "email": MessageLookupByLibrary.simpleMessage("البريد الإلكتروني"),
    "emailAlreadyInUse": MessageLookupByLibrary.simpleMessage(
      "هذا البريد الإلكتروني مستخدم بالفعل من قبل حساب آخر.",
    ),
    "emailChangeRequestedBody": m6,
    "emailChangeRequestedTitle": MessageLookupByLibrary.simpleMessage(
      "طلب تغيير البريد الإلكتروني",
    ),
    "emailVerificationSent": MessageLookupByLibrary.simpleMessage(
      "تم إرسال رابط تحقق إلى بريدك الإلكتروني الجديد. يرجى التحقق منه وتسجيل الدخول مرة أخرى.",
    ),
    "emptyEmail": MessageLookupByLibrary.simpleMessage(
      "يرجى إدخال بريدك الإلكتروني",
    ),
    "emptyMobile": MessageLookupByLibrary.simpleMessage(
      "يرجى إدخال رقم هاتفك المحمول",
    ),
    "emptyName": MessageLookupByLibrary.simpleMessage("يرجى إدخال اسمك"),
    "emptyPassword": MessageLookupByLibrary.simpleMessage(
      "يرجى إدخال كلمة المرور الخاصة بك",
    ),
    "endMileageHint": MessageLookupByLibrary.simpleMessage("نهاية المسافة"),
    "endYearHint": MessageLookupByLibrary.simpleMessage("سنة النهاية"),
    "english": MessageLookupByLibrary.simpleMessage("الإنجليزية"),
    "enterNameError": MessageLookupByLibrary.simpleMessage("يرجى إدخال اسمك"),
    "enterNameHint": MessageLookupByLibrary.simpleMessage("أدخل اسمك"),
    "enterNewMobilePrompt": MessageLookupByLibrary.simpleMessage(
      "أدخل رقم هاتفك المحمول الجديد لتلقي رمز التحقق.",
    ),
    "enterOtpError": MessageLookupByLibrary.simpleMessage(
      "يرجى إدخال رمز التحقق المكون من 6 أرقام",
    ),
    "enterOtpSentTo": m7,
    "enterPhoneError": MessageLookupByLibrary.simpleMessage(
      "يرجى إدخال رقم هاتفك",
    ),
    "errorFetchingShowroom": m8,
    "errorWithDetails": m9,
    "explore": MessageLookupByLibrary.simpleMessage("استكشف"),
    "faqAnswer1": MessageLookupByLibrary.simpleMessage(
      "يمكنك حجز سيارة من خلال تصفح قوائم السيارات لدينا، واختيار السيارة التي تناسب احتياجاتك، واتباع عملية الدفع لتأكيد حجزك.",
    ),
    "faqAnswer2": MessageLookupByLibrary.simpleMessage(
      "عادةً، ستحتاج إلى رخصة قيادة سارية، وهوية وطنية أو جواز سفر، وفي بعض الحالات، بطاقة ائتمان لمبلغ التأمين.",
    ),
    "faqAnswer3": MessageLookupByLibrary.simpleMessage(
      "نعم، يمكن إلغاء الحجوزات من خلال قسم السجل. يرجى مراجعة سياسة الإلغاء الخاصة بنا للحصول على معلومات حول الرسوم المحتملة.",
    ),
    "faqAnswer4": MessageLookupByLibrary.simpleMessage(
      "تشمل معظم الإيجارات تأميناً أساسياً. يمكنك اختيار تغطية إضافية أثناء عملية الدفع لمزيد من راحة البال.",
    ),
    "faqAnswer5": MessageLookupByLibrary.simpleMessage(
      "يمكنك الوصول إلى فريق الدعم الخاص بنا عبر تفاصيل الاتصال المقدمة في التطبيق أو من خلال قسم الدعم في ملفك الشخصي.",
    ),
    "faqHeader": MessageLookupByLibrary.simpleMessage(
      "لديك أسئلة؟ لدينا إجابات!",
    ),
    "faqQuestion1": MessageLookupByLibrary.simpleMessage(
      "كيف يمكنني حجز سيارة؟",
    ),
    "faqQuestion2": MessageLookupByLibrary.simpleMessage(
      "ما هي الوثائق المطلوبة للإيجار؟",
    ),
    "faqQuestion3": MessageLookupByLibrary.simpleMessage(
      "هل يمكنني إلغاء حجزي؟",
    ),
    "faqQuestion4": MessageLookupByLibrary.simpleMessage("هل التأمين مشمول؟"),
    "faqQuestion5": MessageLookupByLibrary.simpleMessage(
      "كيف يمكنني الاتصال بدعم العملاء؟",
    ),
    "faqsTitle": MessageLookupByLibrary.simpleMessage("الأسئلة الشائعة"),
    "featured": MessageLookupByLibrary.simpleMessage("مميز"),
    "featuredAdDescription": MessageLookupByLibrary.simpleMessage(
      "الإعلانات المميزة تتيح لك الوصول إلى أكبر شريحة من المستخدمين.",
    ),
    "featuredAdLabel": MessageLookupByLibrary.simpleMessage("إعلان مميز"),
    "fieldCannotBeEmpty": m10,
    "fillRentalDatesError": MessageLookupByLibrary.simpleMessage(
      "يرجى ملء جميع تواريخ وأوقات الإيجار",
    ),
    "filterTitle": MessageLookupByLibrary.simpleMessage("Filter"),
    "forgotPassword": MessageLookupByLibrary.simpleMessage("نسيت كلمة المرور؟"),
    "forgotPasswordBody": MessageLookupByLibrary.simpleMessage(
      "لا تقلق! سنساعدك في إعادة تعيين كلمة المرور. فقط أدخل رقم هاتفك المسجل، وسنرسل لك رمزا لإعادة تعيين كلمة المرور.",
    ),
    "fullNameLabel": MessageLookupByLibrary.simpleMessage("الاسم الكامل"),
    "gallery": MessageLookupByLibrary.simpleMessage("المعرض"),
    "gearBox": MessageLookupByLibrary.simpleMessage("ناقل الحركة"),
    "goToHome": MessageLookupByLibrary.simpleMessage("الذهاب إلى الرئيسية"),
    "history": MessageLookupByLibrary.simpleMessage("السجل"),
    "home": MessageLookupByLibrary.simpleMessage("الرئيسية"),
    "hyundai": MessageLookupByLibrary.simpleMessage("هيونداي"),
    "idNumberEmpty": MessageLookupByLibrary.simpleMessage(
      "رقم الهوية لا يمكن أن يكون فارغاً",
    ),
    "idNumberHint": MessageLookupByLibrary.simpleMessage("رقم الهوية"),
    "idNumberLabel": MessageLookupByLibrary.simpleMessage("رقم الهوية: "),
    "idNumberMustBeNumber": MessageLookupByLibrary.simpleMessage(
      "رقم الهوية يجب أن يكون رقماً",
    ),
    "idNumberTooLong": MessageLookupByLibrary.simpleMessage(
      "رقم الهوية يجب أن يكون أقل من 9 أرقام",
    ),
    "includeCountryCodeError": MessageLookupByLibrary.simpleMessage(
      "يرجى تضمين رمز الدولة (مثال: 971+)",
    ),
    "incorrectCurrentPassword": MessageLookupByLibrary.simpleMessage(
      "كلمة المرور الحالية التي أدخلتها غير صحيحة.",
    ),
    "incorrectEmail": MessageLookupByLibrary.simpleMessage(
      "يرجى إدخال عنوان بريد إلكتروني صالح",
    ),
    "incorrectPassword": MessageLookupByLibrary.simpleMessage(
      "يجب أن تكون كلمة المرور على الأقل 6 أحرف",
    ),
    "individualSellerLabel": MessageLookupByLibrary.simpleMessage("بائع فردي"),
    "invalidCredential": MessageLookupByLibrary.simpleMessage(
      "البريد إلكتروني أو كلمة مرور غير صالحة.",
    ),
    "invalidEmail": MessageLookupByLibrary.simpleMessage(
      "البريد الإلكتروني غير صالح.",
    ),
    "invalidEmailFormat": MessageLookupByLibrary.simpleMessage(
      "صيغة البريد الإلكتروني غير صحيحة.",
    ),
    "invalidMobile": MessageLookupByLibrary.simpleMessage(
      "يرجى إدخال رقم هاتف صحيح",
    ),
    "itemsFound": m11,
    "keepAd": MessageLookupByLibrary.simpleMessage("لا، احتفظ به"),
    "language": MessageLookupByLibrary.simpleMessage("اللغة"),
    "last5RentRequests": MessageLookupByLibrary.simpleMessage(
      "آخر 5 طلبات إيجار",
    ),
    "licenseNumberEmptyError": MessageLookupByLibrary.simpleMessage(
      "يرجى إدخال رقم الرخصة",
    ),
    "loadCarsFailed": m12,
    "loading": MessageLookupByLibrary.simpleMessage("جاري التحميل..."),
    "loadingLocation": MessageLookupByLibrary.simpleMessage(
      "جاري تحميل الموقع...",
    ),
    "location": MessageLookupByLibrary.simpleMessage("الموقع"),
    "locationPermissionsDenied": MessageLookupByLibrary.simpleMessage(
      "تم رفض أذونات الموقع",
    ),
    "locationPermissionsPermanentlyDenied":
        MessageLookupByLibrary.simpleMessage(
          "أذونات الموقع مرفوضة نهائياً، لا يمكننا طلب الأذونات.",
        ),
    "locationServicesDisabled": MessageLookupByLibrary.simpleMessage(
      "خدمات الموقع معطلة.",
    ),
    "loggedInSuccess": MessageLookupByLibrary.simpleMessage(
      "تم تسجيل الدخول بنجاح.",
    ),
    "login": MessageLookupByLibrary.simpleMessage("تسجيل الدخول"),
    "loginAsShowroomError": MessageLookupByLibrary.simpleMessage(
      "يرجى تسجيل الدخول كمعرض.",
    ),
    "loginBody": MessageLookupByLibrary.simpleMessage(
      "سجل الدخول إلى حسابك واستعد إلى المسار الصحيح مع CarAds",
    ),
    "loginRequired": MessageLookupByLibrary.simpleMessage(
      "يرجى تسجيل الدخول أولاً.",
    ),
    "loginTitle": MessageLookupByLibrary.simpleMessage(
      "مرحبا بعودتكم إلى CarAds!",
    ),
    "logout": MessageLookupByLibrary.simpleMessage("تسجيل الخروج"),
    "manageShowroomToday": MessageLookupByLibrary.simpleMessage(
      "إدارة معرضك اليوم",
    ),
    "manageYourAds": MessageLookupByLibrary.simpleMessage("إدارة إعلاناتك!"),
    "mazda": MessageLookupByLibrary.simpleMessage("مازدا"),
    "merchantName": MessageLookupByLibrary.simpleMessage("كار آدز"),
    "mileage": MessageLookupByLibrary.simpleMessage("المسافة المقطوعة"),
    "mileageTitle": MessageLookupByLibrary.simpleMessage("المسافة المقطوعة"),
    "mobileNumberLabel": MessageLookupByLibrary.simpleMessage(
      "رقم الهاتف المحمول",
    ),
    "mobileStartWithCountryCode": MessageLookupByLibrary.simpleMessage(
      "رقم الهاتف يجب أن يبدأ برمز الدولة (مثال: 971+)",
    ),
    "modelLabel": MessageLookupByLibrary.simpleMessage("الموديل"),
    "months": MessageLookupByLibrary.simpleMessage("أشهر"),
    "name": MessageLookupByLibrary.simpleMessage("الاسم الكامل"),
    "nameHint": MessageLookupByLibrary.simpleMessage("الاسم"),
    "newCondition": MessageLookupByLibrary.simpleMessage("جديد"),
    "newEmailHint": MessageLookupByLibrary.simpleMessage(
      "البريد الإلكتروني الجديد",
    ),
    "newPasswordHint": MessageLookupByLibrary.simpleMessage(
      "كلمة المرور الجديدة",
    ),
    "newRentalRequestShowroomBody": m13,
    "newRentalRequestTitle": MessageLookupByLibrary.simpleMessage(
      "طلب إيجار جديد!",
    ),
    "next": MessageLookupByLibrary.simpleMessage("التالي"),
    "noAddressProvided": MessageLookupByLibrary.simpleMessage(
      "لم يتم توفير عنوان",
    ),
    "noAdsMatchingFilters": MessageLookupByLibrary.simpleMessage(
      "لا توجد إعلانات تطابق عوامل التصفية الخاصة بك",
    ),
    "noAdsPostedYet": MessageLookupByLibrary.simpleMessage(
      "لا توجد إعلانات منشورة بعد.",
    ),
    "noDescription": MessageLookupByLibrary.simpleMessage("لا يوجد وصف متاح."),
    "noHistoryFound": MessageLookupByLibrary.simpleMessage(
      "لا توجد طلبات في سجلك.",
    ),
    "noHistoryYet": MessageLookupByLibrary.simpleMessage("لا يوجد سجل بعد."),
    "noName": MessageLookupByLibrary.simpleMessage("بدون اسم"),
    "noNotificationsYet": MessageLookupByLibrary.simpleMessage(
      "لا توجد إشعارات بعد.",
    ),
    "noRecentRequests": MessageLookupByLibrary.simpleMessage(
      "لا توجد طلبات حديثة",
    ),
    "noRentRequestsYet": MessageLookupByLibrary.simpleMessage(
      "لا توجد طلبات إيجار بعد.",
    ),
    "noShowroomsFound": MessageLookupByLibrary.simpleMessage(
      "لم يتم العثور على معارض",
    ),
    "noSuggestedAds": MessageLookupByLibrary.simpleMessage(
      "لا توجد إعلانات مقترحة متاحة لهذه السيارة.",
    ),
    "notAvailable": MessageLookupByLibrary.simpleMessage("غير متوفر"),
    "notificationChannelDescription": MessageLookupByLibrary.simpleMessage(
      "تُستخدم هذه القناة للإشعارات المهمة.",
    ),
    "notificationChannelName": MessageLookupByLibrary.simpleMessage(
      "إشعارات عالية الأهمية",
    ),
    "notificationsTitle": MessageLookupByLibrary.simpleMessage("الإشعارات"),
    "onbordingModelBody1": MessageLookupByLibrary.simpleMessage(
      "CarAds هو وجهتك النهائية لمعارض السيارات ومكاتب التأجير في الإعلانات. سواء كنت مالك معرض سيارات أو تبحث عن استئجار سيارة، منصتنا تلبي كل شيء!",
    ),
    "onbordingModelBody2": MessageLookupByLibrary.simpleMessage(
      "هل أنت في معرض سيارات أو مالك مكتب تأجير؟ أنشئ حسابك الخاص الآن! يمكنك إدارة وترويج إعلاناتك بسهولة خلال بضع نقرات. الوصول إلى جمهور أوسع، وتلقي الاستفسارات مع CarAds",
    ),
    "onbordingModelBody3": MessageLookupByLibrary.simpleMessage(
      "اكتشف مجموعة واسعة من إعلانات السيارات المصممة خصيصا لتفضيلاتك. تصفح نماذج السيارات المختلفة، وعروض التأجير، والعروض الحصرية مذن صالات العرض المحلية. مع CarAds",
    ),
    "onbordingModelTitle1": MessageLookupByLibrary.simpleMessage(
      "مرحبا بكم في تطبيق CarAds",
    ),
    "onbordingModelTitle2": MessageLookupByLibrary.simpleMessage(
      "إدارة الإعلانات بلا جهد",
    ),
    "onbordingModelTitle3": MessageLookupByLibrary.simpleMessage(
      "استكشف خياراتك",
    ),
    "orderCompletedBody": m14,
    "orderCompletedTitle": MessageLookupByLibrary.simpleMessage("اكتمل الطلب"),
    "orderDate": MessageLookupByLibrary.simpleMessage("تاريخ الطلب"),
    "orderDateLabel": MessageLookupByLibrary.simpleMessage("تاريخ الطلب:"),
    "orderDetailsNotFound": MessageLookupByLibrary.simpleMessage(
      "لم يتم العثور على تفاصيل الطلب.",
    ),
    "orderHistoryTitle": MessageLookupByLibrary.simpleMessage("سجل الطلبات"),
    "orderLabel": MessageLookupByLibrary.simpleMessage("الطلب"),
    "orderStatus": MessageLookupByLibrary.simpleMessage("الحالة"),
    "pageHomeConfirm": MessageLookupByLibrary.simpleMessage("يبلبيل بيسلبيل"),
    "password": MessageLookupByLibrary.simpleMessage("كلمة المرور"),
    "passwordChangedBody": MessageLookupByLibrary.simpleMessage(
      "تم تغيير كلمة مرور حسابك بنجاح.",
    ),
    "passwordChangedTitle": MessageLookupByLibrary.simpleMessage(
      "تم تغيير كلمة المرور",
    ),
    "passwordRequiredError": MessageLookupByLibrary.simpleMessage(
      "كلمة المرور مطلوبة",
    ),
    "passwordResetEmailSent": MessageLookupByLibrary.simpleMessage(
      "تم إرسال بريد إعادة تعيين كلمة المرور بنجاح!",
    ),
    "passwordSameAsCurrent": MessageLookupByLibrary.simpleMessage(
      "كلمة المرور الجديدة لا يمكن أن تكون مطابقة للحالية",
    ),
    "passwordsDoNotMatch": MessageLookupByLibrary.simpleMessage(
      "كلمات المرور غير متطابقة",
    ),
    "paymentFailedError": MessageLookupByLibrary.simpleMessage(
      "فشلت عملية الدفع أو تم إلغاؤها. يرجى المحاولة مرة أخرى.",
    ),
    "paymentMethods": MessageLookupByLibrary.simpleMessage("طرق الدفع"),
    "perDay": MessageLookupByLibrary.simpleMessage("/يوم"),
    "percentageDisplay": m15,
    "phoneHint": MessageLookupByLibrary.simpleMessage("+971 XXXXXXXXX"),
    "phoneNumber": MessageLookupByLibrary.simpleMessage("رقم الهاتف"),
    "phoneNumberHint": MessageLookupByLibrary.simpleMessage("رقم الهاتف"),
    "phoneNumberLabel": MessageLookupByLibrary.simpleMessage("رقم الهاتف: "),
    "phoneNumberRequired": MessageLookupByLibrary.simpleMessage("رقم الهاتف *"),
    "phoneUpdatedBody": m16,
    "phoneUpdatedSuccess": MessageLookupByLibrary.simpleMessage(
      "تم تحديث رقم الهاتف بنجاح!",
    ),
    "phoneUpdatedTitle": MessageLookupByLibrary.simpleMessage(
      "تم تحديث رقم الهاتف",
    ),
    "pickImageError": m17,
    "pleaseSelectLocationOnMap": MessageLookupByLibrary.simpleMessage(
      "يرجى اختيار موقع على الخريطة",
    ),
    "postAd": MessageLookupByLibrary.simpleMessage("نشر إعلان"),
    "postAdTitle": MessageLookupByLibrary.simpleMessage("نشر إعلانك"),
    "price": MessageLookupByLibrary.simpleMessage("السعر"),
    "priceDetailsTitle": MessageLookupByLibrary.simpleMessage("تفاصيل السعر"),
    "priceEmptyError": MessageLookupByLibrary.simpleMessage(
      "السعر لا يمكن أن يكون فارغاً",
    ),
    "priceRange": MessageLookupByLibrary.simpleMessage("مدى السعر"),
    "privacyPolicyIntro": MessageLookupByLibrary.simpleMessage(
      "في كار آدز، نحن ملتزمون بحماية خصوصيتك وضمان أمن معلوماتك الشخصية. توضح سياسة الخصوصية هذه كيفية جمع بياناتك واستخدامها وحمايتها عند استخدام تطبيقنا للهاتف المحمول.",
    ),
    "privacyPolicyTitle": MessageLookupByLibrary.simpleMessage(
      "سياسة الخصوصية",
    ),
    "privacySectionContent1": MessageLookupByLibrary.simpleMessage(
      "قد نجمع بعض المعلومات الشخصية منك، مثل اسمك وعنوان بريدك الإلكتروني وتفاصيل الاتصال عند التسجيل أو استخدام خدماتنا. تُستخدم هذه المعلومات لتخصيص تجربتك وتحسين خدماتنا والتواصل معك.",
    ),
    "privacySectionContent2": MessageLookupByLibrary.simpleMessage(
      "عند استخدام تطبيقنا، قد نجمع المعلومات التي يرسلها جهازك المحمول، مثل معرف الجهاز وعنوان IP واسم الجهاز وإصدار نظام التشغيل. تُستخدم هذه البيانات لتحليل أداء التطبيق وتحسين تجربة المستخدم.",
    ),
    "privacySectionContent3": MessageLookupByLibrary.simpleMessage(
      "قد نستخدم ملفات تعريف الارتباط وتقنيات التتبع المشابهة لتتبع النشاط على تطبيقنا والاحتفاظ بمعلومات معينة. يمكنك توجيه متصفحك لرفض جميع ملفات تعريف الارتباط أو الإشارة إلى وقت إرسال ملف تعريف الارتباط.",
    ),
    "privacySectionContent4": MessageLookupByLibrary.simpleMessage(
      "قد نستعين بشركات وأفراد من جهات خارجية لتسهيل خدماتنا، أو أداء المهام المتعلقة بالخدمة، أو مساعدتنا في تحليل كيفية استخدام تطبيقنا. هذه الأطراف الثالثة لديها حق الوصول إلى معلوماتك الشخصية فقط لأداء هذه المهام نيابة عنا.",
    ),
    "privacySectionContent5": MessageLookupByLibrary.simpleMessage(
      "أمن معلوماتك الشخصية مهم بالنسبة لنا. نحن نسعى جاهدين لاستخدام وسائل مقبولة تجارياً لحماية معلوماتك الشخصية، ولكن يرجى تذكر أنه لا توجد طريقة نقل عبر الإنترنت أو طريقة تخزين إلكتروني آمنة بنسبة 100٪.",
    ),
    "privacySectionContent6": MessageLookupByLibrary.simpleMessage(
      "قد يحتوي تطبيقنا على روابط لمواقع أخرى لا نديرها نحن. إذا قمت بالنقر فوق رابط جهة خارجية، فسيتم توجيهك إلى موقع تلك الجهة الخارجية. ننصحك بشدة بمراجعة سياسة الخصوصية لكل موقع تزوره.",
    ),
    "privacySectionContent7": MessageLookupByLibrary.simpleMessage(
      "قد نقوم بتحديث سياسة الخصوصية الخاصة بنا من وقت لآخر. سنخطرك بأي تغييرات عن طريق نشر سياسة الخصوصية الجديدة على هذه الصفحة. ننصحك بمراجعة سياسة الخصوصية هذه بشكل دوري لأي تغييرات.",
    ),
    "privacySectionTitle1": MessageLookupByLibrary.simpleMessage(
      "1. جمع المعلومات واستخدامها:",
    ),
    "privacySectionTitle2": MessageLookupByLibrary.simpleMessage(
      "2. بيانات السجل:",
    ),
    "privacySectionTitle3": MessageLookupByLibrary.simpleMessage(
      "3. ملفات تعريف الارتباط والتقنيات المشابهة:",
    ),
    "privacySectionTitle4": MessageLookupByLibrary.simpleMessage(
      "4. مقدمو الخدمة:",
    ),
    "privacySectionTitle5": MessageLookupByLibrary.simpleMessage("5. الأمن:"),
    "privacySectionTitle6": MessageLookupByLibrary.simpleMessage(
      "6. روابط لمواقع أخرى:",
    ),
    "privacySectionTitle7": MessageLookupByLibrary.simpleMessage(
      "7. التغييرات في سياسة الخصوصية هذه:",
    ),
    "profile": MessageLookupByLibrary.simpleMessage("الحساب"),
    "profileImageUploadError": MessageLookupByLibrary.simpleMessage(
      "فشل تحميل صورة الملف الشخصي. يرجى المحاولة مرة أخرى.",
    ),
    "profileUpdatedBody": MessageLookupByLibrary.simpleMessage(
      "تم تحديث معلومات ملفك الشخصي بنجاح.",
    ),
    "profileUpdatedSuccess": MessageLookupByLibrary.simpleMessage(
      "تم تحديث الملف الشخصي بنجاح!",
    ),
    "profileUpdatedTitle": MessageLookupByLibrary.simpleMessage(
      "تم تحديث الملف الشخصي",
    ),
    "purchaseAcceptedBody": m18,
    "purchaseAcceptedTitle": MessageLookupByLibrary.simpleMessage(
      "تم قبول طلب الشراء",
    ),
    "purchaseReceiptTitle": MessageLookupByLibrary.simpleMessage(
      "إيصال الشراء",
    ),
    "recentLoginRequired": MessageLookupByLibrary.simpleMessage(
      "لأسباب أمنية، يرجى تسجيل الدخول مرة أخرى قبل تغيير بريدك الإلكتروني.",
    ),
    "recentSearchesTitle": MessageLookupByLibrary.simpleMessage(
      "الأبحاث الأخيرة",
    ),
    "rejectRequestButton": MessageLookupByLibrary.simpleMessage("رفض الطلب"),
    "rentProfit": MessageLookupByLibrary.simpleMessage("أرباح الإيجار"),
    "rentalAcceptedBody": m19,
    "rentalAcceptedTitle": MessageLookupByLibrary.simpleMessage(
      "تم قبول طلب الإيجار",
    ),
    "rentalButton": MessageLookupByLibrary.simpleMessage("تأجير"),
    "rentalCompletedMessage": MessageLookupByLibrary.simpleMessage(
      "تم استلام طلب استئجار السيارة الخاص بك، وسنقوم بالرد عليك في أقرب وقت ممكن. يرجى متابعة الإشعارات للبقاء على اطلاع.",
    ),
    "rentalCompletedTitle": MessageLookupByLibrary.simpleMessage(
      "اكتمل طلب الإيجار",
    ),
    "rentalDuration": MessageLookupByLibrary.simpleMessage("مدة الإيجار"),
    "rentalFrom": MessageLookupByLibrary.simpleMessage("الإيجار من"),
    "rentalInformation": MessageLookupByLibrary.simpleMessage(
      "معلومات الإيجار:",
    ),
    "rentalReceiptTitle": MessageLookupByLibrary.simpleMessage("إيصال الإيجار"),
    "rentalRequestReceivedBody": m20,
    "rentalRequestReceivedTitle": MessageLookupByLibrary.simpleMessage(
      "تم استلام طلب الإيجار",
    ),
    "rentalTerms": MessageLookupByLibrary.simpleMessage("شروط الإيجار"),
    "rentalUntil": MessageLookupByLibrary.simpleMessage("الإيجار حتى"),
    "requestBy": m21,
    "requestByLabel": MessageLookupByLibrary.simpleMessage("طلب بواسطة: "),
    "requestDate": m22,
    "requestDateLabel": MessageLookupByLibrary.simpleMessage("تاريخ الطلب: "),
    "requestDeniedBody": m23,
    "requestDeniedTitle": MessageLookupByLibrary.simpleMessage(
      "نعتذر، تم رفض الطلب",
    ),
    "requestDetailsTitle": MessageLookupByLibrary.simpleMessage("تفاصيل الطلب"),
    "requestUpdateError": m24,
    "requestUpdatedSuccess": m25,
    "requests": MessageLookupByLibrary.simpleMessage("الطلبات"),
    "reset": MessageLookupByLibrary.simpleMessage("إعادة تعيين"),
    "resetEmailButton": MessageLookupByLibrary.simpleMessage(
      "إعادة تعيين البريد الإلكتروني",
    ),
    "resetPasswordButton": MessageLookupByLibrary.simpleMessage(
      "إعادة تعيين كلمة المرور",
    ),
    "resetYourPasswordTitle": MessageLookupByLibrary.simpleMessage(
      "إعادة تعيين كلمة المرور",
    ),
    "resultsFor": m26,
    "salesProfit": MessageLookupByLibrary.simpleMessage("أرباح المبيعات"),
    "saveChanges": MessageLookupByLibrary.simpleMessage("حفظ التغييرات"),
    "seats": MessageLookupByLibrary.simpleMessage("المقاعد"),
    "seatsCount": m27,
    "seeAll": MessageLookupByLibrary.simpleMessage("عرض الكل"),
    "selectAdPurposePrompt": MessageLookupByLibrary.simpleMessage(
      "يرجى اختيار الغرض من الإعلان",
    ),
    "selectAdTypePrompt": MessageLookupByLibrary.simpleMessage(
      "يرجى اختيار نوع الإعلان",
    ),
    "selectDateHint": MessageLookupByLibrary.simpleMessage("اختر التاريخ"),
    "selectImageFirstError": MessageLookupByLibrary.simpleMessage(
      "يرجى اختيار صورة أولاً",
    ),
    "selectLanguage": MessageLookupByLibrary.simpleMessage("اختر اللغة"),
    "selectLanguageComfortable": MessageLookupByLibrary.simpleMessage(
      "اختر اللغة التي تفضلها!",
    ),
    "selectMileageRange": MessageLookupByLibrary.simpleMessage(
      "اختر مدى المسافة المقطوعة:",
    ),
    "selectTimeHint": MessageLookupByLibrary.simpleMessage("اختر الوقت"),
    "selectVehicleImageError": MessageLookupByLibrary.simpleMessage(
      "يرجى تحديد صورة للمركبة",
    ),
    "selectYearRange": MessageLookupByLibrary.simpleMessage(
      "اختر مدى السنوات:",
    ),
    "seller": MessageLookupByLibrary.simpleMessage("بائع"),
    "send": MessageLookupByLibrary.simpleMessage("إرسال"),
    "sendOtpButton": MessageLookupByLibrary.simpleMessage("إرسال رمز التحقق"),
    "sessionExpired": MessageLookupByLibrary.simpleMessage(
      "لم يتم العثور على جلسة المستخدم. يرجى تسجيل الدخول مرة أخرى.",
    ),
    "setLocationButton": MessageLookupByLibrary.simpleMessage("تحديد الموقع"),
    "settingsTitle": MessageLookupByLibrary.simpleMessage("الإعدادات"),
    "shippingAddressLabel": MessageLookupByLibrary.simpleMessage("عنوان الشحن"),
    "shippingLabel": MessageLookupByLibrary.simpleMessage("الشحن"),
    "showroomAddressHint": MessageLookupByLibrary.simpleMessage("عنوان المعرض"),
    "showroomAds": m28,
    "showroomDefaultName": MessageLookupByLibrary.simpleMessage("معرض"),
    "showroomDetails": MessageLookupByLibrary.simpleMessage("تفاصيل المعرض"),
    "showroomRole": MessageLookupByLibrary.simpleMessage("معرض"),
    "showroomsJoin": MessageLookupByLibrary.simpleMessage(
      "انضم الآن كصالة عرض",
    ),
    "signUp": MessageLookupByLibrary.simpleMessage("انشاء حساب"),
    "signUpBody": MessageLookupByLibrary.simpleMessage(
      "أنشئ حسابك وكن جزءا من مجتمع CarAds",
    ),
    "signUpTitle": MessageLookupByLibrary.simpleMessage(
      "انضم إلى CarAds اليوم!",
    ),
    "skip": MessageLookupByLibrary.simpleMessage("تخطي"),
    "somethingWentWrong": MessageLookupByLibrary.simpleMessage("حدث خطأ ما"),
    "splashBody": MessageLookupByLibrary.simpleMessage(
      "بوابتك إلى صالات عرض السيارات ومكاتب التأجير",
    ),
    "splashTitle": MessageLookupByLibrary.simpleMessage(
      "مرحبًا بك في تطبيق CarAds",
    ),
    "startMileageHint": MessageLookupByLibrary.simpleMessage("بداية المسافة"),
    "startSearchHint": MessageLookupByLibrary.simpleMessage("ابدأ البحث ..."),
    "startYearHint": MessageLookupByLibrary.simpleMessage("سنة البداية"),
    "statusActive": MessageLookupByLibrary.simpleMessage("نشط"),
    "statusCanceled": MessageLookupByLibrary.simpleMessage("ملغي"),
    "statusConfirmed": MessageLookupByLibrary.simpleMessage("تم التأكيد"),
    "statusEnded": MessageLookupByLibrary.simpleMessage("منتهي"),
    "statusLabel": MessageLookupByLibrary.simpleMessage("الحالة:"),
    "statusPending": MessageLookupByLibrary.simpleMessage("قيد الانتظار"),
    "statusRejected": MessageLookupByLibrary.simpleMessage("مرفوض"),
    "suggestedAds": MessageLookupByLibrary.simpleMessage("إعلانات مقترحة"),
    "tankSize": MessageLookupByLibrary.simpleMessage("سعة الخزان"),
    "tapMapToSelectLocation": MessageLookupByLibrary.simpleMessage(
      "اضغط على الخريطة لاختيار الموقع.",
    ),
    "taxLabel": MessageLookupByLibrary.simpleMessage("الضريبة"),
    "termsConditionsTitle": MessageLookupByLibrary.simpleMessage(
      "الشروط والأحكام",
    ),
    "thousandSuffix": MessageLookupByLibrary.simpleMessage("ألف"),
    "tooManyAttempts": MessageLookupByLibrary.simpleMessage(
      "محاولات كثيرة جداً. يرجى المحاولة مرة أخرى لاحقاً أو إعادة تعيين كلمة المرور الخاصة بك.",
    ),
    "topRatedShowroom": MessageLookupByLibrary.simpleMessage(
      "المعارض الأعلى تقييماً",
    ),
    "totalPaymentLabel": MessageLookupByLibrary.simpleMessage("إجمالي الدفع"),
    "toyota": MessageLookupByLibrary.simpleMessage("تويوتا"),
    "unableToDetermineLocation": MessageLookupByLibrary.simpleMessage(
      "تعذر تحديد موقعك.",
    ),
    "unknown": MessageLookupByLibrary.simpleMessage("غير معروف"),
    "unknownCar": MessageLookupByLibrary.simpleMessage("سيارة غير معروفة"),
    "unknownLocation": MessageLookupByLibrary.simpleMessage("موقع غير معروف"),
    "unknownUser": MessageLookupByLibrary.simpleMessage("مستخدم غير معروف"),
    "updateEmailError": MessageLookupByLibrary.simpleMessage(
      "حدث خطأ أثناء تحديث بريدك الإلكتروني. يرجى المحاولة مرة أخرى.",
    ),
    "updateEmailLoginRequired": MessageLookupByLibrary.simpleMessage(
      "يجب تسجيل الدخول لتحديث البريد الإلكتروني.",
    ),
    "updateFailed": MessageLookupByLibrary.simpleMessage("فشل التحديث"),
    "updateProfileTitle": MessageLookupByLibrary.simpleMessage(
      "تحديث ملفك الشخصي",
    ),
    "uploadFailedError": MessageLookupByLibrary.simpleMessage(
      "فشل التحميل. يرجى المحاولة مرة أخرى.",
    ),
    "uploadFileLabel": MessageLookupByLibrary.simpleMessage("تحميل ملف"),
    "uploadImageError": MessageLookupByLibrary.simpleMessage(
      "فشل تحميل الصورة إلى الدرايف",
    ),
    "uploadLicenseImageLabel": MessageLookupByLibrary.simpleMessage(
      "تحميل صورة لرخصتك التجارية",
    ),
    "uploadNewPicture": MessageLookupByLibrary.simpleMessage(
      "تحميل صورة جديدة",
    ),
    "uploadPhotos": MessageLookupByLibrary.simpleMessage("تحميل الصور"),
    "uploadPhotosDescription": MessageLookupByLibrary.simpleMessage(
      "أضف صوراً عالية الجودة لعرض سيارتك",
    ),
    "urlLaunchError": MessageLookupByLibrary.simpleMessage(
      "تعذر فتح التطبيق. هل هو مثبت؟",
    ),
    "usedCondition": MessageLookupByLibrary.simpleMessage("مستعمل"),
    "usedEmail": MessageLookupByLibrary.simpleMessage(
      "الحساب موجود بالفعل لهذا البريد الإلكتروني.",
    ),
    "userJoin": MessageLookupByLibrary.simpleMessage("انضم الآن كمستخدم"),
    "userNotAuthenticated": MessageLookupByLibrary.simpleMessage(
      "المستخدم غير مسجل الدخول",
    ),
    "userNotLoggedIn": MessageLookupByLibrary.simpleMessage(
      "المستخدم غير مسجل الدخول.",
    ),
    "userPlaceholder": MessageLookupByLibrary.simpleMessage("مستخدم"),
    "userRole": MessageLookupByLibrary.simpleMessage("مستخدم"),
    "verification": MessageLookupByLibrary.simpleMessage("التحقق"),
    "verificationFailed": MessageLookupByLibrary.simpleMessage("فشل التحقق"),
    "verificationPrompt": MessageLookupByLibrary.simpleMessage(
      "لاستخدام خدماتنا ، نحتاج إلى التحقق من:",
    ),
    "verified": MessageLookupByLibrary.simpleMessage("تم التحقق"),
    "verify": MessageLookupByLibrary.simpleMessage("تحقق"),
    "verifyAndUpdate": MessageLookupByLibrary.simpleMessage("تحقق وتحديث"),
    "verifyCommercialLicenseDescription": MessageLookupByLibrary.simpleMessage(
      "لضمان أصالة عملك، يرجى التحقق من رخصتك التجارية.",
    ),
    "verifyCommercialLicenseTitle": MessageLookupByLibrary.simpleMessage(
      "تحقق من رخصتك التجارية",
    ),
    "verifyOtpTitle": MessageLookupByLibrary.simpleMessage("التحقق من الرمز"),
    "weakPassword": MessageLookupByLibrary.simpleMessage(
      "كلمة المرور المقدمة ضعيفة جدا.",
    ),
    "weeks": MessageLookupByLibrary.simpleMessage("أسابيع"),
    "welcomeBackTitle": MessageLookupByLibrary.simpleMessage("مرحباً بعودتك!"),
    "welcomeTitle": MessageLookupByLibrary.simpleMessage("مرحباً !"),
    "welcomeUser": m29,
    "wellDoneTitle": MessageLookupByLibrary.simpleMessage("أحسنت"),
    "year": MessageLookupByLibrary.simpleMessage("السنة"),
    "yearTitle": MessageLookupByLibrary.simpleMessage("السنة"),
    "yourLocationLabel": MessageLookupByLibrary.simpleMessage("موقعك"),
    "yourProfileTitle": MessageLookupByLibrary.simpleMessage("ملفك الشخصي"),
  };
}
