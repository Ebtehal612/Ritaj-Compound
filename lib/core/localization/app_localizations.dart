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

  /// No description provided for @visittime.
  ///
  /// In en, this message translates to:
  /// **'Visit time'**
  String get visittime;

  /// No description provided for @entrancegate.
  ///
  /// In en, this message translates to:
  /// **'Entrance Gate'**
  String get entrancegate;

  /// No description provided for @maingate.
  ///
  /// In en, this message translates to:
  /// **'Main Gate'**
  String get maingate;

  /// No description provided for @cancelthepermit.
  ///
  /// In en, this message translates to:
  /// **'Cancel Permit'**
  String get cancelthepermit;

  /// No description provided for @expire.
  ///
  /// In en, this message translates to:
  /// **'Expires in 4 hours'**
  String get expire;

  /// No description provided for @contactneighbors.
  ///
  /// In en, this message translates to:
  /// **'Contact neighbors'**
  String get contactneighbors;

  /// No description provided for @groups.
  ///
  /// In en, this message translates to:
  /// **'Groups'**
  String get groups;

  /// No description provided for @lost.
  ///
  /// In en, this message translates to:
  /// **'Lost'**
  String get lost;

  /// No description provided for @writeyourposthere.
  ///
  /// In en, this message translates to:
  /// **'Write your post here'**
  String get writeyourposthere;

  /// No description provided for @pollQuestion.
  ///
  /// In en, this message translates to:
  /// **'What do you think about organizing a group BBQ in the central park?'**
  String get pollQuestion;

  /// No description provided for @pollOption1.
  ///
  /// In en, this message translates to:
  /// **'Great idea, I support it'**
  String get pollOption1;

  /// No description provided for @pollOption2.
  ///
  /// In en, this message translates to:
  /// **'I need to think about it'**
  String get pollOption2;

  /// No description provided for @pollOption3.
  ///
  /// In en, this message translates to:
  /// **'I cannot participate'**
  String get pollOption3;

  /// No description provided for @pollVotes.
  ///
  /// In en, this message translates to:
  /// **'{count} votes'**
  String pollVotes(Object count);

  /// No description provided for @pollEndsIn.
  ///
  /// In en, this message translates to:
  /// **'Ends in 2 days'**
  String get pollEndsIn;

  /// No description provided for @vote.
  ///
  /// In en, this message translates to:
  /// **'Vote'**
  String get vote;

  /// No description provided for @maintenancePost.
  ///
  /// In en, this message translates to:
  /// **'Thanks to the maintenance team for the quick response in fixing the elevator issue! Excellent service 👏'**
  String get maintenancePost;

  /// No description provided for @salePost.
  ///
  /// In en, this message translates to:
  /// **'Wooden dining table in excellent condition for sale. 6 chairs, price 3000 EGP, negotiable.'**
  String get salePost;

  /// No description provided for @forSale.
  ///
  /// In en, this message translates to:
  /// **'For Sale'**
  String get forSale;

  /// No description provided for @contactSeller.
  ///
  /// In en, this message translates to:
  /// **'Contact Seller'**
  String get contactSeller;

  /// No description provided for @loadMorePosts.
  ///
  /// In en, this message translates to:
  /// **'Load more posts'**
  String get loadMorePosts;

  /// No description provided for @whatareyoulookingfor.
  ///
  /// In en, this message translates to:
  /// **'What are you looking for?'**
  String get whatareyoulookingfor;

  /// No description provided for @sarahAhmed.
  ///
  /// In en, this message translates to:
  /// **'Sarah Ahmed'**
  String get sarahAhmed;

  /// No description provided for @ahmedHassan.
  ///
  /// In en, this message translates to:
  /// **'Ahmed Hassan'**
  String get ahmedHassan;

  /// No description provided for @fatimaMohamed.
  ///
  /// In en, this message translates to:
  /// **'Fatima Mohamed'**
  String get fatimaMohamed;

  /// No description provided for @fourHoursAgo.
  ///
  /// In en, this message translates to:
  /// **'4 hours ago'**
  String get fourHoursAgo;

  /// No description provided for @sixHoursAgo.
  ///
  /// In en, this message translates to:
  /// **'6 hours ago'**
  String get sixHoursAgo;

  /// No description provided for @aDayAgo.
  ///
  /// In en, this message translates to:
  /// **'A day ago'**
  String get aDayAgo;

  /// No description provided for @now.
  ///
  /// In en, this message translates to:
  /// **'Now'**
  String get now;

  /// No description provided for @you.
  ///
  /// In en, this message translates to:
  /// **'You'**
  String get you;

  /// No description provided for @lostPost.
  ///
  /// In en, this message translates to:
  /// **'Has anyone seen my little kitten? Her name is Lulu, grey with white spots. She disappeared yesterday from the balcony.'**
  String get lostPost;

  /// No description provided for @newDeliveryPermit.
  ///
  /// In en, this message translates to:
  /// **'New Delivery Permit'**
  String get newDeliveryPermit;

  /// No description provided for @activeDeliveries.
  ///
  /// In en, this message translates to:
  /// **'Active Deliveries'**
  String get activeDeliveries;

  /// No description provided for @previousDeliveries.
  ///
  /// In en, this message translates to:
  /// **'Previous Deliveries'**
  String get previousDeliveries;

  /// No description provided for @expectedArrival.
  ///
  /// In en, this message translates to:
  /// **'Expected Arrival'**
  String get expectedArrival;

  /// No description provided for @within15Min.
  ///
  /// In en, this message translates to:
  /// **'Within 15 mins'**
  String get within15Min;

  /// No description provided for @within30Min.
  ///
  /// In en, this message translates to:
  /// **'Within 30 mins'**
  String get within30Min;

  /// No description provided for @talonOrder.
  ///
  /// In en, this message translates to:
  /// **'Talon Order'**
  String get talonOrder;

  /// No description provided for @amazon.
  ///
  /// In en, this message translates to:
  /// **'Amazon'**
  String get amazon;

  /// No description provided for @noonOrder.
  ///
  /// In en, this message translates to:
  /// **'Noon Order'**
  String get noonOrder;

  /// No description provided for @kosharyGeha.
  ///
  /// In en, this message translates to:
  /// **'Koshary Geha'**
  String get kosharyGeha;

  /// No description provided for @enteredYesterday.
  ///
  /// In en, this message translates to:
  /// **'Entered yesterday {time}'**
  String enteredYesterday(Object time);

  /// No description provided for @enteredLastWeek.
  ///
  /// In en, this message translates to:
  /// **'Entered last week'**
  String get enteredLastWeek;

  /// No description provided for @complaintsAndReports.
  ///
  /// In en, this message translates to:
  /// **'Complaints & Proposals'**
  String get complaintsAndReports;

  /// No description provided for @reportingProblem.
  ///
  /// In en, this message translates to:
  /// **'Report a problem'**
  String get reportingProblem;

  /// No description provided for @financialoutlook.
  ///
  /// In en, this message translates to:
  /// **'Financial Outlook'**
  String get financialoutlook;

  /// No description provided for @installmentsAndPayment.
  ///
  /// In en, this message translates to:
  /// **'Installments and Payment'**
  String get installmentsAndPayment;

  /// No description provided for @availableUnits.
  ///
  /// In en, this message translates to:
  /// **'Available Units'**
  String get availableUnits;

  /// No description provided for @unitsStore.
  ///
  /// In en, this message translates to:
  /// **'Units Store'**
  String get unitsStore;

  /// No description provided for @mallOrdering.
  ///
  /// In en, this message translates to:
  /// **'Mall Ordering'**
  String get mallOrdering;

  /// No description provided for @nearbyMall.
  ///
  /// In en, this message translates to:
  /// **'Nearby Mall'**
  String get nearbyMall;

  /// No description provided for @searchForProducts.
  ///
  /// In en, this message translates to:
  /// **'Search for products...'**
  String get searchForProducts;

  /// No description provided for @grocery.
  ///
  /// In en, this message translates to:
  /// **'Grocery'**
  String get grocery;

  /// No description provided for @pharmacy.
  ///
  /// In en, this message translates to:
  /// **'Pharmacy'**
  String get pharmacy;

  /// No description provided for @restaurants.
  ///
  /// In en, this message translates to:
  /// **'Restaurants'**
  String get restaurants;

  /// No description provided for @electronics.
  ///
  /// In en, this message translates to:
  /// **'Electronics'**
  String get electronics;

  /// No description provided for @featuredOffers.
  ///
  /// In en, this message translates to:
  /// **'Featured Offers'**
  String get featuredOffers;

  /// No description provided for @discount20.
  ///
  /// In en, this message translates to:
  /// **'20% Discount'**
  String get discount20;

  /// No description provided for @onAllGrocery.
  ///
  /// In en, this message translates to:
  /// **'On all grocery products'**
  String get onAllGrocery;

  /// No description provided for @endsIn3Days.
  ///
  /// In en, this message translates to:
  /// **'Ends in 3 days'**
  String get endsIn3Days;

  /// No description provided for @availableStores.
  ///
  /// In en, this message translates to:
  /// **'Available Stores'**
  String get availableStores;

  /// No description provided for @goodMarket.
  ///
  /// In en, this message translates to:
  /// **'Good Market'**
  String get goodMarket;

  /// No description provided for @freeDelivery.
  ///
  /// In en, this message translates to:
  /// **'Free delivery for orders + 100 EGP'**
  String get freeDelivery;

  /// No description provided for @shopNow.
  ///
  /// In en, this message translates to:
  /// **'Shop Now'**
  String get shopNow;

  /// No description provided for @alNaharPharmacy.
  ///
  /// In en, this message translates to:
  /// **'Al-Nahar Pharmacy'**
  String get alNaharPharmacy;

  /// No description provided for @medsAndPrescriptions.
  ///
  /// In en, this message translates to:
  /// **'Meds & Prescriptions'**
  String get medsAndPrescriptions;

  /// No description provided for @alAsalaRestaurant.
  ///
  /// In en, this message translates to:
  /// **'Al-Asala Restaurant'**
  String get alAsalaRestaurant;

  /// No description provided for @easternWesternFood.
  ///
  /// In en, this message translates to:
  /// **'Eastern & Western Food'**
  String get easternWesternFood;

  /// No description provided for @orderNow.
  ///
  /// In en, this message translates to:
  /// **'Order Now'**
  String get orderNow;

  /// No description provided for @busy.
  ///
  /// In en, this message translates to:
  /// **'Busy'**
  String get busy;

  /// No description provided for @techStore.
  ///
  /// In en, this message translates to:
  /// **'Tech Store'**
  String get techStore;

  /// No description provided for @opensTomorrow.
  ///
  /// In en, this message translates to:
  /// **'Opens at 8:00 AM tomorrow'**
  String get opensTomorrow;

  /// No description provided for @closed.
  ///
  /// In en, this message translates to:
  /// **'Closed'**
  String get closed;

  /// No description provided for @open.
  ///
  /// In en, this message translates to:
  /// **'Open'**
  String get open;

  /// No description provided for @inProgress.
  ///
  /// In en, this message translates to:
  /// **'In Progress'**
  String get inProgress;

  /// No description provided for @completed.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get completed;

  /// No description provided for @createNewComplaint.
  ///
  /// In en, this message translates to:
  /// **'Create New Complaint'**
  String get createNewComplaint;

  /// No description provided for @all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// No description provided for @electricityOutage.
  ///
  /// In en, this message translates to:
  /// **'Repeated Electricity Outage'**
  String get electricityOutage;

  /// No description provided for @electricityOutageDesc.
  ///
  /// In en, this message translates to:
  /// **'Continuous power outage on the fourth floor since yesterday'**
  String get electricityOutageDesc;

  /// No description provided for @facilities.
  ///
  /// In en, this message translates to:
  /// **'Facilities'**
  String get facilities;

  /// No description provided for @sinceTwoDays.
  ///
  /// In en, this message translates to:
  /// **'2 days ago'**
  String get sinceTwoDays;

  /// No description provided for @buildingA.
  ///
  /// In en, this message translates to:
  /// **'Building A'**
  String get buildingA;

  /// No description provided for @viewDetails.
  ///
  /// In en, this message translates to:
  /// **'View Details'**
  String get viewDetails;

  /// No description provided for @lateNoise.
  ///
  /// In en, this message translates to:
  /// **'Late Night Noise'**
  String get lateNoise;

  /// No description provided for @lateNoiseDesc.
  ///
  /// In en, this message translates to:
  /// **'Disturbance from the neighboring unit after midnight'**
  String get lateNoiseDesc;

  /// No description provided for @security.
  ///
  /// In en, this message translates to:
  /// **'Security'**
  String get security;

  /// No description provided for @since3Days.
  ///
  /// In en, this message translates to:
  /// **'3 days ago'**
  String get since3Days;

  /// No description provided for @latestUpdateSecurity.
  ///
  /// In en, this message translates to:
  /// **'Latest update from Security Team'**
  String get latestUpdateSecurity;

  /// No description provided for @contactedOwner.
  ///
  /// In en, this message translates to:
  /// **'Owner contacted, issue will be resolved within 24 hours'**
  String get contactedOwner;

  /// No description provided for @since2Hours.
  ///
  /// In en, this message translates to:
  /// **'2 hours ago'**
  String get since2Hours;

  /// No description provided for @cleanHallways.
  ///
  /// In en, this message translates to:
  /// **'Clean Hallways'**
  String get cleanHallways;

  /// No description provided for @cleanHallwaysDesc.
  ///
  /// In en, this message translates to:
  /// **'Request for extra cleaning of building hallways'**
  String get cleanHallwaysDesc;

  /// No description provided for @cleanliness.
  ///
  /// In en, this message translates to:
  /// **'Cleanliness'**
  String get cleanliness;

  /// No description provided for @sinceWeek.
  ///
  /// In en, this message translates to:
  /// **'A week ago'**
  String get sinceWeek;

  /// No description provided for @solvedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Solved Successfully'**
  String get solvedSuccessfully;

  /// No description provided for @excellentRate.
  ///
  /// In en, this message translates to:
  /// **'Excellent Rating'**
  String get excellentRate;

  /// No description provided for @fastService.
  ///
  /// In en, this message translates to:
  /// **'Fast and distinguished service, thanks to the team'**
  String get fastService;

  /// No description provided for @solvedInTwoDays.
  ///
  /// In en, this message translates to:
  /// **'Solved in 2 days'**
  String get solvedInTwoDays;

  /// No description provided for @attachments.
  ///
  /// In en, this message translates to:
  /// **'{count} attachments'**
  String attachments(Object count);

  /// No description provided for @comments.
  ///
  /// In en, this message translates to:
  /// **'{count} comments'**
  String comments(Object count);

  /// No description provided for @minutes.
  ///
  /// In en, this message translates to:
  /// **'minutes'**
  String get minutes;

  /// No description provided for @medicalServices.
  ///
  /// In en, this message translates to:
  /// **'Medical Services'**
  String get medicalServices;

  /// No description provided for @clinicAndPharmacy.
  ///
  /// In en, this message translates to:
  /// **'Clinics & Pharmacy'**
  String get clinicAndPharmacy;

  /// No description provided for @technicalSupport.
  ///
  /// In en, this message translates to:
  /// **'Technical Support'**
  String get technicalSupport;

  /// No description provided for @maintenanceRequest.
  ///
  /// In en, this message translates to:
  /// **'Maintenance Request'**
  String get maintenanceRequest;

  /// No description provided for @overviewOfInstallments.
  ///
  /// In en, this message translates to:
  /// **'Overview of Installments'**
  String get overviewOfInstallments;

  /// No description provided for @paid.
  ///
  /// In en, this message translates to:
  /// **'Paid'**
  String get paid;

  /// No description provided for @pending.
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get pending;

  /// No description provided for @needsPayment.
  ///
  /// In en, this message translates to:
  /// **'{count} Needs payment'**
  String needsPayment(Object count);

  /// No description provided for @fromTotalInstallments.
  ///
  /// In en, this message translates to:
  /// **'from {count} installments'**
  String fromTotalInstallments(Object count);

  /// No description provided for @servicesInstallment.
  ///
  /// In en, this message translates to:
  /// **'Services Installment'**
  String get servicesInstallment;

  /// No description provided for @dueToday.
  ///
  /// In en, this message translates to:
  /// **'Due Today'**
  String get dueToday;

  /// No description provided for @payNow.
  ///
  /// In en, this message translates to:
  /// **'Pay Now'**
  String get payNow;

  /// No description provided for @maintenanceInstallment.
  ///
  /// In en, this message translates to:
  /// **'Maintenance Installment'**
  String get maintenanceInstallment;

  /// No description provided for @lateDays.
  ///
  /// In en, this message translates to:
  /// **'Late {count} days'**
  String lateDays(Object count);

  /// No description provided for @payImmediately.
  ///
  /// In en, this message translates to:
  /// **'Pay Immediately'**
  String get payImmediately;

  /// No description provided for @lateFees.
  ///
  /// In en, this message translates to:
  /// **'+ {amount} EGP Late fees'**
  String lateFees(Object amount);

  /// No description provided for @paymentMethods.
  ///
  /// In en, this message translates to:
  /// **'Payment Methods'**
  String get paymentMethods;

  /// No description provided for @addCard.
  ///
  /// In en, this message translates to:
  /// **'Add Card'**
  String get addCard;

  /// No description provided for @virtualCard.
  ///
  /// In en, this message translates to:
  /// **'Virtual Card'**
  String get virtualCard;

  /// No description provided for @paymentFromWallet.
  ///
  /// In en, this message translates to:
  /// **'Payment from Wallet'**
  String get paymentFromWallet;

  /// No description provided for @recentTransactions.
  ///
  /// In en, this message translates to:
  /// **'Recent Transactions'**
  String get recentTransactions;

  /// No description provided for @gymSubscription.
  ///
  /// In en, this message translates to:
  /// **'Gym Subscription'**
  String get gymSubscription;

  /// No description provided for @mallOrder.
  ///
  /// In en, this message translates to:
  /// **'Mall Order'**
  String get mallOrder;

  /// No description provided for @electricityBill.
  ///
  /// In en, this message translates to:
  /// **'Electricity Bill'**
  String get electricityBill;

  /// No description provided for @due.
  ///
  /// In en, this message translates to:
  /// **'Due'**
  String get due;

  /// No description provided for @late.
  ///
  /// In en, this message translates to:
  /// **'Late'**
  String get late;

  /// No description provided for @defaultLabel.
  ///
  /// In en, this message translates to:
  /// **'Default'**
  String get defaultLabel;

  /// No description provided for @yesterdayAt.
  ///
  /// In en, this message translates to:
  /// **'Yesterday, {time}'**
  String yesterdayAt(Object time);

  /// No description provided for @daysAgo.
  ///
  /// In en, this message translates to:
  /// **'{count} days ago'**
  String daysAgo(Object count);

  /// No description provided for @egp.
  ///
  /// In en, this message translates to:
  /// **'EGP'**
  String get egp;

  /// No description provided for @paymentDetail.
  ///
  /// In en, this message translates to:
  /// **'Payment Detail'**
  String get paymentDetail;

  /// No description provided for @unitsFound.
  ///
  /// In en, this message translates to:
  /// **'{count} units found'**
  String unitsFound(Object count);

  /// No description provided for @sortByPrice.
  ///
  /// In en, this message translates to:
  /// **'Sort by Price'**
  String get sortByPrice;

  /// No description provided for @unit.
  ///
  /// In en, this message translates to:
  /// **'Unit {name}'**
  String unit(Object name);

  /// No description provided for @tower.
  ///
  /// In en, this message translates to:
  /// **'Tower {name}'**
  String tower(Object name);

  /// No description provided for @floor.
  ///
  /// In en, this message translates to:
  /// **'Floor {name}'**
  String floor(Object name);

  /// No description provided for @rooms.
  ///
  /// In en, this message translates to:
  /// **'{count} Rooms'**
  String rooms(Object count);

  /// No description provided for @bathrooms.
  ///
  /// In en, this message translates to:
  /// **'{count} Bathrooms'**
  String bathrooms(Object count);

  /// No description provided for @area.
  ///
  /// In en, this message translates to:
  /// **'{size} m²'**
  String area(Object size);

  /// No description provided for @pricePerMeter.
  ///
  /// In en, this message translates to:
  /// **'{amount} / m²'**
  String pricePerMeter(Object amount);

  /// No description provided for @gardenView.
  ///
  /// In en, this message translates to:
  /// **'Garden View'**
  String get gardenView;

  /// No description provided for @balcony.
  ///
  /// In en, this message translates to:
  /// **'Balcony'**
  String get balcony;

  /// No description provided for @corner.
  ///
  /// In en, this message translates to:
  /// **'Corner'**
  String get corner;

  /// No description provided for @bookNow.
  ///
  /// In en, this message translates to:
  /// **'Book Now'**
  String get bookNow;

  /// No description provided for @waitingList.
  ///
  /// In en, this message translates to:
  /// **'Waiting List'**
  String get waitingList;

  /// No description provided for @reservedUntil.
  ///
  /// In en, this message translates to:
  /// **'Reserved until {date}'**
  String reservedUntil(Object date);

  /// No description provided for @unitNotAvailable.
  ///
  /// In en, this message translates to:
  /// **'This unit is not available'**
  String get unitNotAvailable;

  /// No description provided for @joinWaitingList.
  ///
  /// In en, this message translates to:
  /// **'Join Waiting List'**
  String get joinWaitingList;

  /// No description provided for @viewMoreUnits.
  ///
  /// In en, this message translates to:
  /// **'View more units'**
  String get viewMoreUnits;

  /// No description provided for @featured.
  ///
  /// In en, this message translates to:
  /// **'Featured'**
  String get featured;

  /// No description provided for @reserved.
  ///
  /// In en, this message translates to:
  /// **'Reserved'**
  String get reserved;

  /// No description provided for @sold.
  ///
  /// In en, this message translates to:
  /// **'Sold'**
  String get sold;

  /// No description provided for @doctors.
  ///
  /// In en, this message translates to:
  /// **'Doctors'**
  String get doctors;

  /// No description provided for @clinics.
  ///
  /// In en, this message translates to:
  /// **'Clinics'**
  String get clinics;

  /// No description provided for @lab.
  ///
  /// In en, this message translates to:
  /// **'Medical Lab'**
  String get lab;

  /// No description provided for @pharmacies.
  ///
  /// In en, this message translates to:
  /// **'Pharmacies'**
  String get pharmacies;

  /// No description provided for @medicalCenters.
  ///
  /// In en, this message translates to:
  /// **'Medical Centers'**
  String get medicalCenters;

  /// No description provided for @searchMedical.
  ///
  /// In en, this message translates to:
  /// **'Search for doctors or services'**
  String get searchMedical;

  /// No description provided for @topDoctors.
  ///
  /// In en, this message translates to:
  /// **'Top Rated Doctors'**
  String get topDoctors;

  /// No description provided for @bookSelection.
  ///
  /// In en, this message translates to:
  /// **'Book Now'**
  String get bookSelection;

  /// No description provided for @specialtyCardio.
  ///
  /// In en, this message translates to:
  /// **'Cardiologist'**
  String get specialtyCardio;

  /// No description provided for @specialtyDento.
  ///
  /// In en, this message translates to:
  /// **'Dentist'**
  String get specialtyDento;

  /// No description provided for @specialtyNeuro.
  ///
  /// In en, this message translates to:
  /// **'Neurologist'**
  String get specialtyNeuro;

  /// No description provided for @specialtyPediatrics.
  ///
  /// In en, this message translates to:
  /// **'Pediatrician'**
  String get specialtyPediatrics;

  /// No description provided for @distance.
  ///
  /// In en, this message translates to:
  /// **'{amount} km away'**
  String distance(Object amount);

  /// No description provided for @rating.
  ///
  /// In en, this message translates to:
  /// **'{score} ({count} reviews)'**
  String rating(Object count, Object score);

  /// No description provided for @electrician.
  ///
  /// In en, this message translates to:
  /// **'Electrician'**
  String get electrician;

  /// No description provided for @plumber.
  ///
  /// In en, this message translates to:
  /// **'Plumber'**
  String get plumber;

  /// No description provided for @carpenter.
  ///
  /// In en, this message translates to:
  /// **'Carpenter'**
  String get carpenter;

  /// No description provided for @acTechnician.
  ///
  /// In en, this message translates to:
  /// **'AC Technician'**
  String get acTechnician;

  /// No description provided for @painter.
  ///
  /// In en, this message translates to:
  /// **'Painter'**
  String get painter;

  /// No description provided for @specialist.
  ///
  /// In en, this message translates to:
  /// **'Specialist'**
  String get specialist;

  /// No description provided for @bookService.
  ///
  /// In en, this message translates to:
  /// **'Book Service'**
  String get bookService;

  /// No description provided for @technicalSupportDesc.
  ///
  /// In en, this message translates to:
  /// **'Maintenance & Repairs'**
  String get technicalSupportDesc;
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
