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
  String get quickprocedures => 'الإجراءات السريعة';

  @override
  String get inviteVisitor => 'دعوة زائر';

  @override
  String get deliveryPermit => 'تصريح توصيل';

  @override
  String get reportComplaint => 'بلاغ شكوى';

  @override
  String get payInstallment => 'دفع قسط';

  @override
  String get newsAndEvents => 'الأخبار والفعاليات';

  @override
  String get viewAll => 'عرض الكل';

  @override
  String get activity => 'فعالية';

  @override
  String get twoHoursAgo => 'منذ ساعتين';

  @override
  String get poolOpeningTitle => 'افتتاح المسبح الجديد';

  @override
  String get poolOpeningDesc =>
      'يسعدنا دعوتكم لحضور افتتاح المسبح الجديد يوم السبت القادم في تمام الساعة 10 صباحاً';

  @override
  String get shortcuts => 'اختصارات';

  @override
  String get unitMap => 'خريطة الوحدات والإصدارات';

  @override
  String get exploreUnits => 'استكشف الوحدات المتاحة';

  @override
  String get community => 'المجتمع';

  @override
  String get connectNeighbors => 'تواصل مع الجيران';

  @override
  String get orderMall => 'طلب من المول';

  @override
  String get orderStores => 'اطلب من المتاجر المجاورة';

  @override
  String get activeSubscriptions => 'الاشتراكات النشطة';

  @override
  String get gym => 'الجيم';

  @override
  String get monthlyPackage => 'باقة شهرية';

  @override
  String get active => 'نشط';

  @override
  String get cleaningService => 'خدمة التنظيف';

  @override
  String get weekly => 'أسبوعي';

  @override
  String expiresInDays(Object count) {
    return 'ينتهي في $count يوم';
  }

  @override
  String get nextSessionTomorrow => 'الجلسة القادمة: غداً';

  @override
  String get manage => 'إدارة';

  @override
  String get home => 'الرئيسية';

  @override
  String get permits => 'التصاريح';

  @override
  String get more => 'المزيد';

  @override
  String get visitormanagementanddelivery => 'إدارة الزوار والتوصيل';

  @override
  String get phonenumbernotregistered => 'رقم الهاتف غير مسجل';

  @override
  String get visitors => 'الزوار';

  @override
  String get delivery => 'التوصيل';

  @override
  String get history => 'السجل';

  @override
  String get createQuickPermit => 'إنشاء تصريح سريع';

  @override
  String get newVisitorPermit => 'تصريح زائر جديد';

  @override
  String get activePermits => 'التصاريح النشطة';

  @override
  String get previousVisitors => 'الزوار السابقون';

  @override
  String get tomorrow => 'غداً';

  @override
  String get scheduled => 'مجدول';

  @override
  String get inviteAgain => 'دعوة مرة أخرى';

  @override
  String get mainGate => 'البوابة الرئيسية';

  @override
  String get lastWeek => 'الأسبوع الماضي';

  @override
  String get yesterday => 'أمس';

  @override
  String get gate => 'البوابة';

  @override
  String get visitDate => 'تاريخ الزيارة';

  @override
  String get carNumber => 'رقم السيارة';

  @override
  String get extend => 'تمديد';

  @override
  String get cancel => 'إلغاء';

  @override
  String get edit => 'تعديل';

  @override
  String get share => 'مشاركة';

  @override
  String get qr => 'رمز QR';

  @override
  String get pm => 'م';
}
