// Copyright (c) 2021, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:chipln/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
//import 'package:chipln/counter/counter.dart';
import 'package:chipln/presentation/features/onboarding/onboarding.dart';
import 'package:chipln/presentation/global/constants.dart';
import 'package:chipln/presentation/global/routing/routes.dart';
import 'package:seafarer/seafarer.dart';
import 'package:sizer/sizer.dart';
// ignore: import_of_legacy_library_into_null_safe
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
        // ignore: prefer_const_literals_to_create_immutables
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        debugShowCheckedModeBanner: true,
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
