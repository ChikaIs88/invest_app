// This is router class to maintain all our route in the app
import 'package:chipln/presentation/features/company/assign/view/company_assign_worker_view.dart';
import 'package:chipln/presentation/features/company/confirm/view/confirm_registration_view.dart';
import 'package:chipln/presentation/features/company/dashboard/view/company_dashboard_view.dart';
import 'package:chipln/presentation/features/company/login/view/Login_view.dart';
import 'package:chipln/presentation/features/company/messages/view/company_messages_view.dart';
import 'package:chipln/presentation/features/company/notification/view/company_notification_view.dart';
import 'package:chipln/presentation/features/company/packages/view/company_packages_view.dart';
import 'package:chipln/presentation/features/company/register/view/register_view.dart';
import 'package:chipln/presentation/features/company/registrationcomplete/view/investor_register_complete_view.dart';
import 'package:chipln/presentation/features/investor/dashboard/view/dashboard_view.dart';
import 'package:chipln/presentation/features/investor/login/view/Login_view.dart';
import 'package:chipln/presentation/features/investor/prefrence/view/prefrence_view.dart';
import 'package:chipln/presentation/features/investor/register/view/register_view.dart';
import 'package:chipln/presentation/features/onboarding/onboarding.dart';
import 'package:seafarer/seafarer.dart';

class Routes {
  static final seafarer = Seafarer();

  static void createRoutes() {
    seafarer.addRoutes([
      //================== [Investor Routing] ===========================//
      SeafarerRoute(
        name: '/',
        defaultTransitions: [
          SeafarerTransition.slide_from_bottom,
          SeafarerTransition.zoom_in,
        ],
        builder: (context, args, params) {
          return OnboardingView();
        },
      ),
      SeafarerRoute(
        name: '/investorlogin',
        defaultTransitions: [
          SeafarerTransition.slide_from_bottom,
          SeafarerTransition.zoom_in,
        ],
        builder: (context, args, params) {
          return InvestorLoginView();
        },
      ),
      SeafarerRoute(
        name: '/investorRegister',
        defaultTransitions: [
          SeafarerTransition.slide_from_bottom,
          SeafarerTransition.zoom_in,
        ],
        builder: (context, args, params) {
          return InvestorRegisterView();
        },
      ),
      SeafarerRoute(
        name: '/investorPrefrence',
        defaultTransitions: [
          SeafarerTransition.slide_from_top,
          SeafarerTransition.zoom_in,
        ],
        builder: (context, args, params) {
          return const PrefrenceView();
        },
      ),
      SeafarerRoute(
        name: '/investorDashboardView',
        defaultTransitions: [
          SeafarerTransition.slide_from_top,
          SeafarerTransition.zoom_in,
        ],
        builder: (context, args, params) {
          return DashboardView();
        },
      ),

      //================== [Investor Company Routing] ===========================//
      SeafarerRoute(
        name: '/investorCompanyLogin',
        defaultTransitions: [
          SeafarerTransition.slide_from_top,
          SeafarerTransition.zoom_in,
        ],
        builder: (context, args, params) {
          return InvestorCompanyLoginView();
        },
      ),
      SeafarerRoute(
        name: '/investorCompanyRegister',
        defaultTransitions: [
          SeafarerTransition.slide_from_top,
          SeafarerTransition.zoom_in,
        ],
        builder: (context, args, params) {
          return InvestorCompanyRegisterView();
        },
      ),
      SeafarerRoute(
        name: '/investorCompanyConfirmRegister',
        defaultTransitions: [
          SeafarerTransition.slide_from_top,
          SeafarerTransition.zoom_in,
        ],
        builder: (context, args, params) {
          return const ConfirmInvestorRegistrationView();
        },
      ),
      SeafarerRoute(
        name: '/investorCompanyCompleteRegister',
        defaultTransitions: [
          SeafarerTransition.slide_from_top,
          SeafarerTransition.zoom_in,
        ],
        builder: (context, args, params) {
          return const InvestorRegistorCompleteView();
        },
      ),
      SeafarerRoute(
        name: '/investorCompanyDashboard',
        defaultTransitions: [
          SeafarerTransition.slide_from_top,
          SeafarerTransition.zoom_in,
        ],
        builder: (context, args, params) {
          return const CompanyDashboardView();
        },
      ),
      SeafarerRoute(
        name: '/investorCompanyPackages',
        defaultTransitions: [
          SeafarerTransition.slide_from_top,
          SeafarerTransition.zoom_in,
        ],
        builder: (context, args, params) {
          return const CompanyPackagesView();
        },
      ),
      SeafarerRoute(
        name: '/investorCompanyMessages',
        defaultTransitions: [
          SeafarerTransition.slide_from_top,
          SeafarerTransition.zoom_in,
        ],
        builder: (context, args, params) {
          return const CompanyMessagesView();
        },
      ),
       SeafarerRoute(
        name: '/investorCompanyAssignWorker',
        defaultTransitions: [
          SeafarerTransition.slide_from_top,
          SeafarerTransition.zoom_in,
        ],
        builder: (context, args, params) {
          return const CompanyAssignWorkerView();
        },
      ),
         SeafarerRoute(
        name: '/investorCompanyNotification',
        defaultTransitions: [
          SeafarerTransition.slide_from_top,
          SeafarerTransition.zoom_in,
        ],
        builder: (context, args, params) {
          return const CompanyNotificationView();
        },
      ),

      
    ]);
  }
}
