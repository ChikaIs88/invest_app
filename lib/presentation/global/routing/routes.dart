// This is router class to maintain all our route in the app
import 'package:invest_app/presentation/features/investor/dashboard/view/dashboard_view.dart';
import 'package:invest_app/presentation/features/investor/login/view/Login_view.dart';
import 'package:invest_app/presentation/features/investor/prefrence/view/prefrence_view.dart';
import 'package:invest_app/presentation/features/investor/register/view/register_view.dart';
import 'package:invest_app/presentation/features/onboarding/onboarding.dart';
import 'package:seafarer/seafarer.dart';

class Routes {
  static final seafarer = Seafarer();

  static void createRoutes() {
    seafarer.addRoutes([
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
    ]);
  }
}
