import 'package:chipln/logic/core/firebase_cloud.dart';
import 'package:chipln/logic/core/firebase_core.dart';
import 'package:chipln/logic/core/storage.dart';
import 'package:chipln/logic/core/variable.dart';
import 'package:chipln/logic/modules/investor/home/investor_home_modular.dart';
import 'package:chipln/logic/modules/investor/login/auth_guard.dart';
import 'package:chipln/logic/modules/investor/login/auth_module.dart';
import 'package:chipln/models/investor_user_model/investor_user_model.dart';
import 'package:chipln/presentation/features/investor/dashboard/view/dashboard_view.dart';
import 'package:chipln/presentation/features/onboarding/onboarding.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  //This contains a list of dependencies to inject into your project
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => Authentication()),
        AsyncBind(
          (i) => getUid(),
        ),
      ];

  // This contains all the routes for your module
  @override
  List<ModularRoute> get routes => [
        ModuleRoute(
          '/investorlogin',
          module: AuthModule(),
        ),
        ModuleRoute(
          '/investorDashboard',
          module: InvestorHomeModular(),
        ),
        ChildRoute(
          '/',
          child: (_, __) => OnboardingView(),
          guards: [AuthGuard()],
        ),
      ];
}
