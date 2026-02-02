// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Ritaj Compound';

  @override
  String choose(String item) {
    return 'Choose $item';
  }

  @override
  String mustEnter(String item) {
    return 'You must enter $item';
  }

  @override
  String get comparingPhoto => 'Comparing Photo';

  @override
  String get titlePrefixMrs => 'Mrs.';

  @override
  String get date => 'Date';

  @override
  String get password => 'Password';

  @override
  String get nationalId => 'National ID';

  @override
  String get identityNumberValidation => 'Invalid National ID';

  @override
  String get email => 'Email';

  @override
  String get invalidEmail => 'Invalid Email';

  @override
  String get otpValidation => 'OTP must be 4 digits';

  @override
  String get passwordRequired => 'Password is required';

  @override
  String get passwordsDoNotMatch => 'Passwords do not match';

  @override
  String get explanation => 'Explanation';

  @override
  String get homeworkSolution => 'Homework Solution';

  @override
  String get practice => 'Practice';

  @override
  String get revision => 'Revision';

  @override
  String get other => 'Other';

  @override
  String get successfullyDownloaded => 'File downloaded successfully';

  @override
  String get downloading => 'Downloading...';

  @override
  String get invalidPhoneNumber => 'Invalid Phone Number';

  @override
  String get within => 'Within';

  @override
  String get workingNow => 'Working now';

  @override
  String get ended => 'Ended';

  @override
  String nSeconds(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count seconds',
      one: '1 second',
    );
    return '$_temp0';
  }

  @override
  String nMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count minutes',
      one: '1 minute',
    );
    return '$_temp0';
  }

  @override
  String nHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count hours',
      one: '1 hour',
    );
    return '$_temp0';
  }

  @override
  String nDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count days',
      one: '1 day',
    );
    return '$_temp0';
  }

  @override
  String nMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count months',
      one: '1 month',
    );
    return '$_temp0';
  }

  @override
  String nYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count years',
      one: '1 year',
    );
    return '$_temp0';
  }

  @override
  String get serverError => 'Server Error';

  @override
  String get badCertificate => 'Bad Certificate';

  @override
  String get requestCancelled => 'Request Cancelled';

  @override
  String get connectionError => 'No Internet Connection';

  @override
  String get connectionTimeout => 'Connection Timeout';

  @override
  String get receiveTimeout => 'Receive Timeout';

  @override
  String get sendTimeout => 'Send Timeout';

  @override
  String get unknownError => 'Unknown Error';

  @override
  String get welcome => 'Welcome';

  @override
  String get loginTitle => 'Login';

  @override
  String get welcomeBack => 'Welcome Back';

  @override
  String get loginSubtitle =>
      'Log in to access compound services and manage entry/exit permits';

  @override
  String get phoneNumber => 'Phone Number';

  @override
  String get weWillSendCode => 'We will send you a verification code';

  @override
  String get enterPhoneNumber => 'Phone Number';

  @override
  String get sendVerificationCode => 'Send Verification Code';

  @override
  String get or => 'Or';

  @override
  String get signInWithEmail => 'Sign in with Email';

  @override
  String get needHelp => 'Need Help?';

  @override
  String get contactAdministration => 'Contact Administration';

  @override
  String get whatsapp => 'WhatsApp';

  @override
  String get verificationCode => 'Verification Code';

  @override
  String get enterCode => 'Enter Code';

  @override
  String get confirm => 'Confirm';

  @override
  String get resend => 'Resend';

  @override
  String helloUser(Object username) {
    return 'Hello $username';
  }

  @override
  String unitLabel(Object unit) {
    return 'Unit $unit';
  }

  @override
  String get expectedVisitor => 'Expected Visitor';

  @override
  String get dueInstallment => 'Due Installment';

  @override
  String get day => 'Today';

  @override
  String get tuesday => 'Tuesday';

  @override
  String get october => 'October';

  @override
  String get mohamedAli => 'Mohamed Ali';

  @override
  String get services => 'Services';

  @override
  String get quickprocedures => 'Quick Procedures';

  @override
  String get inviteVisitor => 'Invite Visitor';

  @override
  String get deliveryPermit => 'Delivery Permit';

  @override
  String get reportComplaint => 'Report Complaint';

  @override
  String get payInstallment => 'Pay Installment';

  @override
  String get newsAndEvents => 'News & Events';

  @override
  String get viewAll => 'View All';

  @override
  String get activity => 'Activity';

  @override
  String get twoHoursAgo => '2 hours ago';

  @override
  String get poolOpeningTitle => 'New Pool Opening Celebration';

  @override
  String get poolOpeningDesc =>
      'We are happy to invite you to the new pool opening next Saturday at 10 AM';

  @override
  String get shortcuts => 'Shortcuts';

  @override
  String get unitMap => 'Unit Map & Releases';

  @override
  String get exploreUnits => 'Explore available units';

  @override
  String get community => 'Community';

  @override
  String get connectNeighbors => 'Connect with neighbors';

  @override
  String get orderMall => 'Order from Mall';

  @override
  String get orderStores => 'Order from nearby stores';

  @override
  String get activeSubscriptions => 'Active Subscriptions';

  @override
  String get gym => 'Gym';

  @override
  String get monthlyPackage => 'Monthly Package';

  @override
  String get active => 'Active';

  @override
  String get cleaningService => 'Cleaning Service';

  @override
  String get weekly => 'Weekly';

  @override
  String expiresInDays(Object count) {
    return 'Expires in $count days';
  }

  @override
  String get nextSessionTomorrow => 'Next session: Tomorrow';

  @override
  String get manage => 'Manage';

  @override
  String get home => 'Home';

  @override
  String get permits => 'Permits';

  @override
  String get more => 'More';

  @override
  String get visitormanagementanddelivery => 'Visitor Management and Delivery';

  @override
  String get phonenumbernotregistered => 'Phone number not registered';

  @override
  String get visitors => 'Visitors';

  @override
  String get delivery => 'Delivery';

  @override
  String get history => 'History';

  @override
  String get createQuickPermit => 'Create Quick Permit';

  @override
  String get newVisitorPermit => 'New Visitor Permit';

  @override
  String get activePermits => 'Active Permits';

  @override
  String get previousVisitors => 'Previous Visitors';

  @override
  String get tomorrow => 'Tomorrow';

  @override
  String get scheduled => 'Scheduled';

  @override
  String get inviteAgain => 'Invite Again';

  @override
  String get mainGate => 'Main Gate';

  @override
  String get lastWeek => 'Last Week';

  @override
  String get yesterday => 'Yesterday';

  @override
  String get gate => 'Gate';

  @override
  String get visitDate => 'Visit Date';

  @override
  String get carNumber => 'Car Number';

  @override
  String get extend => 'Extend';

  @override
  String get cancel => 'Cancel';

  @override
  String get edit => 'Edit';

  @override
  String get share => 'Share';

  @override
  String get qr => 'QR';

  @override
  String get pm => 'PM';

  @override
  String get visittime => 'Visit time';

  @override
  String get entrancegate => 'Entrance Gate';

  @override
  String get maingate => 'Main Gate';

  @override
  String get cancelthepermit => 'Cancel Permit';

  @override
  String get expire => 'Expires in 4 hours';

  @override
  String get contactneighbors => 'Contact neighbors';

  @override
  String get groups => 'Groups';

  @override
  String get lost => 'Lost';

  @override
  String get writeyourposthere => 'Write your post here';

  @override
  String get pollQuestion =>
      'What do you think about organizing a group BBQ in the central park?';

  @override
  String get pollOption1 => 'Great idea, I support it';

  @override
  String get pollOption2 => 'I need to think about it';

  @override
  String get pollOption3 => 'I cannot participate';

  @override
  String pollVotes(Object count) {
    return '$count votes';
  }

  @override
  String get pollEndsIn => 'Ends in 2 days';

  @override
  String get vote => 'Vote';

  @override
  String get maintenancePost =>
      'Thanks to the maintenance team for the quick response in fixing the elevator issue! Excellent service 👏';

  @override
  String get salePost =>
      'Wooden dining table in excellent condition for sale. 6 chairs, price 3000 EGP, negotiable.';

  @override
  String get forSale => 'For Sale';

  @override
  String get contactSeller => 'Contact Seller';

  @override
  String get loadMorePosts => 'Load more posts';

  @override
  String get whatareyoulookingfor => 'What are you looking for?';

  @override
  String get sarahAhmed => 'Sarah Ahmed';

  @override
  String get ahmedHassan => 'Ahmed Hassan';

  @override
  String get fatimaMohamed => 'Fatima Mohamed';

  @override
  String get fourHoursAgo => '4 hours ago';

  @override
  String get sixHoursAgo => '6 hours ago';

  @override
  String get aDayAgo => 'A day ago';

  @override
  String get now => 'Now';

  @override
  String get you => 'You';

  @override
  String get lostPost =>
      'Has anyone seen my little kitten? Her name is Lulu, grey with white spots. She disappeared yesterday from the balcony.';

  @override
  String get newDeliveryPermit => 'New Delivery Permit';

  @override
  String get activeDeliveries => 'Active Deliveries';

  @override
  String get previousDeliveries => 'Previous Deliveries';

  @override
  String get expectedArrival => 'Expected Arrival';

  @override
  String get within15Min => 'Within 15 mins';

  @override
  String get within30Min => 'Within 30 mins';

  @override
  String get talonOrder => 'Talon Order';

  @override
  String get amazon => 'Amazon';

  @override
  String get noonOrder => 'Noon Order';

  @override
  String get kosharyGeha => 'Koshary Geha';

  @override
  String enteredYesterday(Object time) {
    return 'Entered yesterday $time';
  }

  @override
  String get enteredLastWeek => 'Entered last week';

  @override
  String get complaintsAndReports => 'Complaints & Proposals';

  @override
  String get reportingProblem => 'Report a problem';

  @override
  String get financialoutlook => 'Financial Outlook';

  @override
  String get installmentsAndPayment => 'Installments and Payment';

  @override
  String get availableUnits => 'Available Units';

  @override
  String get unitsStore => 'Units Store';

  @override
  String get mallOrdering => 'Mall Ordering';

  @override
  String get nearbyMall => 'Nearby Mall';

  @override
  String get searchForProducts => 'Search for products...';

  @override
  String get grocery => 'Grocery';

  @override
  String get pharmacy => 'Pharmacy';

  @override
  String get restaurants => 'Restaurants';

  @override
  String get electronics => 'Electronics';

  @override
  String get featuredOffers => 'Featured Offers';

  @override
  String get discount20 => '20% Discount';

  @override
  String get onAllGrocery => 'On all grocery products';

  @override
  String get endsIn3Days => 'Ends in 3 days';

  @override
  String get availableStores => 'Available Stores';

  @override
  String get goodMarket => 'Good Market';

  @override
  String get freeDelivery => 'Free delivery for orders + 100 EGP';

  @override
  String get shopNow => 'Shop Now';

  @override
  String get alNaharPharmacy => 'Al-Nahar Pharmacy';

  @override
  String get medsAndPrescriptions => 'Meds & Prescriptions';

  @override
  String get alAsalaRestaurant => 'Al-Asala Restaurant';

  @override
  String get easternWesternFood => 'Eastern & Western Food';

  @override
  String get orderNow => 'Order Now';

  @override
  String get busy => 'Busy';

  @override
  String get techStore => 'Tech Store';

  @override
  String get opensTomorrow => 'Opens at 8:00 AM tomorrow';

  @override
  String get closed => 'Closed';

  @override
  String get open => 'Open';

  @override
  String get inProgress => 'In Progress';

  @override
  String get completed => 'Completed';

  @override
  String get createNewComplaint => 'Create New Complaint';

  @override
  String get all => 'All';

  @override
  String get electricityOutage => 'Repeated Electricity Outage';

  @override
  String get electricityOutageDesc =>
      'Continuous power outage on the fourth floor since yesterday';

  @override
  String get facilities => 'Facilities';

  @override
  String get sinceTwoDays => '2 days ago';

  @override
  String get buildingA => 'Building A';

  @override
  String get viewDetails => 'View Details';

  @override
  String get lateNoise => 'Late Night Noise';

  @override
  String get lateNoiseDesc =>
      'Disturbance from the neighboring unit after midnight';

  @override
  String get security => 'Security';

  @override
  String get since3Days => '3 days ago';

  @override
  String get latestUpdateSecurity => 'Latest update from Security Team';

  @override
  String get contactedOwner =>
      'Owner contacted, issue will be resolved within 24 hours';

  @override
  String get since2Hours => '2 hours ago';

  @override
  String get cleanHallways => 'Clean Hallways';

  @override
  String get cleanHallwaysDesc =>
      'Request for extra cleaning of building hallways';

  @override
  String get cleanliness => 'Cleanliness';

  @override
  String get sinceWeek => 'A week ago';

  @override
  String get solvedSuccessfully => 'Solved Successfully';

  @override
  String get excellentRate => 'Excellent Rating';

  @override
  String get fastService =>
      'Fast and distinguished service, thanks to the team';

  @override
  String get solvedInTwoDays => 'Solved in 2 days';

  @override
  String attachments(Object count) {
    return '$count attachments';
  }

  @override
  String comments(Object count) {
    return '$count comments';
  }

  @override
  String get minutes => 'minutes';

  @override
  String get medicalServices => 'Medical Services';

  @override
  String get clinicAndPharmacy => 'Clinics & Pharmacy';

  @override
  String get technicalSupport => 'Technical Support';

  @override
  String get maintenanceRequest => 'Maintenance Request';

  @override
  String get overviewOfInstallments => 'Overview of Installments';

  @override
  String get paid => 'Paid';

  @override
  String get pending => 'Pending';

  @override
  String needsPayment(Object count) {
    return '$count Needs payment';
  }

  @override
  String fromTotalInstallments(Object count) {
    return 'from $count installments';
  }

  @override
  String get servicesInstallment => 'Services Installment';

  @override
  String get dueToday => 'Due Today';

  @override
  String get payNow => 'Pay Now';

  @override
  String get maintenanceInstallment => 'Maintenance Installment';

  @override
  String lateDays(Object count) {
    return 'Late $count days';
  }

  @override
  String get payImmediately => 'Pay Immediately';

  @override
  String lateFees(Object amount) {
    return '+ $amount EGP Late fees';
  }

  @override
  String get paymentMethods => 'Payment Methods';

  @override
  String get addCard => 'Add Card';

  @override
  String get virtualCard => 'Virtual Card';

  @override
  String get paymentFromWallet => 'Payment from Wallet';

  @override
  String get recentTransactions => 'Recent Transactions';

  @override
  String get gymSubscription => 'Gym Subscription';

  @override
  String get mallOrder => 'Mall Order';

  @override
  String get electricityBill => 'Electricity Bill';

  @override
  String get due => 'Due';

  @override
  String get late => 'Late';

  @override
  String get defaultLabel => 'Default';

  @override
  String yesterdayAt(Object time) {
    return 'Yesterday, $time';
  }

  @override
  String daysAgo(Object count) {
    return '$count days ago';
  }

  @override
  String get egp => 'EGP';

  @override
  String get paymentDetail => 'Payment Detail';

  @override
  String unitsFound(Object count) {
    return '$count units found';
  }

  @override
  String get sortByPrice => 'Sort by Price';

  @override
  String unit(Object name) {
    return 'Unit $name';
  }

  @override
  String tower(Object name) {
    return 'Tower $name';
  }

  @override
  String floor(Object name) {
    return 'Floor $name';
  }

  @override
  String rooms(Object count) {
    return '$count Rooms';
  }

  @override
  String bathrooms(Object count) {
    return '$count Bathrooms';
  }

  @override
  String area(Object size) {
    return '$size m²';
  }

  @override
  String pricePerMeter(Object amount) {
    return '$amount / m²';
  }

  @override
  String get gardenView => 'Garden View';

  @override
  String get balcony => 'Balcony';

  @override
  String get corner => 'Corner';

  @override
  String get bookNow => 'Book Now';

  @override
  String get waitingList => 'Waiting List';

  @override
  String reservedUntil(Object date) {
    return 'Reserved until $date';
  }

  @override
  String get unitNotAvailable => 'This unit is not available';

  @override
  String get joinWaitingList => 'Join Waiting List';

  @override
  String get viewMoreUnits => 'View more units';

  @override
  String get featured => 'Featured';

  @override
  String get reserved => 'Reserved';

  @override
  String get sold => 'Sold';

  @override
  String get doctors => 'Doctors';

  @override
  String get clinics => 'Clinics';

  @override
  String get lab => 'Medical Lab';

  @override
  String get pharmacies => 'Pharmacies';

  @override
  String get medicalCenters => 'Medical Centers';

  @override
  String get searchMedical => 'Search for doctors or services';

  @override
  String get topDoctors => 'Top Rated Doctors';

  @override
  String get bookSelection => 'Book Now';

  @override
  String get specialtyCardio => 'Cardiologist';

  @override
  String get specialtyDento => 'Dentist';

  @override
  String get specialtyNeuro => 'Neurologist';

  @override
  String get specialtyPediatrics => 'Pediatrician';

  @override
  String distance(Object amount) {
    return '$amount km away';
  }

  @override
  String rating(Object count, Object score) {
    return '$score ($count reviews)';
  }

  @override
  String get electrician => 'Electrician';

  @override
  String get plumber => 'Plumber';

  @override
  String get carpenter => 'Carpenter';

  @override
  String get acTechnician => 'AC Technician';

  @override
  String get painter => 'Painter';

  @override
  String get specialist => 'Specialist';

  @override
  String get bookService => 'Book Service';

  @override
  String get technicalSupportDesc => 'Maintenance & Repairs';

  @override
  String get profile => 'Profile';

  @override
  String get personalInfo => 'Personal Information';

  @override
  String get unitDetails => 'Unit Details';

  @override
  String get familyMembers => 'Family Members';

  @override
  String get vehicles => 'Vehicles';

  @override
  String get ownedApartments => 'Owned Apartments';

  @override
  String get issues => 'Issues';

  @override
  String get serviceRequests => 'Service Requests';

  @override
  String get unitOwner => 'Unit Owner';

  @override
  String get emailAddress => 'Email Address';

  @override
  String get nationalIdNumber => 'National ID Number';

  @override
  String get birthDate => 'Birth Date';

  @override
  String get unitNumber => 'Unit Number';

  @override
  String get floorNumber => 'Floor';

  @override
  String get unitArea => 'Area';

  @override
  String get location => 'Location';

  @override
  String get handoverDate => 'Handover Date';

  @override
  String get fourthFloor => 'Fourth Floor';

  @override
  String get squareMeters => 'square meters';

  @override
  String get riyadh => 'Riyadh';

  @override
  String get wife => 'Wife';

  @override
  String get son => 'Son';

  @override
  String get years => 'years';

  @override
  String get toyota => 'Toyota Camry 2020';

  @override
  String get motorcycle => 'Honda Motorcycle';

  @override
  String get rentalsAndGuests => 'Rentals & Guests';

  @override
  String get rentalStatus => 'Rental Status';

  @override
  String get startDate => 'Start Date';

  @override
  String get endDate => 'End Date';

  @override
  String get rentPeriod => 'Rental Period';

  @override
  String get contractExpiry => 'Contract Expiry';

  @override
  String get contractDetails => 'View Details';

  @override
  String get tenantInfo => 'Tenant Information';

  @override
  String get mainTenant => 'Main Tenant';

  @override
  String get ownerData => 'Owner Data';

  @override
  String get khaledAhmedAli => 'Khaled Ahmed Ali';

  @override
  String get unitOwnerTitle => 'Unit Owner';

  @override
  String get contractNumber => 'Contract Number';

  @override
  String get nationalIdShort => 'National ID';

  @override
  String get contactOwner => 'Contact Owner';

  @override
  String get language => 'Language';

  @override
  String get logout => 'Logout';

  @override
  String get changeLanguage => 'Change Language';

  @override
  String get selectLanguage => 'Select Language';

  @override
  String get arabic => 'Arabic';

  @override
  String get english => 'English';

  @override
  String get logoutConfirmation => 'Logout Confirmation';

  @override
  String get logoutMessage => 'Are you sure you want to logout?';

  @override
  String get yes => 'Yes';

  @override
  String get no => 'No';

  @override
  String get ahmadMohammadAli => 'Ahmad Mohammad Ali';

  @override
  String get fatimaAhmadAli => 'Fatima Ahmad Ali';

  @override
  String get mohammadAhmadAli => 'Mohammad Ahmad Ali';

  @override
  String get mainTenantTitle => 'Main Tenant';

  @override
  String get nationalIdLabel => 'National ID';

  @override
  String get call => 'Call';

  @override
  String get contractExpiryMessage =>
      'The rental contract will expire in 3 months. Contact the owner to renew the contract.';

  @override
  String get january => 'January';

  @override
  String get march => 'March';

  @override
  String get january15 => 'January 15, 1990';

  @override
  String get march15 => 'March 15, 2022';

  @override
  String get january15_2024 => 'January 15, 2024';

  @override
  String get january14_2025 => 'January 14, 2025';

  @override
  String get threeMonthsTwoWeeks => '3 months and 2 weeks';

  @override
  String get phoneNumberValue => '+20 100 123 4567';

  @override
  String get emailValue => 'ahmed.ali@email.com';

  @override
  String get nationalIdValue => '29012345678901';

  @override
  String get unitValue => 'A-402';

  @override
  String get areaValue => '120 square meters';

  @override
  String get sonAge => 'Son - 16 years old';

  @override
  String get toyotaCamry => 'Toyota Camry 2020';

  @override
  String get hondaMotorcycle => 'Honda Motorcycle';

  @override
  String get plateNumber1 => 'ABC 123';

  @override
  String get plateNumber2 => 'DEF 456';

  @override
  String get inactive => 'Inactive';

  @override
  String get contractIdValue => 'CMT-2024-001';

  @override
  String get importantAnnouncement => 'Important Announcement';

  @override
  String get compoundRulesMessage =>
      'Please adhere to compound rules and review the scheduled times for events.';

  @override
  String get event => 'Event';

  @override
  String get saturday19October => 'Saturday, October 19';

  @override
  String get tenAM => '10:00 AM';

  @override
  String get poolOpeningDescription =>
      'Join us for the new pool opening with recreational activities, special segments, and surprises for all family members.';

  @override
  String get willAttend => 'I will attend';

  @override
  String get wontAttend => 'I won\'t attend';

  @override
  String get free => 'Free';

  @override
  String get childrenFunDay => 'Children\'s Fun Day';

  @override
  String get friday25October => 'Friday, October 25';

  @override
  String get fourPM => '4:00 PM';

  @override
  String get childrenFunDescription =>
      'A recreational event for children including group games, competitions, and activities suitable for ages 5 to 12.';

  @override
  String get registerChildNow => 'Register your child now';

  @override
  String get announcement => 'Announcement';

  @override
  String get threeHoursAgo => '3 hours ago';

  @override
  String get elevatorMaintenanceTitle =>
      'Routine Elevator Maintenance - Building A';

  @override
  String get elevatorMaintenanceDescription =>
      'We inform you that routine maintenance will be performed on all elevators in Building A on Thursday, October 17 from 9:00 AM to 12:00 PM. We apologize in advance for any inconvenience.';

  @override
  String get readMore => 'Read More';

  @override
  String get subscriptionManagement => 'Subscription Management';

  @override
  String get monthlyCost => 'Monthly Cost';

  @override
  String get thisMonthSavings => 'This Month\'s Savings';

  @override
  String get bookSession => 'Book Session';

  @override
  String get newSubscription => 'New Subscription';

  @override
  String get manageAll => 'Manage All';

  @override
  String get fitnessClub => 'Fitness Club';

  @override
  String get monthlyPackageOpen => 'Monthly Package - Open';

  @override
  String get expiresIn15Days => 'Expires in 15 days';

  @override
  String get houseCleaning => 'House Cleaning Service';

  @override
  String get weeklyThreeHours => 'Weekly - 3 hours';

  @override
  String get tomorrowTenAM => 'Tomorrow - 10:00 AM';

  @override
  String get availableServices => 'Available Services';

  @override
  String get pool => 'Pool';

  @override
  String get poolAndSauna => 'Swimming pool and sauna';

  @override
  String get save600 => 'Save 600';

  @override
  String get modernEquipmentTrainers => 'Modern equipment and trainers';

  @override
  String get mostPopular => 'Most Popular';

  @override
  String get monthly => 'Monthly';

  @override
  String get yearly => 'Yearly';

  @override
  String get openAccess => 'Open Access';

  @override
  String get saunaUse => 'Sauna Use';

  @override
  String get personalLockers => 'Personal Lockers';

  @override
  String get subscribeNow => 'Subscribe Now';

  @override
  String get createInvitation => 'Create Invitation';

  @override
  String get entityData => 'Entity Data';

  @override
  String get entityName => 'Entity Name';

  @override
  String get enterName => 'Enter Name';

  @override
  String get phoneNumberOptional => 'Phone Number - Optional';

  @override
  String get details => 'Details';

  @override
  String get expectedArrivalWithin => 'Expected arrival within';

  @override
  String get selectGate => 'Select Gate';

  @override
  String get gate2 => 'Gate 2';

  @override
  String get gate3 => 'Gate 3';

  @override
  String get additionalNotes => 'Additional Notes';

  @override
  String get visitSpecialNotes => 'Any special notes about the visit';

  @override
  String get createInvitationButton => 'Create Invitation';

  @override
  String get pleaseEnterEntityName => 'Please enter entity name';

  @override
  String get pleaseEnterValidPhone => 'Please enter a valid phone number';

  @override
  String get pleaseSelectArrivalTime => 'Please select expected arrival time';

  @override
  String get pleaseSelectValidDate => 'Please select a valid date';

  @override
  String get fifteenMinutes => '15 minutes';

  @override
  String get thirtyMinutes => '30 minutes';

  @override
  String get fortyFiveMinutes => '45 minutes';

  @override
  String get sixtyMinutes => '60 minutes';

  @override
  String get visitorData => 'Visitor Data';

  @override
  String get visitorName => 'Visitor Name';

  @override
  String get visitDetails => 'Visit Details';

  @override
  String get time => 'Time';

  @override
  String get visitOptions => 'Visit Options';

  @override
  String get multipleEntry => 'Multiple Entry';

  @override
  String get multipleEntryDescription => 'Allow entry and exit multiple times';

  @override
  String get longTermVisit => 'Long-term Visit';

  @override
  String get longTermVisitDescription => 'Valid for several days';

  @override
  String get pleaseEnterVisitorName => 'Please enter visitor name';

  @override
  String get pleaseEnterPhoneNumber => 'Please enter phone number';

  @override
  String get pleaseSelectTime => 'Please select time';

  @override
  String get permitCreatedSuccessfully => 'Permit created successfully';

  @override
  String get noActivePermits => 'No active permits';

  @override
  String get noPreviousVisitors => 'No Previous Visitors';

  @override
  String get noPreviousDeliveries => 'No previous deliveries';

  @override
  String get datetime => 'Date & Time';

  @override
  String get loading => 'Loading...';

  @override
  String get retry => 'Retry';

  @override
  String get weekAgo => 'Week ago';

  @override
  String get weeksAgo => 'Weeks ago';

  @override
  String get today => 'Today';
}
