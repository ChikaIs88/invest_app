// @dart=2.9
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'dart:async';
import 'dart:developer';
import 'package:firebase_core/firebase_core.dart';
import 'package:last_state/last_state.dart';
import 'package:flutter/widgets.dart';
import 'package:bloc/bloc.dart';
import 'package:chipln/app/app.dart';
import 'package:chipln/app/app_bloc_observer.dart';

import 'presentation/global/routing/routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  Routes.createRoutes();
  await Firebase.initializeApp();
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  await SavedLastStateData.init();
  runZonedGuarded(
    () => runApp(const App()),
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
