import 'package:bloc/bloc.dart';

///[BottomNavigatorControllerCubit] control the state of the bottom navigation
class BottomNavigatorControllerCubit extends Cubit<int> {
  BottomNavigatorControllerCubit() : super(0);



  // Below Function has to change the state base on the click button
  void changeToHome() => emit(0);
  void changeToExplore() => emit(1);
  void changeToWallets() => emit(2);
  void changeToReward() => emit(3);
  void changeToProfile() => emit(4);

  
}


