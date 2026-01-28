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
  String unitLabel(Object unit) {
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
  String get services => 'الخدمات';

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
  String get poolOpeningTitle => 'احتفالية افتتاح المسبح الجديد';

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

  @override
  String get visittime => 'وقت الزيارة';

  @override
  String get entrancegate => 'بوابة الدخول';

  @override
  String get maingate => 'البوابة الرئيسيه';

  @override
  String get cancelthepermit => 'إلغاء التصريح';

  @override
  String get expire => 'ينتهي في 4 ساعات';

  @override
  String get contactneighbors => 'تواصل مع الجيران';

  @override
  String get groups => 'المجموعات';

  @override
  String get lost => 'مفقودات';

  @override
  String get writeyourposthere => 'اكتب منشورك هنا';

  @override
  String get pollQuestion =>
      'ما رأيكم في إقامة فعالية شواء جماعي في الحديقة المركزية؟';

  @override
  String get pollOption1 => 'فكرة ممتازة، أؤيد';

  @override
  String get pollOption2 => 'محتاج أفكر فيها';

  @override
  String get pollOption3 => 'لا أستطيع المشاركة';

  @override
  String pollVotes(Object count) {
    return '$count صوت';
  }

  @override
  String get pollEndsIn => 'ينتهي خلال يومين';

  @override
  String get vote => 'صوّت';

  @override
  String get maintenancePost =>
      'شكراً لفريق الصيانة على سرعة الاستجابة لإصلاح مشكلة المصعد! الخدمة ممتازة 👏';

  @override
  String get salePost =>
      'طاولة طعام خشبية بحالة ممتازة للبيع. 6 كراسي، السعر 3000 ج.م قابل للتفاوض.';

  @override
  String get forSale => 'للبيع';

  @override
  String get contactSeller => 'تواصل مع البائع';

  @override
  String get loadMorePosts => 'تحميل المزيد من المنشورات';

  @override
  String get whatareyoulookingfor => 'ما الذي تبحث عنه؟';

  @override
  String get sarahAhmed => 'سارة أحمد';

  @override
  String get ahmedHassan => 'أحمد حسن';

  @override
  String get fatimaMohamed => 'فاطمة محمد';

  @override
  String get fourHoursAgo => 'منذ 4 ساعات';

  @override
  String get sixHoursAgo => 'منذ 6 ساعات';

  @override
  String get aDayAgo => 'منذ يوم';

  @override
  String get now => 'الآن';

  @override
  String get you => 'أنت';

  @override
  String get lostPost =>
      'هل رأى أحد قطتي الصغيرة؟ اسمها لولو، لونها رمادي مع بقع بيضاء. اختفت منذ أمس من البلكونة.';

  @override
  String get newDeliveryPermit => 'تصريح توصيل جديد';

  @override
  String get activeDeliveries => 'التوصيلات النشطة';

  @override
  String get previousDeliveries => 'التوصيلات السابقة';

  @override
  String get expectedArrival => 'الوصول المتوقع';

  @override
  String get within15Min => 'خلال 15 دقيقة';

  @override
  String get within30Min => 'خلال 30 دقيقة';

  @override
  String get talonOrder => 'طلبية تالون';

  @override
  String get amazon => 'امازون';

  @override
  String get noonOrder => 'طلبية نون';

  @override
  String get kosharyGeha => 'كشري جحا';

  @override
  String enteredYesterday(Object time) {
    return 'دخلت أمس $time';
  }

  @override
  String get enteredLastWeek => 'دخلت الأسبوع الماضي';

  @override
  String get complaintsAndReports => 'الشكاوى والمقترحات';

  @override
  String get reportingProblem => 'الابلاغ عن مشكلة';

  @override
  String get financialoutlook => 'النظرة المالية';

  @override
  String get installmentsAndPayment => 'الاقساط والدفع';

  @override
  String get availableUnits => 'الوحدات المتاحة';

  @override
  String get unitsStore => 'متجر الوحدات';

  @override
  String get mallOrdering => 'طلب من المول';

  @override
  String get nearbyMall => 'المول المجاور';

  @override
  String get searchForProducts => 'ابحث عن المنتجات...';

  @override
  String get grocery => 'بقالة';

  @override
  String get pharmacy => 'صيدلية';

  @override
  String get restaurants => 'مطاعم';

  @override
  String get electronics => 'إلكترونيات';

  @override
  String get featuredOffers => 'العروض المميزة';

  @override
  String get discount20 => 'خصم 20 %';

  @override
  String get onAllGrocery => 'على جميع منتجات البقالة';

  @override
  String get endsIn3Days => 'ينتهي خلال 3 أيام';

  @override
  String get availableStores => 'المتاجر المتاحة';

  @override
  String get goodMarket => 'سوبر ماركت الخير';

  @override
  String get freeDelivery => 'توصيل مجاني للطلبات + 100 ج.م';

  @override
  String get shopNow => 'تسوق الآن';

  @override
  String get alNaharPharmacy => 'صيدلية النهار';

  @override
  String get medsAndPrescriptions => 'أدوية بوصفة وبدون وصفة';

  @override
  String get alAsalaRestaurant => 'مطعم الأصالة';

  @override
  String get easternWesternFood => 'مأكولات شرقية وغربية';

  @override
  String get orderNow => 'اطلب الآن';

  @override
  String get busy => 'مشغول';

  @override
  String get techStore => 'متجر التقنية';

  @override
  String get opensTomorrow => 'يفتح في 8:00 ص غداً';

  @override
  String get closed => 'مغلق';

  @override
  String get open => 'مفتوح';

  @override
  String get inProgress => 'قيد المعالجة';

  @override
  String get completed => 'مكتملة';

  @override
  String get createNewComplaint => 'إنشاء شكوى جديدة';

  @override
  String get all => 'الكل';

  @override
  String get electricityOutage => 'انقطاع الكهرباء المتكرر';

  @override
  String get electricityOutageDesc =>
      'انقطاع مستمر في التيار الكهربائي في الطابق الرابع منذ أمس';

  @override
  String get facilities => 'مرافق';

  @override
  String get sinceTwoDays => 'منذ يومين';

  @override
  String get buildingA => 'مبنى A';

  @override
  String get viewDetails => 'عرض التفاصيل';

  @override
  String get lateNoise => 'ضوضاء في ساعات متأخرة';

  @override
  String get lateNoiseDesc => 'إزعاج من الوحدة المجاورة بعد منتصف الليل';

  @override
  String get security => 'أمن';

  @override
  String get since3Days => 'منذ 3 أيام';

  @override
  String get latestUpdateSecurity => 'آخر تحديث من فريق الأمن';

  @override
  String get contactedOwner =>
      'تم التواصل مع المالك وسيتم حل المشكلة خلال 24 ساعة';

  @override
  String get since2Hours => 'منذ ساعتين';

  @override
  String get cleanHallways => 'تنظيف الممرات';

  @override
  String get cleanHallwaysDesc => 'طلب تنظيف إضافي للممرات في المبنى';

  @override
  String get cleanliness => 'نظافة';

  @override
  String get sinceWeek => 'منذ أسبوع';

  @override
  String get solvedSuccessfully => 'تم الحل بنجاح';

  @override
  String get excellentRate => 'تقييم ممتاز';

  @override
  String get fastService => 'خدمة سريعة ومميزة، شكراً للفريق';

  @override
  String get solvedInTwoDays => 'تم الحل في يومين';

  @override
  String attachments(Object count) {
    return '$count مرفقات';
  }

  @override
  String comments(Object count) {
    return '$count تعليقات';
  }

  @override
  String get minutes => 'دقيقة';

  @override
  String get medicalServices => 'الخدمات الطبية';

  @override
  String get clinicAndPharmacy => 'عيادات وصيدليات';

  @override
  String get technicalSupport => 'الدعم الفني';

  @override
  String get maintenanceRequest => 'طلب صيانة';

  @override
  String get overviewOfInstallments => 'نظرة على الأقساط';

  @override
  String get paid => 'مدفوعة';

  @override
  String get pending => 'معلقة';

  @override
  String needsPayment(Object count) {
    return '$count تحتاج دفع';
  }

  @override
  String fromTotalInstallments(Object count) {
    return 'من أصل $count قسط';
  }

  @override
  String get servicesInstallment => 'قسط الخدمات';

  @override
  String get dueToday => 'مستحق اليوم';

  @override
  String get payNow => 'ادفع الآن';

  @override
  String get maintenanceInstallment => 'قسط الصيانة';

  @override
  String lateDays(Object count) {
    return 'متأخر $count أيام';
  }

  @override
  String get payImmediately => 'ادفع فوراً';

  @override
  String lateFees(Object amount) {
    return '+ $amount ج.م رسوم تأخير';
  }

  @override
  String get paymentMethods => 'طرق الدفع';

  @override
  String get addCard => 'إضافة بطاقة';

  @override
  String get virtualCard => 'بطاقة افتراضية';

  @override
  String get paymentFromWallet => 'الدفع من المحفظة';

  @override
  String get recentTransactions => 'المعاملات الأخيرة';

  @override
  String get gymSubscription => 'اشتراك الجيم';

  @override
  String get mallOrder => 'طلب من المول';

  @override
  String get electricityBill => 'فاتورة الكهرباء';

  @override
  String get due => 'مستحق';

  @override
  String get late => 'متأخر';

  @override
  String get defaultLabel => 'افتراضي';

  @override
  String yesterdayAt(Object time) {
    return 'أمس، $time';
  }

  @override
  String daysAgo(Object count) {
    return 'منذ $count أيام';
  }

  @override
  String get egp => 'ج.م';

  @override
  String get paymentDetail => 'عرض التفاصيل';

  @override
  String unitsFound(Object count) {
    return 'تم العثور على $count وحدة';
  }

  @override
  String get sortByPrice => 'ترتيب حسب السعر';

  @override
  String unit(Object name) {
    return 'وحدة $name';
  }

  @override
  String tower(Object name) {
    return 'البرج $name';
  }

  @override
  String floor(Object name) {
    return 'الدور $name';
  }

  @override
  String rooms(Object count) {
    return '$count غرف';
  }

  @override
  String bathrooms(Object count) {
    return '$count حمام';
  }

  @override
  String area(Object size) {
    return '$size م²';
  }

  @override
  String pricePerMeter(Object amount) {
    return 'للمتر $amount ج.م';
  }

  @override
  String get gardenView => 'إطلالة على الحديقة';

  @override
  String get balcony => 'بلكونة';

  @override
  String get corner => 'ركنية';

  @override
  String get bookNow => 'احجز الآن';

  @override
  String get waitingList => 'قائمة الانتظار';

  @override
  String reservedUntil(Object date) {
    return 'محجوزة حتى $date';
  }

  @override
  String get unitNotAvailable => 'هذه الوحدة غير متاحة';

  @override
  String get joinWaitingList => 'انضم لقائمة الانتظار';

  @override
  String get viewMoreUnits => 'عرض المزيد من الوحدات';

  @override
  String get featured => 'مميزة';

  @override
  String get reserved => 'محجوزة';

  @override
  String get sold => 'مباعة';

  @override
  String get doctors => 'أطباء';

  @override
  String get clinics => 'عيادات';

  @override
  String get lab => 'معامل طبية';

  @override
  String get pharmacies => 'صيدليات';

  @override
  String get medicalCenters => 'مراكز طبية';

  @override
  String get searchMedical => 'ابحث عن طبيب أو خدمة..';

  @override
  String get topDoctors => 'الأطباء الأعلى تقييماً';

  @override
  String get bookSelection => 'حجز موعد';

  @override
  String get specialtyCardio => 'اخصائي قلب';

  @override
  String get specialtyDento => 'اخصائي أسنان';

  @override
  String get specialtyNeuro => 'اخصائي أعصاب';

  @override
  String get specialtyPediatrics => 'اخصائي أطفال';

  @override
  String distance(Object amount) {
    return 'على بعد $amount كم';
  }

  @override
  String rating(Object count, Object score) {
    return '$score ($count تقييم)';
  }

  @override
  String get electrician => 'فني كهرباء';

  @override
  String get plumber => 'سباك';

  @override
  String get carpenter => 'نجار';

  @override
  String get acTechnician => 'فني تكييف';

  @override
  String get painter => 'نقاش';

  @override
  String get specialist => 'فني متخصص';

  @override
  String get bookService => 'حجز خدمة';

  @override
  String get technicalSupportDesc => 'صيانة وإصلاحات';

  @override
  String get profile => 'الملف الشخصي';

  @override
  String get personalInfo => 'المعلومات الشخصية';

  @override
  String get unitDetails => 'تفاصيل الوحدة';

  @override
  String get familyMembers => 'أفراد الأسرة';

  @override
  String get vehicles => 'المركبات';

  @override
  String get ownedApartments => 'الشقق المملوكة';

  @override
  String get issues => 'المشاكل';

  @override
  String get serviceRequests => 'طلبات الخدمة';

  @override
  String get unitOwner => 'مالك الوحدة';

  @override
  String get emailAddress => 'البريد الإلكتروني';

  @override
  String get nationalIdNumber => 'الرقم القومي';

  @override
  String get birthDate => 'تاريخ الميلاد';

  @override
  String get unitNumber => 'رقم الوحدة';

  @override
  String get floorNumber => 'الدور';

  @override
  String get unitArea => 'المساحة';

  @override
  String get location => 'المنطقة';

  @override
  String get handoverDate => 'تاريخ الاستلام';

  @override
  String get fourthFloor => 'الدور الرابع';

  @override
  String get squareMeters => 'متر مربع';

  @override
  String get riyadh => 'الرياض';

  @override
  String get wife => 'الزوجة';

  @override
  String get son => 'الابن';

  @override
  String get years => 'سنة';

  @override
  String get toyota => 'تويوتا كامري 2020';

  @override
  String get motorcycle => 'دراجة أبو هندا';

  @override
  String get rentalsAndGuests => 'التأجير والضيوف';

  @override
  String get rentalStatus => 'حالة الإيجار';

  @override
  String get startDate => 'تاريخ البداية';

  @override
  String get endDate => 'تاريخ الانتهاء';

  @override
  String get rentPeriod => 'المدة الإيجارية';

  @override
  String get contractExpiry => 'انتهاء العقد';

  @override
  String get contractDetails => 'عرض التفاصيل';

  @override
  String get tenantInfo => 'معلومات المستأجر';

  @override
  String get mainTenant => 'المستأجر الرئيسي';

  @override
  String get ownerData => 'بيانات المالك';

  @override
  String get khaledAhmedAli => 'خالد أحمد السيد';

  @override
  String get unitOwnerTitle => 'مالك الوحدة';

  @override
  String get contractNumber => 'رقم العقد';

  @override
  String get nationalIdShort => 'رقم قومي';

  @override
  String get contactOwner => 'تواصل مع المالك';

  @override
  String get language => 'اللغة';

  @override
  String get logout => 'تسجيل الخروج';

  @override
  String get changeLanguage => 'تغيير اللغة';

  @override
  String get selectLanguage => 'اختر اللغة';

  @override
  String get arabic => 'العربية';

  @override
  String get english => 'الإنجليزية';

  @override
  String get logoutConfirmation => 'تأكيد تسجيل الخروج';

  @override
  String get logoutMessage => 'هل أنت متأكد من أنك تريد تسجيل الخروج؟';

  @override
  String get yes => 'نعم';

  @override
  String get no => 'لا';

  @override
  String get ahmadMohammadAli => 'أحمد محمد علي';

  @override
  String get fatimaAhmadAli => 'فاطمة أحمد علي';

  @override
  String get mohammadAhmadAli => 'محمد أحمد علي';

  @override
  String get mainTenantTitle => 'المستأجر الرئيسي';

  @override
  String get nationalIdLabel => 'رقم قومي';

  @override
  String get call => 'اتصال';

  @override
  String get contractExpiryMessage =>
      'سينتهي عقد الإيجار خلال 3 أشهر. تواصل مع المالك لتجديد العقد.';

  @override
  String get january => 'يناير';

  @override
  String get march => 'مارس';

  @override
  String get january15 => '15 يناير 1990';

  @override
  String get march15 => '15 مارس 2022';

  @override
  String get january15_2024 => '15 يناير 2024';

  @override
  String get january14_2025 => '14 يناير 2025';

  @override
  String get threeMonthsTwoWeeks => '3 أشهر و 2 أسابيع';

  @override
  String get phoneNumberValue => '+20 100 123 4567';

  @override
  String get emailValue => 'ahmed.ali@email.com';

  @override
  String get nationalIdValue => '29012345678901';

  @override
  String get unitValue => 'A-402';

  @override
  String get areaValue => '120 متر مربع';

  @override
  String get sonAge => 'الابن - 16 سنة';

  @override
  String get toyotaCamry => 'تويوتا كامري 2020';

  @override
  String get hondaMotorcycle => 'دراجة أبو هندا';

  @override
  String get plateNumber1 => 'أ ب ج 123';

  @override
  String get plateNumber2 => 'د ه و 456';

  @override
  String get inactive => 'غير نشط';

  @override
  String get contractIdValue => 'CMT-2024-001';

  @override
  String get importantAnnouncement => 'إعلان هام';

  @override
  String get compoundRulesMessage =>
      'يرجى الالتزام بقوانين المجمع ومراجعة المواعيد المحددة للفعاليات.';

  @override
  String get event => 'فعالية';

  @override
  String get saturday19October => 'السبت 19 أكتوبر';

  @override
  String get tenAM => '10:00 ص';

  @override
  String get poolOpeningDescription =>
      'انضموا إلينا في افتتاح المسبح الجديد مع أنشطة ترفيهية، فقرات خاصة، ومفاجآت لجميع أفراد الأسرة.';

  @override
  String get willAttend => 'سأحضر';

  @override
  String get wontAttend => 'لن أحضر';

  @override
  String get free => 'مجاني';

  @override
  String get childrenFunDay => 'يوم ترفيهي للأطفال';

  @override
  String get friday25October => 'الجمعة 25 أكتوبر';

  @override
  String get fourPM => '4:00 م';

  @override
  String get childrenFunDescription =>
      'فعالية ترفيهية مخصصة للأطفال تشمل ألعاب جماعية، مسابقات، وأنشطة مناسبة للأعمار من 5 إلى 12 سنة.';

  @override
  String get registerChildNow => 'سجل طفلك الآن';

  @override
  String get announcement => 'إعلان';

  @override
  String get threeHoursAgo => 'منذ 3 ساعات';

  @override
  String get elevatorMaintenanceTitle => 'صيانة دورية للمصاعد - المبنى A';

  @override
  String get elevatorMaintenanceDescription =>
      'نعلمكم بأنه سيتم إجراء صيانة دورية لجميع المصاعد في المبنى A يوم الخميس 17 أكتوبر من الساعة 9:00 صباحًا حتى 12:00 ظهرًا. نعتذر مسبقًا عن أي إزعاج.';

  @override
  String get readMore => 'اقرأ المزيد';

  @override
  String get subscriptionManagement => 'إدارة الاشتراكات';

  @override
  String get monthlyCost => 'التكلفة الشهرية';

  @override
  String get thisMonthSavings => 'توفير هذا الشهر';

  @override
  String get bookSession => 'حجز جلسة';

  @override
  String get newSubscription => 'اشتراك جديد';

  @override
  String get manageAll => 'إدارة الكل';

  @override
  String get fitnessClub => 'نادي اللياقة البدنية';

  @override
  String get monthlyPackageOpen => 'باقة شهرية - مفتوحة';

  @override
  String get expiresIn15Days => 'ينتهي في 15 يوم';

  @override
  String get houseCleaning => 'خدمة التنظيف المنزلي';

  @override
  String get weeklyThreeHours => 'أسبوعي - 3 ساعات';

  @override
  String get tomorrowTenAM => 'غداً - 10:00 ص';

  @override
  String get availableServices => 'الخدمات المتاحة';

  @override
  String get pool => 'المسبح';

  @override
  String get poolAndSauna => 'حمام سباحة وساونا';

  @override
  String get save600 => 'وفر 600';

  @override
  String get modernEquipmentTrainers => 'أجهزة حديثة ومدربين';

  @override
  String get mostPopular => 'الأكثر شيوعًا';

  @override
  String get monthly => 'شهري';

  @override
  String get yearly => 'سنوي';

  @override
  String get openAccess => 'دخول مفتوح';

  @override
  String get saunaUse => 'استخدام الساونا';

  @override
  String get personalLockers => 'خزائن شخصية';

  @override
  String get subscribeNow => 'اشترك الآن';

  @override
  String get createInvitation => 'إنشاء دعوة';

  @override
  String get entityData => 'بيانات الجهة';

  @override
  String get entityName => 'اسم الجهة';

  @override
  String get enterName => 'أدخل الاسم';

  @override
  String get phoneNumberOptional => 'رقم الهاتف - اختياري';

  @override
  String get details => 'تفاصيل';

  @override
  String get expectedArrivalWithin => 'الوصول المتوقع خلال';

  @override
  String get selectGate => 'اختر البوابة';

  @override
  String get gate2 => 'بوابة 2';

  @override
  String get gate3 => 'بوابة 3';

  @override
  String get additionalNotes => 'ملاحظات إضافية';

  @override
  String get visitSpecialNotes => 'أي ملاحظات خاصة بالزيارة';

  @override
  String get createInvitationButton => 'إنشاء الدعوة';

  @override
  String get pleaseEnterEntityName => 'من فضلك أدخل اسم الجهة';

  @override
  String get pleaseEnterValidPhone => 'من فضلك أدخل رقم هاتف صحيح';

  @override
  String get pleaseSelectArrivalTime => 'من فضلك اختر وقت الوصول المتوقع';

  @override
  String get pleaseSelectValidDate => 'من فضلك اختر تاريخ';

  @override
  String get fifteenMinutes => '15 دقيقة';

  @override
  String get thirtyMinutes => '30 دقيقة';

  @override
  String get fortyFiveMinutes => '45 دقيقة';

  @override
  String get sixtyMinutes => '60 دقيقة';

  @override
  String get visitorData => 'بيانات الزائر';

  @override
  String get visitorName => 'اسم الزائر';

  @override
  String get visitDetails => 'تفاصيل الزيارة';

  @override
  String get time => 'الوقت';

  @override
  String get visitOptions => 'خيارات الزيارة';

  @override
  String get multipleEntry => 'دخول متعدد';

  @override
  String get multipleEntryDescription => 'السماح بالدخول والخروج عدة مرات';

  @override
  String get longTermVisit => 'زيارة طويلة المدى';

  @override
  String get longTermVisitDescription => 'صالحة لعدة ايام';

  @override
  String get pleaseEnterVisitorName => 'من فضلك أدخل اسم الزائر';

  @override
  String get pleaseEnterPhoneNumber => 'من فضلك أدخل رقم الهاتف';

  @override
  String get pleaseSelectTime => 'من فضلك اختر الوقت';
}
