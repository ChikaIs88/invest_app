import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:invest_app/presentation/global/routing/routes.dart';

/// [OnboardingCubit] control all the instance of the OnboardingScreen
///
///  AutoRoute is been utilize too. check the navigateToRegisterScreen
class OnboardingCubit extends Cubit<int> {
  OnboardingCubit() : super(0);

  // =================== Local Variables ===========================
  PageController _pageController = PageController(initialPage: 0);
  Duration _kDuration = const Duration(milliseconds: 300);
  Cubic _kCurve = Curves.ease;

  // =========================== Getters ===========================
  PageController get pageController => _pageController;

  // ========================= Methods ===============================
  void onPageChanged(int pageIndex) => emit(pageIndex);

  void switchScreen() =>
      _pageController.nextPage(duration: _kDuration, curve: _kCurve);

  void navigateInvestorLoginView() {
     Routes.seafarer.navigate('/investorlogin');
  }
     
}
