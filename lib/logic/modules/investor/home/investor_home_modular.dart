import 'package:chipln/logic/core/firebase_cloud.dart';
import 'package:chipln/logic/core/variable.dart';
import 'package:chipln/logic/modules/investor/login/auth_guard.dart';
import 'package:chipln/presentation/features/investor/dashboard/view/dashboard_view.dart';
import 'package:flutter_modular/flutter_modular.dart';

class InvestorHomeModular extends Module {
//This contains a list of dependencies to inject into your project
  @override
  List<Bind> get binds => [
        AsyncBind((i) => AddToDatabase().getUserData(id: userUid)),
      ];

  // This contains all the routes for your module
  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (_, __) => DashboardView(),
        ),
      ];
}
