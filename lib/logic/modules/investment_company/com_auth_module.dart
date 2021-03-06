// Modular deals with issues related to routing
import 'package:chipln/presentation/features/company/assign/view/company_assign_worker_view.dart';
import 'package:chipln/presentation/features/company/confirm/view/confirm_registration_view.dart';
import 'package:chipln/presentation/features/company/dashboard/view/company_dashboard_view.dart';
import 'package:chipln/presentation/features/company/login/view/m_login_view.dart';
import 'package:chipln/presentation/features/company/notification/view/company_notification_view.dart';
import 'package:chipln/presentation/features/company/packages/view/company_packages_view.dart';
import 'package:chipln/presentation/features/company/register/view/register_view.dart';
import 'package:chipln/presentation/features/company/registrationcomplete/view/investor_register_complete_view.dart';
import 'package:flutter_modular/flutter_modular.dart';

//[class] Company app modular
class CompanyAuthModular extends Module {
  //This contains a list of dependencies to inject into your project
  @override
  List<Bind> get binds => [];

  // This contains all the routes for your module
  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, __) => const InvestmentCompanyView()),
        ChildRoute('/signup', child: (_, __) => InvestorCompanyRegisterView()),
        ChildRoute('/confirm',
            child: (_, __) => const ConfirmInvestorRegistrationView()),
        ChildRoute('/completeRegister',
            child: (_, __) => const InvestorRegistorCompleteView()),
        ChildRoute('/companyDashboard',
            child: (_, __) => const CompanyDashboardView()),
        ChildRoute('/addPackages',
            child: (_, __) => const CompanyPackagesView()),
        ChildRoute('/notification',
            child: (_, __) => const CompanyNotificationView()),
        ChildRoute('/assign', child: (_, __) => const CompanyAssignWorkerView())
      ];
}
