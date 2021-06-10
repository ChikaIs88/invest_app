import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invest_app/presentation/features/investor/home/view/investor_home.dart';
import 'package:invest_app/presentation/features/investor/invest/cubit/investproductlist_cubit.dart';
import 'package:invest_app/presentation/global/assets/assets.gen.dart';
import 'package:invest_app/presentation/global/constants.dart';
import 'package:invest_app/presentation/global/text_styling.dart';
import 'package:invest_app/presentation/global/ui_helper.dart';
import 'package:invest_app/presentation/global/widget/app_text_field.dart';
import 'package:sizer/sizer.dart';

class InvestView extends StatefulWidget {
  const InvestView({Key? key}) : super(key: key);

  @override
  _InvestViewState createState() => _InvestViewState();
}

class _InvestViewState extends State<InvestView> with TickerProviderStateMixin {
  late TabController primaryTC;

  @override
  void initState() {
    primaryTC = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => InvestproductlistCubit(),
        child: Scaffold(
          backgroundColor: kBackgroundColor,
          body: Column(
            children: [
              Container(
                  height: 27.h,
                  padding: paddingLR20,
                  color: Colors.white,
                  child: Column(
                    children: [
                      verticalSpace(5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Product List',
                                style: TextStyling.h1
                                    .copyWith(color: Colors.black),
                              ),
                              horizontalSpace(3),
                              Assets.images.home.productlist.image(height: 8.h)
                            ],
                          ),
                          Row(
                            children: [
                              IconButton(
                                  color: kShadeGrey,
                                  onPressed: () {},
                                  icon: const Icon(EvaIcons.bell)),
                              IconButton(
                                  color: kShadeGrey,
                                  onPressed: () {},
                                  icon: const Icon(EvaIcons.settings))
                            ],
                          )
                        ],
                      ),
                      verticalSpace(4),
                      AppTextField(
                        key: const Key('invest_textfield'),
                        prefixIcon: IconButton(
                            onPressed: () {},
                            icon: const Icon(EvaIcons.search)),
                        hintText: 'Find your best investment...',
                        onChanged: (value) {},
                        validator: (value) {},
                        textInputAction: TextInputAction.next,
                      ),
                    ],
                  )),
              verticalSpace(2),
              Expanded(
                  child: Container(
                color: Colors.white,
                padding: paddingLR20,
                child:
                    BlocBuilder<InvestproductlistCubit, InvestproductlistState>(
                  builder: (context, state) {
                    final _readProductListCubit =
                        context.read<InvestproductlistCubit>();
                    return Column(
                      children: [
                        verticalSpace(2),
                        TabBar(
                          controller: primaryTC,
                          labelPadding: EdgeInsets.zero,
                          labelStyle: TextStyling.h1.copyWith(fontSize: 13),
                          labelColor: Colors.white,
                          unselectedLabelColor: Colors.black,
                          onTap: _readProductListCubit.trackIndex,
                          tabs: [
                            Container(
                              height: 40,
                              width: 30.w,
                              margin: const EdgeInsets.only(right: 4),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: state.index == 0 ? kPrimaryColor : null,
                                border: Border.all(
                                    color: const Color(0XFFececec), width: 1),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(5)),
                              ),
                              child: Text(
                                'All Product',
                                style: TextStyling.bodyText1.copyWith(
                                    fontSize: 13,
                                    color: state.index == 0
                                        ? Colors.white
                                        : Colors.black45),
                              ),
                            ),
                            Container(
                              height: 40,
                              width: 30.w,
                              margin: const EdgeInsets.only(right: 4),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: state.index == 1 ? kPrimaryColor : null,
                                border: Border.all(
                                    color: const Color(0XFFececec), width: 1),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(5)),
                              ),
                              child: Text(
                                'Featured',
                                style: TextStyling.bodyText1.copyWith(
                                    fontSize: 13,
                                    color: state.index == 1
                                        ? Colors.white
                                        : Colors.black45),
                              ),
                            ),
                            Container(
                              height: 40,
                              width: 30.w,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: state.index == 2 ? kPrimaryColor : null,
                                border: Border.all(
                                    color: const Color(0XFFececec), width: 1),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(5)),
                              ),
                              child: Text(
                                'Interested',
                                style: TextStyling.bodyText1.copyWith(
                                    fontSize: 13,
                                    color: state.index == 2
                                        ? Colors.white
                                        : Colors.black45),
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: TabBarView(
                            
                            physics: const NeverScrollableScrollPhysics(),
                            controller: primaryTC,
                            children: <Widget>[
                              Column(
                                children: [
                                  // Align(
                                  //     alignment: Alignment.centerRight,
                                  //     child: IconButton(
                                  //         onPressed: () {},
                                  //         icon: Icon(Eva;Icons.options2Outline))),
                                  Expanded(
                                    child: ListView.builder(
                                        padding: EdgeInsets.zero,
                                        physics: const BouncingScrollPhysics(),
                                        itemCount: 5,
                                        itemBuilder: (context, index) {
                                          return Column(
                                            children: [
                                              const FeaturedCard(),
                                              verticalSpace(2),
                                              const MyHorizontalDivider()
                                            ],
                                          );
                                        }),
                                  ),
                                ],
                              ),
                              Expanded(
                                child: ListView.builder(
                                    padding: EdgeInsets.zero,
                                    physics: const BouncingScrollPhysics(),
                                    itemCount: 5,
                                    itemBuilder: (context, index) {
                                      return Column(
                                        children: [
                                          const FeaturedCard(),
                                          verticalSpace(2),
                                          const MyHorizontalDivider()
                                        ],
                                      );
                                    }),
                              ),
                              Column(
                                children: [
                                  const Align(
                                      alignment: Alignment.centerRight,
                                      child: Icon(EvaIcons.options2Outline)),
                                  Expanded(
                                    child: ListView.builder(
                                        padding: EdgeInsets.zero,
                                        physics: const BouncingScrollPhysics(),
                                        itemCount: 5,
                                        itemBuilder: (context, index) {
                                          return Column(
                                            children: [
                                              const FeaturedCard(),
                                              verticalSpace(2),
                                              const MyHorizontalDivider()
                                            ],
                                          );
                                        }),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    );
                  },
                ),
              ))
            ],
          ),
        ));
  }
}
