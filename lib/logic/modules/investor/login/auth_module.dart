import 'package:chipln/presentation/features/investor/login/view/Login_view.dart';
import 'package:chipln/presentation/features/investor/prefrence/view/prefrence_view.dart';
import 'package:chipln/presentation/features/investor/register/view/register_view.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthModule extends Module {
  //This contains a list of dependencies to inject into your project
  @override
  List<Bind> get binds => [];

  // This contains all the routes for your module
  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, __) => InvestorLoginView()),
        ChildRoute('/investorRegister',
            child: (_, __) => InvestorRegisterView()),
        ChildRoute('/investorPrefrence',
            child: (_, __) => const PrefrenceView())
      ];
}
