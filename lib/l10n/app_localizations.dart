import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_pt.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
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
    Locale('en'),
    Locale('es'),
    Locale('pt'),
  ];

  /// Greeting message when user opens the login screen
  ///
  /// In en, this message translates to:
  /// **'Hi! Welcome Back'**
  String get hiWelcomeBack;

  /// Prompt to log into the account
  ///
  /// In en, this message translates to:
  /// **'Log in to your account'**
  String get loginToAccount;

  /// Validation message for username/email input
  ///
  /// In en, this message translates to:
  /// **'Please enter your username or email'**
  String get pleaseEnterUsername;

  /// Placeholder for username/email input field
  ///
  /// In en, this message translates to:
  /// **'Enter your Username or email'**
  String get enterUsername;

  /// Validation message for password input
  ///
  /// In en, this message translates to:
  /// **'Please enter your password'**
  String get pleaseEnterPassword;

  /// Placeholder for password input field
  ///
  /// In en, this message translates to:
  /// **'Enter your password'**
  String get enterPassword;

  /// Checkbox label to remember user credentials
  ///
  /// In en, this message translates to:
  /// **'Remember me'**
  String get rememberMe;

  /// Button label to submit login form
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// Label for total hours worked
  ///
  /// In en, this message translates to:
  /// **'Total Hours'**
  String get totalHours;

  /// Label indicating hourly rate
  ///
  /// In en, this message translates to:
  /// **'Per Hour'**
  String get perHour;

  /// Label for current earning
  ///
  /// In en, this message translates to:
  /// **'Earning'**
  String get earning;

  /// Label for total accumulated earning
  ///
  /// In en, this message translates to:
  /// **'Total Earning'**
  String get totalEarning;

  /// Label for calendar month
  ///
  /// In en, this message translates to:
  /// **'Month'**
  String get month;

  /// Label for the current status
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get status;

  /// Indicates something is complete
  ///
  /// In en, this message translates to:
  /// **'Complete'**
  String get complete;

  /// Indicates something is not finished
  ///
  /// In en, this message translates to:
  /// **'Unfinished'**
  String get unfinished;

  /// Label for a single day
  ///
  /// In en, this message translates to:
  /// **'Day'**
  String get day;

  /// Prompt to select an area
  ///
  /// In en, this message translates to:
  /// **'Select the area'**
  String get selectArea;

  /// Displayed when there are no projects
  ///
  /// In en, this message translates to:
  /// **'No projects available'**
  String get noProjectsAvailable;

  /// Prompt to select a project
  ///
  /// In en, this message translates to:
  /// **'Select the Project'**
  String get selectProject;

  /// Label for the start time
  ///
  /// In en, this message translates to:
  /// **'Start'**
  String get start;

  /// Label for lunch time
  ///
  /// In en, this message translates to:
  /// **'Lunch'**
  String get lunch;

  /// Label for the end time
  ///
  /// In en, this message translates to:
  /// **'End'**
  String get end;

  /// Label for the prices section
  ///
  /// In en, this message translates to:
  /// **'Prices'**
  String get prices;

  /// Button label to apply filters or changes
  ///
  /// In en, this message translates to:
  /// **'Apply'**
  String get apply;

  /// User profile section label
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// Button label to log out
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;
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
      <String>['en', 'es', 'pt'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'pt':
      return AppLocalizationsPt();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
