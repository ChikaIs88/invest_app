// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'dart:async';
import 'dart:developer';
import 'package:last_state/last_state.dart';
import 'package:flutter/widgets.dart';
import 'package:bloc/bloc.dart';
import 'package:invest_app/app/app.dart';
import 'package:invest_app/app/app_bloc_observer.dart';
import 'package:invest_app/presentation/global/routing/routes.dart';

Future<void> main() async {
WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  Routes.createRoutes();
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  await SavedLastStateData.init();
  runZonedGuarded(
    () => runApp(const App()),
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
