import 'package:flutter/material.dart';
import 'package:invest_app/presentation/features/investor/chat/view/investor_chat_view.dart';
import 'package:invest_app/presentation/features/investor/home/view/investor_home.dart';
import 'package:invest_app/presentation/features/investor/invest/view/investor_product_list_view.dart';
import 'package:invest_app/presentation/features/investor/profile/view/investor_profile_view.dart';

//{@Body} screens navigating based on the current index.

Widget buildBody(itemBuild) {
  switch (itemBuild) {
    case 0:
      return const InvestorHomeView();
    case 1:
      return const InvestView();
    case 2:
      return const InvestorChatView();
    case 3:
      return const InvestorProfileView();
    default:
      return const InvestorHomeView();
  }
}
