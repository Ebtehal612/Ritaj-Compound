// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appTitle => 'Ritaj Compound';

  @override
  String choose(String item) {
    return 'اختر $item';
  }

  @override
  String mustEnter(String item) {
    return 'يجب إدخال $item';
  }

  @override
  String get comparingPhoto => 'مقارنة الصورة';

  @override
  String get titlePrefixMrs => 'السيدة';

  @override
  String get date => 'التاريخ';

  @override
  String get password => 'كلمة المرور';

  @override
  String get nationalId => 'رقم الهوية';

  @override
  String get identityNumberValidation => 'رقم الهوية غير صحيح';

  @override
  String get email => 'البريد الإلكتروني';

  @override
  String get invalidEmail => 'بريد إلكتروني غير صحيح';

  @override
  String get otpValidation => 'رمز التحقق يجب أن يكون ٤ أرقام';

  @override
  String get passwordRequired => 'كلمة المرور مطلوبة';

  @override
  String get passwordsDoNotMatch => 'كلمات المرور غير متطابقة';

  @override
  String get explanation => 'شرح';

  @override
  String get homeworkSolution => 'حل الواجب';

  @override
  String get practice => 'تمرين';

  @override
  String get revision => 'مراجعة';

  @override
  String get other => 'أخرى';

  @override
  String get successfullyDownloaded => 'تم تحميل الملف بنجاح';

  @override
  String get downloading => 'جار التحميل...';

  @override
  String get invalidPhoneNumber => 'رقم الهاتف غير صحيح';

  @override
  String get within => 'خلال';

  @override
  String get workingNow => 'يعمل الآن';

  @override
  String get ended => 'انتهى';

  @override
  String nSeconds(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ثواني',
      one: 'ثانية واحدة',
    );
    return '$_temp0';
  }

  @override
  String nMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count دقائق',
      one: 'دقيقة واحدة',
    );
    return '$_temp0';
  }

  @override
  String nHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ساعات',
      one: 'ساعة واحدة',
    );
    return '$_temp0';
  }

  @override
  String nDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count أيام',
      one: 'يوم واحد',
    );
    return '$_temp0';
  }

  @override
  String nMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count أشهر',
      one: 'شهر واحد',
    );
    return '$_temp0';
  }

  @override
  String nYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count سنوات',
      one: 'سنة واحدة',
    );
    return '$_temp0';
  }

  @override
  String get serverError => 'خطأ في الخادم';

  @override
  String get badCertificate => 'شهادة غير صالحة';

  @override
  String get requestCancelled => 'تم إلغاء الطلب';

  @override
  String get connectionError => 'لا يوجد اتصال بالإنترنت';

  @override
  String get connectionTimeout => 'انتهت مهلة الاتصال';

  @override
  String get receiveTimeout => 'انتهت مهلة الاستقبال';

  @override
  String get sendTimeout => 'انتهت مهلة الإرسال';

  @override
  String get unknownError => 'خطأ غير معروف';

  @override
  String get welcome => 'مرحبا';

  @override
  String get loginTitle => 'تسجيل الدخول';

  @override
  String get welcomeBack => 'مرحباً بك';

  @override
  String get loginSubtitle =>
      'سجل دخولك للوصول إلى خدمات المجمع السكني والتحكم في تصاريح الدخول والخروج';

  @override
  String get phoneNumber => 'رقم الهاتف';

  @override
  String get weWillSendCode => 'سنرسل لك رمز التحقق';

  @override
  String get enterPhoneNumber => 'رقم الهاتف';

  @override
  String get sendVerificationCode => 'إرسال رمز التحقق';

  @override
  String get or => 'أو';

  @override
  String get signInWithEmail => 'تسجيل الدخول بالبريد الإلكتروني';

  @override
  String get needHelp => 'بحاجة للمساعدة؟';

  @override
  String get contactAdministration => 'اتصل بالادارة';

  @override
  String get whatsapp => 'واتساب';

  @override
  String get verificationCode => 'رمز التحقق';

  @override
  String get enterCode => 'أدخل الرمز';

  @override
  String get confirm => 'تأكيد';

  @override
  String get resend => 'إعادة إرسال';

  @override
  String helloUser(Object username) {
    return 'مرحبا $username';
  }

  @override
  String unitNumber(Object unit) {
    return 'وحدة $unit';
  }

  @override
  String get expectedVisitor => 'زائر متوقع';

  @override
  String get dueInstallment => 'قسط مستحق';

  @override
  String get day => 'اليوم';

  @override
  String get tuesday => 'الثلاثاء';

  @override
  String get october => 'أكتوبر';

  @override
  String get mohamedAli => 'محمد علي';

  @override
  String get services => 'خدمات';

  @override
  String get quickprocedures => 'الاجراءات السريعه';
}
