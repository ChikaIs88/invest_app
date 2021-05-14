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
import 'package:invest_app/constants.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Investment App',
      theme: ThemeData(
          primaryColor: kPrimaryColor,
          scaffoldBackgroundColor: const Color(0xFF4CAF50)),
      home: WelcomeScreen(),
    );
  }
}
