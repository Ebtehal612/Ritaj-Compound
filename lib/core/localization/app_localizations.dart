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

  /// No description provided for @unitLabel.
  ///
  /// In en, this message translates to:
  /// **'Unit {unit}'**
  String unitLabel(Object unit);

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
  /// **'New Pool Opening Celebration'**
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

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @personalInfo.
  ///
  /// In en, this message translates to:
  /// **'Personal Information'**
  String get personalInfo;

  /// No description provided for @unitDetails.
  ///
  /// In en, this message translates to:
  /// **'Unit Details'**
  String get unitDetails;

  /// No description provided for @familyMembers.
  ///
  /// In en, this message translates to:
  /// **'Family Members'**
  String get familyMembers;

  /// No description provided for @vehicles.
  ///
  /// In en, this message translates to:
  /// **'Vehicles'**
  String get vehicles;

  /// No description provided for @ownedApartments.
  ///
  /// In en, this message translates to:
  /// **'Owned Apartments'**
  String get ownedApartments;

  /// No description provided for @issues.
  ///
  /// In en, this message translates to:
  /// **'Issues'**
  String get issues;

  /// No description provided for @serviceRequests.
  ///
  /// In en, this message translates to:
  /// **'Service Requests'**
  String get serviceRequests;

  /// No description provided for @unitOwner.
  ///
  /// In en, this message translates to:
  /// **'Unit Owner'**
  String get unitOwner;

  /// No description provided for @emailAddress.
  ///
  /// In en, this message translates to:
  /// **'Email Address'**
  String get emailAddress;

  /// No description provided for @nationalIdNumber.
  ///
  /// In en, this message translates to:
  /// **'National ID Number'**
  String get nationalIdNumber;

  /// No description provided for @birthDate.
  ///
  /// In en, this message translates to:
  /// **'Birth Date'**
  String get birthDate;

  /// No description provided for @unitNumber.
  ///
  /// In en, this message translates to:
  /// **'Unit Number'**
  String get unitNumber;

  /// No description provided for @floorNumber.
  ///
  /// In en, this message translates to:
  /// **'Floor'**
  String get floorNumber;

  /// No description provided for @unitArea.
  ///
  /// In en, this message translates to:
  /// **'Area'**
  String get unitArea;

  /// No description provided for @location.
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get location;

  /// No description provided for @handoverDate.
  ///
  /// In en, this message translates to:
  /// **'Handover Date'**
  String get handoverDate;

  /// No description provided for @fourthFloor.
  ///
  /// In en, this message translates to:
  /// **'Fourth Floor'**
  String get fourthFloor;

  /// No description provided for @squareMeters.
  ///
  /// In en, this message translates to:
  /// **'square meters'**
  String get squareMeters;

  /// No description provided for @riyadh.
  ///
  /// In en, this message translates to:
  /// **'Riyadh'**
  String get riyadh;

  /// No description provided for @wife.
  ///
  /// In en, this message translates to:
  /// **'Wife'**
  String get wife;

  /// No description provided for @son.
  ///
  /// In en, this message translates to:
  /// **'Son'**
  String get son;

  /// No description provided for @years.
  ///
  /// In en, this message translates to:
  /// **'years'**
  String get years;

  /// No description provided for @toyota.
  ///
  /// In en, this message translates to:
  /// **'Toyota Camry 2020'**
  String get toyota;

  /// No description provided for @motorcycle.
  ///
  /// In en, this message translates to:
  /// **'Honda Motorcycle'**
  String get motorcycle;

  /// No description provided for @rentalsAndGuests.
  ///
  /// In en, this message translates to:
  /// **'Rentals & Guests'**
  String get rentalsAndGuests;

  /// No description provided for @rentalStatus.
  ///
  /// In en, this message translates to:
  /// **'Rental Status'**
  String get rentalStatus;

  /// No description provided for @startDate.
  ///
  /// In en, this message translates to:
  /// **'Start Date'**
  String get startDate;

  /// No description provided for @endDate.
  ///
  /// In en, this message translates to:
  /// **'End Date'**
  String get endDate;

  /// No description provided for @rentPeriod.
  ///
  /// In en, this message translates to:
  /// **'Rental Period'**
  String get rentPeriod;

  /// No description provided for @contractExpiry.
  ///
  /// In en, this message translates to:
  /// **'Contract Expiry'**
  String get contractExpiry;

  /// No description provided for @contractDetails.
  ///
  /// In en, this message translates to:
  /// **'View Details'**
  String get contractDetails;

  /// No description provided for @tenantInfo.
  ///
  /// In en, this message translates to:
  /// **'Tenant Information'**
  String get tenantInfo;

  /// No description provided for @mainTenant.
  ///
  /// In en, this message translates to:
  /// **'Main Tenant'**
  String get mainTenant;

  /// No description provided for @ownerData.
  ///
  /// In en, this message translates to:
  /// **'Owner Data'**
  String get ownerData;

  /// No description provided for @khaledAhmedAli.
  ///
  /// In en, this message translates to:
  /// **'Khaled Ahmed Ali'**
  String get khaledAhmedAli;

  /// No description provided for @unitOwnerTitle.
  ///
  /// In en, this message translates to:
  /// **'Unit Owner'**
  String get unitOwnerTitle;

  /// No description provided for @contractNumber.
  ///
  /// In en, this message translates to:
  /// **'Contract Number'**
  String get contractNumber;

  /// No description provided for @nationalIdShort.
  ///
  /// In en, this message translates to:
  /// **'National ID'**
  String get nationalIdShort;

  /// No description provided for @contactOwner.
  ///
  /// In en, this message translates to:
  /// **'Contact Owner'**
  String get contactOwner;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @changeLanguage.
  ///
  /// In en, this message translates to:
  /// **'Change Language'**
  String get changeLanguage;

  /// No description provided for @selectLanguage.
  ///
  /// In en, this message translates to:
  /// **'Select Language'**
  String get selectLanguage;

  /// No description provided for @arabic.
  ///
  /// In en, this message translates to:
  /// **'Arabic'**
  String get arabic;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @logoutConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Logout Confirmation'**
  String get logoutConfirmation;

  /// No description provided for @logoutMessage.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to logout?'**
  String get logoutMessage;

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// No description provided for @no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;

  /// No description provided for @ahmadMohammadAli.
  ///
  /// In en, this message translates to:
  /// **'Ahmad Mohammad Ali'**
  String get ahmadMohammadAli;

  /// No description provided for @fatimaAhmadAli.
  ///
  /// In en, this message translates to:
  /// **'Fatima Ahmad Ali'**
  String get fatimaAhmadAli;

  /// No description provided for @mohammadAhmadAli.
  ///
  /// In en, this message translates to:
  /// **'Mohammad Ahmad Ali'**
  String get mohammadAhmadAli;

  /// No description provided for @mainTenantTitle.
  ///
  /// In en, this message translates to:
  /// **'Main Tenant'**
  String get mainTenantTitle;

  /// No description provided for @nationalIdLabel.
  ///
  /// In en, this message translates to:
  /// **'National ID'**
  String get nationalIdLabel;

  /// No description provided for @call.
  ///
  /// In en, this message translates to:
  /// **'Call'**
  String get call;

  /// No description provided for @contractExpiryMessage.
  ///
  /// In en, this message translates to:
  /// **'The rental contract will expire in 3 months. Contact the owner to renew the contract.'**
  String get contractExpiryMessage;

  /// No description provided for @january.
  ///
  /// In en, this message translates to:
  /// **'January'**
  String get january;

  /// No description provided for @march.
  ///
  /// In en, this message translates to:
  /// **'March'**
  String get march;

  /// No description provided for @january15.
  ///
  /// In en, this message translates to:
  /// **'January 15, 1990'**
  String get january15;

  /// No description provided for @march15.
  ///
  /// In en, this message translates to:
  /// **'March 15, 2022'**
  String get march15;

  /// No description provided for @january15_2024.
  ///
  /// In en, this message translates to:
  /// **'January 15, 2024'**
  String get january15_2024;

  /// No description provided for @january14_2025.
  ///
  /// In en, this message translates to:
  /// **'January 14, 2025'**
  String get january14_2025;

  /// No description provided for @threeMonthsTwoWeeks.
  ///
  /// In en, this message translates to:
  /// **'3 months and 2 weeks'**
  String get threeMonthsTwoWeeks;

  /// No description provided for @phoneNumberValue.
  ///
  /// In en, this message translates to:
  /// **'+20 100 123 4567'**
  String get phoneNumberValue;

  /// No description provided for @emailValue.
  ///
  /// In en, this message translates to:
  /// **'ahmed.ali@email.com'**
  String get emailValue;

  /// No description provided for @nationalIdValue.
  ///
  /// In en, this message translates to:
  /// **'29012345678901'**
  String get nationalIdValue;

  /// No description provided for @unitValue.
  ///
  /// In en, this message translates to:
  /// **'A-402'**
  String get unitValue;

  /// No description provided for @areaValue.
  ///
  /// In en, this message translates to:
  /// **'120 square meters'**
  String get areaValue;

  /// No description provided for @sonAge.
  ///
  /// In en, this message translates to:
  /// **'Son - 16 years old'**
  String get sonAge;

  /// No description provided for @toyotaCamry.
  ///
  /// In en, this message translates to:
  /// **'Toyota Camry 2020'**
  String get toyotaCamry;

  /// No description provided for @hondaMotorcycle.
  ///
  /// In en, this message translates to:
  /// **'Honda Motorcycle'**
  String get hondaMotorcycle;

  /// No description provided for @plateNumber1.
  ///
  /// In en, this message translates to:
  /// **'ABC 123'**
  String get plateNumber1;

  /// No description provided for @plateNumber2.
  ///
  /// In en, this message translates to:
  /// **'DEF 456'**
  String get plateNumber2;

  /// No description provided for @inactive.
  ///
  /// In en, this message translates to:
  /// **'Inactive'**
  String get inactive;

  /// No description provided for @contractIdValue.
  ///
  /// In en, this message translates to:
  /// **'CMT-2024-001'**
  String get contractIdValue;

  /// No description provided for @importantAnnouncement.
  ///
  /// In en, this message translates to:
  /// **'Important Announcement'**
  String get importantAnnouncement;

  /// No description provided for @compoundRulesMessage.
  ///
  /// In en, this message translates to:
  /// **'Please adhere to compound rules and review the scheduled times for events.'**
  String get compoundRulesMessage;

  /// No description provided for @event.
  ///
  /// In en, this message translates to:
  /// **'Event'**
  String get event;

  /// No description provided for @saturday19October.
  ///
  /// In en, this message translates to:
  /// **'Saturday, October 19'**
  String get saturday19October;

  /// No description provided for @tenAM.
  ///
  /// In en, this message translates to:
  /// **'10:00 AM'**
  String get tenAM;

  /// No description provided for @poolOpeningDescription.
  ///
  /// In en, this message translates to:
  /// **'Join us for the new pool opening with recreational activities, special segments, and surprises for all family members.'**
  String get poolOpeningDescription;

  /// No description provided for @willAttend.
  ///
  /// In en, this message translates to:
  /// **'I will attend'**
  String get willAttend;

  /// No description provided for @wontAttend.
  ///
  /// In en, this message translates to:
  /// **'I won\'t attend'**
  String get wontAttend;

  /// No description provided for @free.
  ///
  /// In en, this message translates to:
  /// **'Free'**
  String get free;

  /// No description provided for @childrenFunDay.
  ///
  /// In en, this message translates to:
  /// **'Children\'s Fun Day'**
  String get childrenFunDay;

  /// No description provided for @friday25October.
  ///
  /// In en, this message translates to:
  /// **'Friday, October 25'**
  String get friday25October;

  /// No description provided for @fourPM.
  ///
  /// In en, this message translates to:
  /// **'4:00 PM'**
  String get fourPM;

  /// No description provided for @childrenFunDescription.
  ///
  /// In en, this message translates to:
  /// **'A recreational event for children including group games, competitions, and activities suitable for ages 5 to 12.'**
  String get childrenFunDescription;

  /// No description provided for @registerChildNow.
  ///
  /// In en, this message translates to:
  /// **'Register your child now'**
  String get registerChildNow;

  /// No description provided for @announcement.
  ///
  /// In en, this message translates to:
  /// **'Announcement'**
  String get announcement;

  /// No description provided for @threeHoursAgo.
  ///
  /// In en, this message translates to:
  /// **'3 hours ago'**
  String get threeHoursAgo;

  /// No description provided for @elevatorMaintenanceTitle.
  ///
  /// In en, this message translates to:
  /// **'Routine Elevator Maintenance - Building A'**
  String get elevatorMaintenanceTitle;

  /// No description provided for @elevatorMaintenanceDescription.
  ///
  /// In en, this message translates to:
  /// **'We inform you that routine maintenance will be performed on all elevators in Building A on Thursday, October 17 from 9:00 AM to 12:00 PM. We apologize in advance for any inconvenience.'**
  String get elevatorMaintenanceDescription;

  /// No description provided for @readMore.
  ///
  /// In en, this message translates to:
  /// **'Read More'**
  String get readMore;

  /// No description provided for @subscriptionManagement.
  ///
  /// In en, this message translates to:
  /// **'Subscription Management'**
  String get subscriptionManagement;

  /// No description provided for @monthlyCost.
  ///
  /// In en, this message translates to:
  /// **'Monthly Cost'**
  String get monthlyCost;

  /// No description provided for @thisMonthSavings.
  ///
  /// In en, this message translates to:
  /// **'This Month\'s Savings'**
  String get thisMonthSavings;

  /// No description provided for @bookSession.
  ///
  /// In en, this message translates to:
  /// **'Book Session'**
  String get bookSession;

  /// No description provided for @newSubscription.
  ///
  /// In en, this message translates to:
  /// **'New Subscription'**
  String get newSubscription;

  /// No description provided for @manageAll.
  ///
  /// In en, this message translates to:
  /// **'Manage All'**
  String get manageAll;

  /// No description provided for @fitnessClub.
  ///
  /// In en, this message translates to:
  /// **'Fitness Club'**
  String get fitnessClub;

  /// No description provided for @monthlyPackageOpen.
  ///
  /// In en, this message translates to:
  /// **'Monthly Package - Open'**
  String get monthlyPackageOpen;

  /// No description provided for @expiresIn15Days.
  ///
  /// In en, this message translates to:
  /// **'Expires in 15 days'**
  String get expiresIn15Days;

  /// No description provided for @houseCleaning.
  ///
  /// In en, this message translates to:
  /// **'House Cleaning Service'**
  String get houseCleaning;

  /// No description provided for @weeklyThreeHours.
  ///
  /// In en, this message translates to:
  /// **'Weekly - 3 hours'**
  String get weeklyThreeHours;

  /// No description provided for @tomorrowTenAM.
  ///
  /// In en, this message translates to:
  /// **'Tomorrow - 10:00 AM'**
  String get tomorrowTenAM;

  /// No description provided for @availableServices.
  ///
  /// In en, this message translates to:
  /// **'Available Services'**
  String get availableServices;

  /// No description provided for @pool.
  ///
  /// In en, this message translates to:
  /// **'Pool'**
  String get pool;

  /// No description provided for @poolAndSauna.
  ///
  /// In en, this message translates to:
  /// **'Swimming pool and sauna'**
  String get poolAndSauna;

  /// No description provided for @save600.
  ///
  /// In en, this message translates to:
  /// **'Save 600'**
  String get save600;

  /// No description provided for @modernEquipmentTrainers.
  ///
  /// In en, this message translates to:
  /// **'Modern equipment and trainers'**
  String get modernEquipmentTrainers;

  /// No description provided for @mostPopular.
  ///
  /// In en, this message translates to:
  /// **'Most Popular'**
  String get mostPopular;

  /// No description provided for @monthly.
  ///
  /// In en, this message translates to:
  /// **'Monthly'**
  String get monthly;

  /// No description provided for @yearly.
  ///
  /// In en, this message translates to:
  /// **'Yearly'**
  String get yearly;

  /// No description provided for @openAccess.
  ///
  /// In en, this message translates to:
  /// **'Open Access'**
  String get openAccess;

  /// No description provided for @saunaUse.
  ///
  /// In en, this message translates to:
  /// **'Sauna Use'**
  String get saunaUse;

  /// No description provided for @personalLockers.
  ///
  /// In en, this message translates to:
  /// **'Personal Lockers'**
  String get personalLockers;

  /// No description provided for @subscribeNow.
  ///
  /// In en, this message translates to:
  /// **'Subscribe Now'**
  String get subscribeNow;

  /// No description provided for @createInvitation.
  ///
  /// In en, this message translates to:
  /// **'Create Invitation'**
  String get createInvitation;

  /// No description provided for @entityData.
  ///
  /// In en, this message translates to:
  /// **'Entity Data'**
  String get entityData;

  /// No description provided for @entityName.
  ///
  /// In en, this message translates to:
  /// **'Entity Name'**
  String get entityName;

  /// No description provided for @enterName.
  ///
  /// In en, this message translates to:
  /// **'Enter Name'**
  String get enterName;

  /// No description provided for @phoneNumberOptional.
  ///
  /// In en, this message translates to:
  /// **'Phone Number - Optional'**
  String get phoneNumberOptional;

  /// No description provided for @details.
  ///
  /// In en, this message translates to:
  /// **'Details'**
  String get details;

  /// No description provided for @expectedArrivalWithin.
  ///
  /// In en, this message translates to:
  /// **'Expected arrival within'**
  String get expectedArrivalWithin;

  /// No description provided for @selectGate.
  ///
  /// In en, this message translates to:
  /// **'Select Gate'**
  String get selectGate;

  /// No description provided for @gate2.
  ///
  /// In en, this message translates to:
  /// **'Gate 2'**
  String get gate2;

  /// No description provided for @gate3.
  ///
  /// In en, this message translates to:
  /// **'Gate 3'**
  String get gate3;

  /// No description provided for @additionalNotes.
  ///
  /// In en, this message translates to:
  /// **'Additional Notes'**
  String get additionalNotes;

  /// No description provided for @visitSpecialNotes.
  ///
  /// In en, this message translates to:
  /// **'Any special notes about the visit'**
  String get visitSpecialNotes;

  /// No description provided for @createInvitationButton.
  ///
  /// In en, this message translates to:
  /// **'Create Invitation'**
  String get createInvitationButton;

  /// No description provided for @pleaseEnterEntityName.
  ///
  /// In en, this message translates to:
  /// **'Please enter entity name'**
  String get pleaseEnterEntityName;

  /// No description provided for @pleaseEnterValidPhone.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid phone number'**
  String get pleaseEnterValidPhone;

  /// No description provided for @pleaseSelectArrivalTime.
  ///
  /// In en, this message translates to:
  /// **'Please select expected arrival time'**
  String get pleaseSelectArrivalTime;

  /// No description provided for @pleaseSelectValidDate.
  ///
  /// In en, this message translates to:
  /// **'Please select a valid date'**
  String get pleaseSelectValidDate;

  /// No description provided for @fifteenMinutes.
  ///
  /// In en, this message translates to:
  /// **'15 minutes'**
  String get fifteenMinutes;

  /// No description provided for @thirtyMinutes.
  ///
  /// In en, this message translates to:
  /// **'30 minutes'**
  String get thirtyMinutes;

  /// No description provided for @fortyFiveMinutes.
  ///
  /// In en, this message translates to:
  /// **'45 minutes'**
  String get fortyFiveMinutes;

  /// No description provided for @sixtyMinutes.
  ///
  /// In en, this message translates to:
  /// **'60 minutes'**
  String get sixtyMinutes;

  /// No description provided for @visitorData.
  ///
  /// In en, this message translates to:
  /// **'Visitor Data'**
  String get visitorData;

  /// No description provided for @visitorName.
  ///
  /// In en, this message translates to:
  /// **'Visitor Name'**
  String get visitorName;

  /// No description provided for @visitDetails.
  ///
  /// In en, this message translates to:
  /// **'Visit Details'**
  String get visitDetails;

  /// No description provided for @time.
  ///
  /// In en, this message translates to:
  /// **'Time'**
  String get time;

  /// No description provided for @visitOptions.
  ///
  /// In en, this message translates to:
  /// **'Visit Options'**
  String get visitOptions;

  /// No description provided for @multipleEntry.
  ///
  /// In en, this message translates to:
  /// **'Multiple Entry'**
  String get multipleEntry;

  /// No description provided for @multipleEntryDescription.
  ///
  /// In en, this message translates to:
  /// **'Allow entry and exit multiple times'**
  String get multipleEntryDescription;

  /// No description provided for @longTermVisit.
  ///
  /// In en, this message translates to:
  /// **'Long-term Visit'**
  String get longTermVisit;

  /// No description provided for @longTermVisitDescription.
  ///
  /// In en, this message translates to:
  /// **'Valid for several days'**
  String get longTermVisitDescription;

  /// No description provided for @pleaseEnterVisitorName.
  ///
  /// In en, this message translates to:
  /// **'Please enter visitor name'**
  String get pleaseEnterVisitorName;

  /// No description provided for @pleaseEnterPhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Please enter phone number'**
  String get pleaseEnterPhoneNumber;

  /// No description provided for @pleaseSelectTime.
  ///
  /// In en, this message translates to:
  /// **'Please select time'**
  String get pleaseSelectTime;

  /// No description provided for @permitCreatedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Permit created successfully'**
  String get permitCreatedSuccessfully;

  /// No description provided for @noActivePermits.
  ///
  /// In en, this message translates to:
  /// **'No active permits'**
  String get noActivePermits;

  /// No description provided for @noPreviousVisitors.
  ///
  /// In en, this message translates to:
  /// **'No Previous Visitors'**
  String get noPreviousVisitors;

  /// No description provided for @noPreviousDeliveries.
  ///
  /// In en, this message translates to:
  /// **'No previous deliveries'**
  String get noPreviousDeliveries;

  /// No description provided for @datetime.
  ///
  /// In en, this message translates to:
  /// **'Date & Time'**
  String get datetime;

  /// No description provided for @loading.
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get loading;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @weekAgo.
  ///
  /// In en, this message translates to:
  /// **'Week ago'**
  String get weekAgo;

  /// No description provided for @weeksAgo.
  ///
  /// In en, this message translates to:
  /// **'Weeks ago'**
  String get weeksAgo;

  /// No description provided for @today.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get today;
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
