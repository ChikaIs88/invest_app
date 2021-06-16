//{@Buttom  Navigation}  design for the dashbaord bottom navigation
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:chipln/presentation/features/investor/dashboard/cubit/bottom_navigator_controller_cubit.dart';
import 'package:chipln/presentation/global/constants.dart';

SnakeNavigationBar buildBottomNavigationBar(
    BottomNavigatorControllerCubit _currentstate, BuildContext context) {
  var checkState = context.watch<BottomNavigatorControllerCubit>().state;

  return SnakeNavigationBar.color(
    behaviour: SnakeBarBehaviour.pinned,
    snakeShape: SnakeShape.indicator,
    shape: const RoundedRectangleBorder(
        borderRadius: const BorderRadius.only(
      topLeft: Radius.circular(25),
      topRight: Radius.circular(25),
    )),
    padding: EdgeInsets.zero,
backgroundColor: kPrimaryColor,
    ///configuration for SnakeNavigationBar.color
    snakeViewColor:const Color(0xff0A2059),
    selectedItemColor: const Color(0xff0A2059),
    unselectedItemColor: Colors.white,

    showUnselectedLabels: true,
    currentIndex: _currentstate.state,
    onTap: (index) {
      switch (index) {
        case 0:
          context.read<BottomNavigatorControllerCubit>().changeToHome();
          break;
        case 1:
          context.read<BottomNavigatorControllerCubit>().changeToExplore();
          break;
        case 2:
          context.read<BottomNavigatorControllerCubit>().changeToWallets();
          break;
        case 3:
          context.read<BottomNavigatorControllerCubit>().changeToReward();
          break;
        case 4:
          context.read<BottomNavigatorControllerCubit>().changeToProfile();
          break;
        default:
      }
    },
    items: const [
      BottomNavigationBarItem(
          label: 'Home',
          icon: Icon(
            EvaIcons.gridOutline,
          )),
      BottomNavigationBarItem(
          label: 'Investments',
          icon: Icon(
            EvaIcons.barChart,
          )),
      BottomNavigationBarItem(
          label: 'messages',
          icon: Icon(
             EvaIcons.messageCircle
          )),
      BottomNavigationBarItem(
          label: 'Profile',
          icon: Icon(
             EvaIcons.activity,
          )),
    ],
  );
}
