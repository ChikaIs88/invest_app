import 'package:chipln/app/app_module.dart';
import 'package:chipln/logic/core/variable.dart';
import 'package:chipln/models/investor_user_model/investor_user_model.dart';
import 'package:flutter_modular/flutter_modular.dart';


class AuthGuard implements RouteGuard {
  @override
  Future<bool> canActivate(String url, ModularRoute route) async {
    await Modular.isModuleReady<AppModule>();
    if (userUid! == '') {
      // Return `true` to allow access
      return Future.value(true);
    } else {
      userInfo =
          InvestorUserModel.fromJson(userDetails as Map<String, dynamic>);
      // Return `false` to disallow access
      return Future.value(false);
    }
  }

  @override
  String? get guardedRoute => '/investorDashboard';
}
