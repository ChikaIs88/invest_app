// Copyright (c) 2021, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
//import 'package:invest_app/counter/counter.dart';
import 'package:invest_app/l10n/l10n.dart';
import 'package:invest_app/Scenes/Welcome/welcome_screen.dart';
import 'package:invest_app/presentation/features/onboarding/onboarding.dart';
import 'package:invest_app/presentation/global/constants.dart';
import 'package:invest_app/presentation/global/routing/routes.dart';
import 'package:seafarer/seafarer.dart';
import 'package:sizer/sizer.dart';
import 'package:last_state/last_state.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        navigatorObservers: [
          SavedLastStateData.instance.navigationObserver,
          SeafarerLoggingObserver()
        ],
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        debugShowCheckedModeBanner: false,
        title: 'Investment App',
        theme: ThemeData(
          accentColor:kPrimaryColor ,
            primaryColor: kPrimaryColor,
            scaffoldBackgroundColor: const Color(0xFFFFFFFF)),
        initialRoute: SavedLastStateData.instance.lastRoute ?? '/',
        navigatorKey: Routes.seafarer.navigatorKey, // important
        onGenerateRoute: Routes.seafarer.generator(), // important
        home: OnboardingView(),
      );
    });
  }
}
