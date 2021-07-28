import 'package:animations/animations.dart';
import 'package:chipln/logic/core/firebase_core.dart';
import 'package:chipln/logic/core/variable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chipln/presentation/features/investor/home/view/investor_home.dart';
import 'package:chipln/presentation/features/investor/invest/cubit/investproductlist_cubit.dart';
import 'package:chipln/presentation/global/assets/assets.gen.dart';
import 'package:chipln/presentation/global/constants.dart';
import 'package:chipln/presentation/global/text_styling.dart';
import 'package:chipln/presentation/global/ui_helper.dart';
import 'package:chipln/presentation/global/widget/app_text_field.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sizer/sizer.dart';
import 'package:chipln/presentation/global/widget/ioptions.dart';

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
    final Stream<QuerySnapshot> _companyPackages =
        FirebaseFirestore.instance.collection('package').snapshots();
    final Stream<QuerySnapshot> _featuredPackages =
        FirebaseFirestore.instance.collection('package').limit(4).snapshots();
    final Stream<QuerySnapshot> _intrestedPackages = FirebaseFirestore.instance
        .collection('intrested')
        .where('userId')
        .snapshots();
    final appConfig = Modular.get<FirebaseConfiguration>();
    return BlocProvider(
        create: (context) => InvestproductlistCubit(),
        child: Scaffold(
          backgroundColor: kBackgroundColor,
          body: InvestorProductListBodySection(primaryTC: primaryTC, companyPackages: _companyPackages, appConfig: appConfig, featuredPackages: _featuredPackages, intrestedPackages: _intrestedPackages),
        ));
  }
}

class InvestorProductListBodySection extends StatelessWidget {
  const InvestorProductListBodySection({
    Key? key,
    required this.primaryTC,
    required Stream<QuerySnapshot<Object?>> companyPackages,
    required this.appConfig,
    required Stream<QuerySnapshot<Object?>> featuredPackages,
    required Stream<QuerySnapshot<Object?>> intrestedPackages,
  }) : _companyPackages = companyPackages, _featuredPackages = featuredPackages, _intrestedPackages = intrestedPackages, super(key: key);

  final TabController primaryTC;
  final Stream<QuerySnapshot<Object?>> _companyPackages;
  final FirebaseConfiguration appConfig;
  final Stream<QuerySnapshot<Object?>> _featuredPackages;
  final Stream<QuerySnapshot<Object?>> _intrestedPackages;

  @override
  Widget build(BuildContext context) {
    return Column(
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
                            Expanded(
                              child: StreamBuilder<QuerySnapshot>(
                                  stream: _companyPackages,
                                  builder: (context,
                                      AsyncSnapshot<QuerySnapshot>
                                          snapshot) {
                                    if (snapshot.hasError) {
                                      return Text('Something went wrong');
                                    }

                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return Text("Loading");
                                    }
                                    if (snapshot.connectionState ==
                                        ConnectionState.done) {}
                                    return ListView(
                                        padding: EdgeInsets.zero,
                                        physics:
                                            const BouncingScrollPhysics(),
                                        children: snapshot.data!.docs.map(
                                            (DocumentSnapshot document) {
                                          var data = document.data()
                                              as Map<String, dynamic>;
                                          appConfig.downloadImageURL(
                                              id: data['companyId']);

                                          // print(imageInfo.id);
                                          return OpenContainer(
                                            closedElevation: 0,
                                            transitionType:
                                                ContainerTransitionType
                                                    .fade,
                                            transitionDuration:
                                                const Duration(
                                                    milliseconds: 500),
                                            openBuilder:
                                                (context, action) {
                                              return Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .start,
                                                // ignore: prefer_const_literals_to_create_immutables
                                                children: [
                                                  ProductDetailTop(
                                                    url: data['image'],
                                                  ),
                                                  ProductDetailDown(
                                                      data['id'],
                                                      data['packageName'],
                                                      data['description'],
                                                      data['price'],
                                                      data['unit'],
                                                      'By ${data['company']}.',
                                                      data['companyId'],
                                                      data['company'],
                                                      data['image']
                                                      ),
                                                ],
                                              );
                                            },
                                            closedBuilder:
                                                (context, action) {
                                              return Column(
                                                children: [
                                                  FeaturedCard(
                                                    data['id'],
                                                    data['packageName'],
                                                    data['description'],
                                                    data['price'],
                                                    data['unit'],
                                                    'By ${data['company']}.',
                                                    url: data['image'],
                                                  ),
                                                  verticalSpace(2),
                                                  const MyHorizontalDivider(),
                                                ],
                                              );
                                            },
                                          );
                                        }).toList());
                                  }),
                            ),
                          ],
                        ),
                        Expanded(
                          child: StreamBuilder<QuerySnapshot>(
                              stream: _featuredPackages,
                              builder: (context,
                                  AsyncSnapshot<QuerySnapshot> snapshot) {
                                if (snapshot.hasError) {
                                  return Text('Something went wrong');
                                }

                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return Text("Loading");
                                }
                                if (snapshot.connectionState ==
                                    ConnectionState.done) {}
                                return ListView(
                                    padding: EdgeInsets.zero,
                                    physics:
                                        const BouncingScrollPhysics(),
                                    children: snapshot.data!.docs
                                        .map((DocumentSnapshot document) {
                                      var data = document.data()
                                          as Map<String, dynamic>;
                                      appConfig.downloadImageURL(
                                          id: data['companyId']);

                                      // print(imageInfo.id);
                                      return OpenContainer(
                                        closedElevation: 0,
                                        transitionType:
                                            ContainerTransitionType.fade,
                                        transitionDuration:
                                            const Duration(
                                                milliseconds: 500),
                                        openBuilder: (context, action) {
                                          return Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            // ignore: prefer_const_literals_to_create_immutables
                                            children: [
                                              ProductDetailTop(
                                                url: data['image'],
                                              ),
                                              ProductDetailDown(
                                                  data['id'],
                                                  data['packageName'],
                                                  data['description'],
                                                  data['price'],
                                                  data['unit'],
                                                  'By ${data['company']}.',
                                                  data['companyId'],
                                                  data['company'], 
                                                  data['image']
                                                  ),
                                            ],
                                          );
                                        },
                                        closedBuilder: (context, action) {
                                          return Column(
                                            children: [
                                              FeaturedCard(
                                                data['id'],
                                                data['packageName'],
                                                data['description'],
                                                data['price'],
                                                data['unit'],
                                                'By ${data['company']}.',
                                                url: data['image'],
                                              ),
                                              verticalSpace(2),
                                              const MyHorizontalDivider(),
                                            ],
                                          );
                                        },
                                      );
                                    }).toList());
                              }),
                        ),
                        Expanded(
                          child: StreamBuilder<QuerySnapshot>(
                              stream: _intrestedPackages,
                              builder: (context,
                                  AsyncSnapshot<QuerySnapshot> snapshot) {
                                if (snapshot.hasError) {
                                  return Text('Something went wrong');
                                }

                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return Text("Loading");
                                }
                                if (snapshot.connectionState ==
                                    ConnectionState.done) {}
                                return ListView(
                                    padding: EdgeInsets.zero,
                                    physics:
                                        const BouncingScrollPhysics(),
                                    children: snapshot.data!.docs
                                        .map((DocumentSnapshot document) {
                                      var data = document.data()
                                          as Map<String, dynamic>;
                                      appConfig.downloadImageURL(
                                          id: data['companyId']);

                                      // print(imageInfo.id);
                                      return OpenContainer(
                                        closedElevation: 0,
                                        transitionType:
                                            ContainerTransitionType.fade,
                                        transitionDuration:
                                            const Duration(
                                                milliseconds: 500),
                                        openBuilder: (context, action) {
                                          return Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            // ignore: prefer_const_literals_to_create_immutables
                                            children: [
                                              ProductDetailTop(
                                                url: data['image'],
                                              ),
                                              ProductDetailDown(
                                                  data['id'],
                                                  data['packageName'],
                                                  data['description'],
                                                  data['price'],
                                                  data['unit'],
                                                  'By ${data['company']}.',
                                                  data['companyId'],
                                                  data['company'],
                                                  data['image']
                                                  ),
                                            ],
                                          );
                                        },
                                        closedBuilder: (context, action) {
                                          return Column(
                                            children: [
                                              FeaturedCard(
                                                data['id'],
                                                data['packageName'],
                                                data['description'],
                                                data['price'],
                                                data['unit'],
                                                'By ${data['company']}.',
                                                url: data['image'],
                                              ),
                                              verticalSpace(2),
                                              const MyHorizontalDivider(),
                                            ],
                                          );
                                        },
                                      );
                                    }).toList());
                              }),
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
    );
  }
}
