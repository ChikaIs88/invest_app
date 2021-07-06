import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:chipln/presentation/global/routing/routes.dart';
import 'package:flutter_modular/flutter_modular.dart';

/// [OnboardingCubit] control all the instance of the OnboardingScreen
///
///  AutoRoute is been utilize too. check the navigateToRegisterScreen
class OnboardingCubit extends Cubit<int> {
  OnboardingCubit() : super(0);

  // =================== Local Variables ===========================
  final PageController _pageController = PageController(
      initialPage: 0); //controlling the description of the onboarding.
  final Duration _kDuration = const Duration(
      milliseconds: 300); //time it takes before moving to the next screen
  final Cubic _kCurve = Curves.ease; //for animation

  // =========================== Getters ===========================
  PageController get pageController =>
      _pageController; //making this variable a private variable and for other classes to use it, they need to use getter so that they don't manipulate it

  // ========================= Methods ===============================
  void onPageChanged(int pageIndex) =>
      emit(pageIndex); //so it allows us track page index

  void switchScreen() =>
      _pageController.nextPage(duration: _kDuration, curve: _kCurve);

  // ========================= Navigator Routing for the state =================
  void navigateInvestorLoginView() {
    Modular.to.pushNamed('/investorlogin');
  }

  void navigateInvestorCompanyLoginView() {
    Modular.to.pushNamed('/companyLogin');
  }

  void navigateMLoginView() {
    Routes.seafarer.navigate('/MinvestorCompanyLogin');
  }

  void navigateSLoginView() {
    Routes.seafarer.navigate('/SinvestorCompanyLogin');
  }
}
