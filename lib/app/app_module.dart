import 'package:chipln/logic/core/firebase_core.dart';
import 'package:chipln/logic/core/storage.dart';
import 'package:chipln/logic/modules/investment_company/com_auth_module.dart';
import 'package:chipln/logic/modules/investor/home/investor_home_modular.dart';
import 'package:chipln/logic/modules/investor/login/auth_guard.dart';
import 'package:chipln/logic/modules/investor/login/auth_module.dart';
import 'package:chipln/presentation/features/onboarding/onboarding.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  //This contains a list of dependencies to inject into your project
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => FirebaseConfiguration()),
        AsyncBind(
          (i) => getUid(),
        ),
        AsyncBind(
          (i) => getRole(),
        ),
      ];

  // This contains all the routes for your module
  @override
  List<ModularRoute> get routes => [
        // Company Routing
        ModuleRoute(
          '/companyLogin',
          module: CompanyAuthModular(),
        ),
        // Investor Routing
        ModuleRoute(
          '/investorlogin',
          module: AuthModule(),
        ),
        ModuleRoute(
          '/investorDashboard',
          module: InvestorHomeModular(),
        ),
        // End Investor Routing
        ChildRoute(
          '/',
          child: (_, __) => OnboardingView(),
          guards: [AuthGuard()],
        ),
      ];
}
