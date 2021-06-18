import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:chipln/presentation/global/routing/routes.dart';

/// [OnboardingCubit] control all the instance of the OnboardingScreen
///
///  AutoRoute is been utilize too. check the navigateToRegisterScreen
class OnboardingCubit extends Cubit<int> {
  OnboardingCubit() : super(0);

  // =================== Local Variables ===========================
  final PageController _pageController = PageController(initialPage: 0);
  final Duration _kDuration = const Duration(milliseconds: 300);
  final Cubic _kCurve = Curves.ease;

  // =========================== Getters ===========================
  PageController get pageController => _pageController;

  // ========================= Methods ===============================
  void onPageChanged(int pageIndex) => emit(pageIndex);

  void switchScreen() =>
      _pageController.nextPage(duration: _kDuration, curve: _kCurve);

  // ========================= Navigator Routing for the state =================
  void navigateInvestorLoginView() {
    Routes.seafarer.navigate('/investorlogin');
  }

  void navigateInvestorCompanyLoginView() {
    Routes.seafarer.navigate('/investorCompany');
  }

  void navigateMLoginView() {
    Routes.seafarer.navigate('/MinvestorCompanyLogin');
  }

  void navigateSLoginView() {
    Routes.seafarer.navigate('SinvestorCompanyLogin');
  }
}
