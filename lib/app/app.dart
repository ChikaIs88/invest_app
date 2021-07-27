import 'package:chipln/l10n/l10n.dart';
import 'package:chipln/presentation/global/constants.dart';
import 'package:chipln/presentation/global/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:last_state/last_state.dart';
import 'package:seafarer/seafarer.dart'; //this package allows you to pass parameters to the page that you are navigating to
import 'package:sizer/sizer.dart';

//[Chipln App] configuration
class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return StyledToast(
        locale: const Locale('en', 'US'),
        child: MaterialApp(
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
          debugShowCheckedModeBanner: false,
          title: 'Investment App',
          theme: ThemeData(
              accentColor: kPrimaryColor,
              primaryColor: kPrimaryColor,
              scaffoldBackgroundColor: const Color(0xFFFFFFFF)),
          initialRoute: SavedLastStateData.instance.lastRoute ?? '/',
          navigatorKey: Routes.seafarer.navigatorKey, // important
          onGenerateRoute: Routes.seafarer.generator(), // important
        ).modular(),
      );
    });
  }
}
