import 'package:afrypay/modules/auth/presentation/login_screen.dart';
import 'package:afrypay/modules/auth/presentation/otp_screen.dart';
import 'package:afrypay/modules/auth/presentation/register_screen.dart';
import 'package:afrypay/modules/home/presentation/account_details_screen.dart';
import 'package:afrypay/modules/home/presentation/application_home_screen.dart';
import 'package:afrypay/modules/splash/presentation/onboarding/onbording_login.dart';
import 'package:afrypay/modules/splash/presentation/onboarding/onbording_page.dart';
import 'package:afrypay/modules/splash/presentation/splash_screen.dart';
import 'package:afrypay/modules/transactions/presentations/transactions_success_screen.dart';
import 'package:get/get.dart';

const String splash = '/';
const String home = '/home';
const String onboarding = '/onboarding';
const String login = '/login';
const String register = '/register';
const String otpScreen = '/otpScreen';
const String settings = '/settings';
const String accompteDetails = '/accompteDetails';
const String transactionConfirm = '/transactionConfirm';
const String onboardingLoginScreen = "/onboardingLoginScreen";
const String transactionsSuccessScreen = "/transactionsSuccessScreen";

final pagesRoute = [
  GetPage(name: splash, page: () => const SplashScreen()),
  GetPage(
    name: onboardingLoginScreen,
    page: () => const OnboardingLoginScreen(),
  ),
  GetPage(name: onboarding, page: () => OnboardingPages()),
  GetPage(name: home, page: () => const ApplicationHomeScreen()),
  GetPage(name: login, page: () => const LoginScreen()),
  GetPage(name: register, page: () => const RegisterScreen()),
  GetPage(name: otpScreen, page: () => const OtpScreen()),
  // GetPage(name: settings, page: () => const SettingsScreen()),
  GetPage(
    name: accompteDetails,
    page: () => AccountDetailsScreen(title: Get.arguments["title"]),
  ),
  GetPage(
    name: transactionsSuccessScreen,
    page: () => const TransactionsSuccessScreen(),
  ),
  //   name: transactionConfirm,
  //   page: () => const TransactionConfirmScreen(),
  // ),
];
//
