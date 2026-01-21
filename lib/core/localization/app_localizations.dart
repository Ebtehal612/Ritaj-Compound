import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'localization/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
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
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

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
    Locale('en')
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Ritaj Compound'**
  String get appTitle;

  /// No description provided for @choose.
  ///
  /// In en, this message translates to:
  /// **'Choose {item}'**
  String choose(String item);

  /// No description provided for @mustEnter.
  ///
  /// In en, this message translates to:
  /// **'You must enter {item}'**
  String mustEnter(String item);

  /// No description provided for @comparingPhoto.
  ///
  /// In en, this message translates to:
  /// **'Comparing Photo'**
  String get comparingPhoto;

  /// No description provided for @titlePrefixMrs.
  ///
  /// In en, this message translates to:
  /// **'Mrs.'**
  String get titlePrefixMrs;

  /// No description provided for @date.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get date;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @nationalId.
  ///
  /// In en, this message translates to:
  /// **'National ID'**
  String get nationalId;

  /// No description provided for @identityNumberValidation.
  ///
  /// In en, this message translates to:
  /// **'Invalid National ID'**
  String get identityNumberValidation;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @invalidEmail.
  ///
  /// In en, this message translates to:
  /// **'Invalid Email'**
  String get invalidEmail;

  /// No description provided for @otpValidation.
  ///
  /// In en, this message translates to:
  /// **'OTP must be 4 digits'**
  String get otpValidation;

  /// No description provided for @passwordRequired.
  ///
  /// In en, this message translates to:
  /// **'Password is required'**
  String get passwordRequired;

  /// No description provided for @passwordsDoNotMatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get passwordsDoNotMatch;

  /// No description provided for @explanation.
  ///
  /// In en, this message translates to:
  /// **'Explanation'**
  String get explanation;

  /// No description provided for @homeworkSolution.
  ///
  /// In en, this message translates to:
  /// **'Homework Solution'**
  String get homeworkSolution;

  /// No description provided for @practice.
  ///
  /// In en, this message translates to:
  /// **'Practice'**
  String get practice;

  /// No description provided for @revision.
  ///
  /// In en, this message translates to:
  /// **'Revision'**
  String get revision;

  /// No description provided for @other.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get other;

  /// No description provided for @successfullyDownloaded.
  ///
  /// In en, this message translates to:
  /// **'File downloaded successfully'**
  String get successfullyDownloaded;

  /// No description provided for @downloading.
  ///
  /// In en, this message translates to:
  /// **'Downloading...'**
  String get downloading;

  /// No description provided for @invalidPhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Invalid Phone Number'**
  String get invalidPhoneNumber;

  /// No description provided for @within.
  ///
  /// In en, this message translates to:
  /// **'Within'**
  String get within;

  /// No description provided for @workingNow.
  ///
  /// In en, this message translates to:
  /// **'Working now'**
  String get workingNow;

  /// No description provided for @ended.
  ///
  /// In en, this message translates to:
  /// **'Ended'**
  String get ended;

  /// No description provided for @nSeconds.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 second} other{{count} seconds}}'**
  String nSeconds(int count);

  /// No description provided for @nMinutes.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 minute} other{{count} minutes}}'**
  String nMinutes(int count);

  /// No description provided for @nHours.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 hour} other{{count} hours}}'**
  String nHours(int count);

  /// No description provided for @nDays.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 day} other{{count} days}}'**
  String nDays(int count);

  /// No description provided for @nMonths.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 month} other{{count} months}}'**
  String nMonths(int count);

  /// No description provided for @nYears.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 year} other{{count} years}}'**
  String nYears(int count);

  /// No description provided for @serverError.
  ///
  /// In en, this message translates to:
  /// **'Server Error'**
  String get serverError;

  /// No description provided for @badCertificate.
  ///
  /// In en, this message translates to:
  /// **'Bad Certificate'**
  String get badCertificate;

  /// No description provided for @requestCancelled.
  ///
  /// In en, this message translates to:
  /// **'Request Cancelled'**
  String get requestCancelled;

  /// No description provided for @connectionError.
  ///
  /// In en, this message translates to:
  /// **'No Internet Connection'**
  String get connectionError;

  /// No description provided for @connectionTimeout.
  ///
  /// In en, this message translates to:
  /// **'Connection Timeout'**
  String get connectionTimeout;

  /// No description provided for @receiveTimeout.
  ///
  /// In en, this message translates to:
  /// **'Receive Timeout'**
  String get receiveTimeout;

  /// No description provided for @sendTimeout.
  ///
  /// In en, this message translates to:
  /// **'Send Timeout'**
  String get sendTimeout;

  /// No description provided for @unknownError.
  ///
  /// In en, this message translates to:
  /// **'Unknown Error'**
  String get unknownError;

  /// No description provided for @welcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome'**
  String get welcome;

  /// No description provided for @loginTitle.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get loginTitle;

  /// No description provided for @welcomeBack.
  ///
  /// In en, this message translates to:
  /// **'Welcome Back'**
  String get welcomeBack;

  /// No description provided for @loginSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Log in to access compound services and manage entry/exit permits'**
  String get loginSubtitle;

  /// No description provided for @phoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phoneNumber;

  /// No description provided for @weWillSendCode.
  ///
  /// In en, this message translates to:
  /// **'We will send you a verification code'**
  String get weWillSendCode;

  /// No description provided for @enterPhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get enterPhoneNumber;

  /// No description provided for @sendVerificationCode.
  ///
  /// In en, this message translates to:
  /// **'Send Verification Code'**
  String get sendVerificationCode;

  /// No description provided for @or.
  ///
  /// In en, this message translates to:
  /// **'Or'**
  String get or;

  /// No description provided for @signInWithEmail.
  ///
  /// In en, this message translates to:
  /// **'Sign in with Email'**
  String get signInWithEmail;

  /// No description provided for @needHelp.
  ///
  /// In en, this message translates to:
  /// **'Need Help?'**
  String get needHelp;

  /// No description provided for @contactAdministration.
  ///
  /// In en, this message translates to:
  /// **'Contact Administration'**
  String get contactAdministration;

  /// No description provided for @whatsapp.
  ///
  /// In en, this message translates to:
  /// **'WhatsApp'**
  String get whatsapp;

  /// No description provided for @verificationCode.
  ///
  /// In en, this message translates to:
  /// **'Verification Code'**
  String get verificationCode;

  /// No description provided for @enterCode.
  ///
  /// In en, this message translates to:
  /// **'Enter Code'**
  String get enterCode;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @resend.
  ///
  /// In en, this message translates to:
  /// **'Resend'**
  String get resend;

  /// No description provided for @helloUser.
  ///
  /// In en, this message translates to:
  /// **'Hello {username}'**
  String helloUser(Object username);

  /// No description provided for @unitNumber.
  ///
  /// In en, this message translates to:
  /// **'Unit {unit}'**
  String unitNumber(Object unit);

  /// No description provided for @expectedVisitor.
  ///
  /// In en, this message translates to:
  /// **'Expected Visitor'**
  String get expectedVisitor;

  /// No description provided for @dueInstallment.
  ///
  /// In en, this message translates to:
  /// **'Due Installment'**
  String get dueInstallment;

  /// No description provided for @day.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get day;

  /// No description provided for @tuesday.
  ///
  /// In en, this message translates to:
  /// **'Tuesday'**
  String get tuesday;

  /// No description provided for @october.
  ///
  /// In en, this message translates to:
  /// **'October'**
  String get october;

  /// No description provided for @mohamedAli.
  ///
  /// In en, this message translates to:
  /// **'Mohamed Ali'**
  String get mohamedAli;

  /// No description provided for @services.
  ///
  /// In en, this message translates to:
  /// **'Services'**
  String get services;

  /// No description provided for @quickprocedures.
  ///
  /// In en, this message translates to:
  /// **'Quick Procedures'**
  String get quickprocedures;

  /// No description provided for @inviteVisitor.
  ///
  /// In en, this message translates to:
  /// **'Invite Visitor'**
  String get inviteVisitor;

  /// No description provided for @deliveryPermit.
  ///
  /// In en, this message translates to:
  /// **'Delivery Permit'**
  String get deliveryPermit;

  /// No description provided for @reportComplaint.
  ///
  /// In en, this message translates to:
  /// **'Report Complaint'**
  String get reportComplaint;

  /// No description provided for @payInstallment.
  ///
  /// In en, this message translates to:
  /// **'Pay Installment'**
  String get payInstallment;

  /// No description provided for @newsAndEvents.
  ///
  /// In en, this message translates to:
  /// **'News & Events'**
  String get newsAndEvents;

  /// No description provided for @viewAll.
  ///
  /// In en, this message translates to:
  /// **'View All'**
  String get viewAll;

  /// No description provided for @activity.
  ///
  /// In en, this message translates to:
  /// **'Activity'**
  String get activity;

  /// No description provided for @twoHoursAgo.
  ///
  /// In en, this message translates to:
  /// **'2 hours ago'**
  String get twoHoursAgo;

  /// No description provided for @poolOpeningTitle.
  ///
  /// In en, this message translates to:
  /// **'New Pool Opening'**
  String get poolOpeningTitle;

  /// No description provided for @poolOpeningDesc.
  ///
  /// In en, this message translates to:
  /// **'We are happy to invite you to the new pool opening next Saturday at 10 AM'**
  String get poolOpeningDesc;

  /// No description provided for @shortcuts.
  ///
  /// In en, this message translates to:
  /// **'Shortcuts'**
  String get shortcuts;

  /// No description provided for @unitMap.
  ///
  /// In en, this message translates to:
  /// **'Unit Map & Releases'**
  String get unitMap;

  /// No description provided for @exploreUnits.
  ///
  /// In en, this message translates to:
  /// **'Explore available units'**
  String get exploreUnits;

  /// No description provided for @community.
  ///
  /// In en, this message translates to:
  /// **'Community'**
  String get community;

  /// No description provided for @connectNeighbors.
  ///
  /// In en, this message translates to:
  /// **'Connect with neighbors'**
  String get connectNeighbors;

  /// No description provided for @orderMall.
  ///
  /// In en, this message translates to:
  /// **'Order from Mall'**
  String get orderMall;

  /// No description provided for @orderStores.
  ///
  /// In en, this message translates to:
  /// **'Order from nearby stores'**
  String get orderStores;

  /// No description provided for @activeSubscriptions.
  ///
  /// In en, this message translates to:
  /// **'Active Subscriptions'**
  String get activeSubscriptions;

  /// No description provided for @gym.
  ///
  /// In en, this message translates to:
  /// **'Gym'**
  String get gym;

  /// No description provided for @monthlyPackage.
  ///
  /// In en, this message translates to:
  /// **'Monthly Package'**
  String get monthlyPackage;

  /// No description provided for @active.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get active;

  /// No description provided for @cleaningService.
  ///
  /// In en, this message translates to:
  /// **'Cleaning Service'**
  String get cleaningService;

  /// No description provided for @weekly.
  ///
  /// In en, this message translates to:
  /// **'Weekly'**
  String get weekly;

  /// No description provided for @expiresInDays.
  ///
  /// In en, this message translates to:
  /// **'Expires in {count} days'**
  String expiresInDays(Object count);

  /// No description provided for @nextSessionTomorrow.
  ///
  /// In en, this message translates to:
  /// **'Next session: Tomorrow'**
  String get nextSessionTomorrow;

  /// No description provided for @manage.
  ///
  /// In en, this message translates to:
  /// **'Manage'**
  String get manage;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @permits.
  ///
  /// In en, this message translates to:
  /// **'Permits'**
  String get permits;

  /// No description provided for @more.
  ///
  /// In en, this message translates to:
  /// **'More'**
  String get more;

  /// No description provided for @visitormanagementanddelivery.
  ///
  /// In en, this message translates to:
  /// **'Visitor Management and Delivery'**
  String get visitormanagementanddelivery;

  /// No description provided for @phonenumbernotregistered.
  ///
  /// In en, this message translates to:
  /// **'Phone number not registered'**
  String get phonenumbernotregistered;

  /// No description provided for @visitors.
  ///
  /// In en, this message translates to:
  /// **'Visitors'**
  String get visitors;

  /// No description provided for @delivery.
  ///
  /// In en, this message translates to:
  /// **'Delivery'**
  String get delivery;

  /// No description provided for @history.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get history;

  /// No description provided for @createQuickPermit.
  ///
  /// In en, this message translates to:
  /// **'Create Quick Permit'**
  String get createQuickPermit;

  /// No description provided for @newVisitorPermit.
  ///
  /// In en, this message translates to:
  /// **'New Visitor Permit'**
  String get newVisitorPermit;

  /// No description provided for @activePermits.
  ///
  /// In en, this message translates to:
  /// **'Active Permits'**
  String get activePermits;

  /// No description provided for @previousVisitors.
  ///
  /// In en, this message translates to:
  /// **'Previous Visitors'**
  String get previousVisitors;

  /// No description provided for @tomorrow.
  ///
  /// In en, this message translates to:
  /// **'Tomorrow'**
  String get tomorrow;

  /// No description provided for @scheduled.
  ///
  /// In en, this message translates to:
  /// **'Scheduled'**
  String get scheduled;

  /// No description provided for @inviteAgain.
  ///
  /// In en, this message translates to:
  /// **'Invite Again'**
  String get inviteAgain;

  /// No description provided for @mainGate.
  ///
  /// In en, this message translates to:
  /// **'Main Gate'**
  String get mainGate;

  /// No description provided for @lastWeek.
  ///
  /// In en, this message translates to:
  /// **'Last Week'**
  String get lastWeek;

  /// No description provided for @yesterday.
  ///
  /// In en, this message translates to:
  /// **'Yesterday'**
  String get yesterday;

  /// No description provided for @gate.
  ///
  /// In en, this message translates to:
  /// **'Gate'**
  String get gate;

  /// No description provided for @visitDate.
  ///
  /// In en, this message translates to:
  /// **'Visit Date'**
  String get visitDate;

  /// No description provided for @carNumber.
  ///
  /// In en, this message translates to:
  /// **'Car Number'**
  String get carNumber;

  /// No description provided for @extend.
  ///
  /// In en, this message translates to:
  /// **'Extend'**
  String get extend;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// No description provided for @share.
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get share;

  /// No description provided for @qr.
  ///
  /// In en, this message translates to:
  /// **'QR'**
  String get qr;

  /// No description provided for @pm.
  ///
  /// In en, this message translates to:
  /// **'PM'**
  String get pm;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
