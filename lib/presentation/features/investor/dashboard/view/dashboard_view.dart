import 'package:bottom_bar_page_transition/bottom_bar_page_transition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chipln/app/logger_init.dart';
import 'package:chipln/presentation/global/constants.dart';
import 'package:chipln/presentation/global/widget/transparent_status_bar.dart';

import '../components/body.dart';
import '../components/bottom_navigation_bar.dart';
import '../cubit/bottom_navigator_controller_cubit.dart';

///[DashboardView] this holds the bottom navigation bottom
///
///it is basically the main house for the main screen
class DashboardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    logger.i('dashboard has been initailized');

    return TransparentStatusBar(
      child: BlocProvider(
        create: (context) => BottomNavigatorControllerCubit(),
        child: Scaffold(
        
          body: BlocBuilder<BottomNavigatorControllerCubit, int>(
              builder: (context, state) {
            logger.i(' $state has been initialized');
            return BottomBarPageTransition(
              builder: (_, index) => buildBody(index),
              currentIndex: state,
              totalLength: 3,
              transitionType: TransitionType.slide,
              transitionDuration: const Duration(milliseconds: 300),
            );
          }),
          bottomNavigationBar: BlocBuilder<BottomNavigatorControllerCubit, int>(
            builder: (context, state) {
              final _currentstate =
                  context.watch<BottomNavigatorControllerCubit>();
              return buildBottomNavigationBar(_currentstate, context);
            },
          ),
        ),
      ),
    );
  }
}
