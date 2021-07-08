import 'package:chipln/app/app_module.dart';
import 'package:chipln/logic/core/variable.dart';
import 'package:chipln/models/company_user_model/company_user_model.dart';
import 'package:chipln/models/investor_user_model/investor_user_model.dart';
import 'package:flutter_modular/flutter_modular.dart';


//[class] class the manage our auth routing 

class AuthGuard implements RouteGuard {
  @override
  Future<bool> canActivate(String url, ModularRoute route) async {
    await Modular.isModuleReady<AppModule>();
    if (userUid! == '') {
      return Future.value(true);
    } else {
      userInfo =
        role =='user' ?  InvestorUserModel.fromJson(userDetails as Map<String, dynamic>) : CompanyUserModel.fromJson(userDetails as Map<String, dynamic>);
      return Future.value(false);
    }
  }

  @override
  String? get guardedRoute => role =='user' ? '/investorDashboard' : '/companyLogin/companyDashboard';
}
