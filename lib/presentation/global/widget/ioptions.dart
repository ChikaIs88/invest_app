import 'package:chipln/logic/core/firebase_core.dart';
import 'package:chipln/logic/core/variable.dart';
import 'package:chipln/presentation/global/assets/assets.gen.dart';
import 'package:chipln/presentation/global/routing/routes.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:chipln/presentation/global/constants.dart';
import 'package:chipln/presentation/global/text_styling.dart';
import 'package:chipln/presentation/global/ui_helper.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sizer/sizer.dart';
import 'package:chipln/presentation/global/widget/compinfo.dart';

import 'app_flat_button.dart';
import 'container_clipper.dart';

class FeaturedCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final int price;
  final String unit;
  final String company;
  final String? url;
  final dynamic id;

  const FeaturedCard(
      this.id, this.title, this.subtitle, this.price, this.unit, this.company,
      {required this.url});

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // CircleAvatar(
        //   backgroundColor: Colors.grey,
        //   radius: 33,
        //   child: url == ''
        //       ? null
        //       : FittedBox(
        //           child: Image.network(
        //           url,
        //           fit: BoxFit.cover,
        //         )),
        // ),
        CircularProfileAvatar(
          url ?? '',
          backgroundColor: Colors.grey,
          borderColor: Colors.white,
          borderWidth: 0,
          elevation: 2,
          radius: 33,
        ),
        horizontalSpace(2),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            verticalSpace(2),
            Text(
              title,
              style: TextStyling.h2.copyWith(color: Colors.black),
            ),
            verticalSpace(1),
            SizedBox(
              width: responsiveWidth(65),
              child: Text(
                subtitle,
                softWrap: false,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyling.bodyText1
                    .copyWith(fontSize: 13, color: Colors.black45),
              ),
            ),
            verticalSpace(1),
            GestureDetector(
              onTap: () {
                //Routes.seafarer('/investorRegister');
                
              },
              child: Text(company,
                  textAlign: TextAlign.center,
                  style: TextStyling.bodyText1
                      .copyWith(fontSize: 13, color: kLightBlue)),
            ),
            verticalSpace(1),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  child: Row(
                    children: [
                      Text(
                        '$price',
                        style: TextStyling.bodyText1
                            .copyWith(color: Colors.black, fontSize: 13),
                      ),
                      horizontalSpace(1),
                      Text(
                        'Per unit',
                        style: TextStyling.bodyText1
                            .copyWith(fontSize: 13, color: Colors.black45),
                      ),
                    ],
                  ),
                ),
                horizontalSpace(4),
                SizedBox(
                  height: 4.h,
                  width: 25.w,
                  child: TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor:
                              const Color.fromRGBO(5, 103, 208, 0.1)),
                      onPressed: () {},
                      child: Text('$unit unit left',
                          style: TextStyling.bodyText1
                              .copyWith(fontSize: 13, color: kLightBlue))),
                )
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class ProductDetailDown extends StatelessWidget {
  final String title;
  final String description;
  final int price;
  final String unit;
  final String company;
  final dynamic productId;
  final dynamic companyId;
  final dynamic companyName;
  final dynamic image;
  //final Assets profile;

  // ignore: lines_longer_than_80_chars
  const ProductDetailDown(
      this.productId,
      this.title,
      this.description,
      this.price,
      this.unit,
      this.company,
      this.companyId,
      this.companyName,
      this.image);

  @override
  Widget build(BuildContext context) {
    final appConfig = Modular.get<FirebaseConfiguration>();
    return Padding(
      padding: paddingLR20,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyling.h1.copyWith(color: Colors.black),
          ),
          verticalSpace(1),
          GestureDetector(
            onTap: () {
              //Routes.seafarer('/investorRegister');
              id = companyId;
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const CompInfo()));
            },
            child: Text(company,
                textAlign: TextAlign.center,
                style: TextStyling.bodyText1
                    .copyWith(fontSize: 15, color: kLightBlue)),
          ),
          verticalSpace(3),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Description',
                style: TextStyling.h2.copyWith(color: Colors.black),
              ),
              Text(
                description,
                style: TextStyling.h2.copyWith(color: Colors.black45),
              ),
            ],
          ),
          verticalSpace(1),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Unit Price',
                      style: TextStyling.h2.copyWith(
                        color: Colors.black,
                      ),
                    ),
                    verticalSpace(2),
                    Row(
                      children: [
                        Text(
                          '$price',
                          style: TextStyling.bodyText1
                              .copyWith(color: Colors.black, fontSize: 13),
                        ),
                        horizontalSpace(1),
                        Text(
                          'Per unit',
                          style: TextStyling.bodyText1
                              .copyWith(fontSize: 13, color: Colors.black45),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              horizontalSpace(4),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'In Stock',
                    style: TextStyling.h2.copyWith(
                      color: Colors.black,
                    ),
                  ),
                  verticalSpace(1),
                  SizedBox(
                    height: 4.h,
                    width: 25.w,
                    child: TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor:
                                const Color.fromRGBO(5, 103, 208, 0.1)),
                        onPressed: () {},
                        child: Text('$unit unit left',
                            style: TextStyling.bodyText1
                                .copyWith(fontSize: 13, color: kLightBlue))),
                  ),
                ],
              )
            ],
          ),
          verticalSpace(5),
          Row(
            children: [
              Container(
                width: 40.w,
                height: 7.h,
                decoration: BoxDecoration(
                    color: Colors.red[100],
                    borderRadius: BorderRadius.circular(10)),
                child: AppFlatButton(
                  color: Colors.red[100],
                  label: 'Not Intrested',
                  onPressed: () {
                    Routes.seafarer.navigate('/investorDashboardView');
                    // _cubit.navigateToRegisterScreenTwo();
                  },
                ),
              ),
              horizontalSpace(5),
              Container(
                width: 40.w,
                height: 7.h,
                child: AppFlatButton(
                  color: kPrimaryColor,
                  label: 'Intrested',
                  onPressed: () async {
                    await appConfig.intrested(productId: '$productId', data: {
                      'userId': userUid,
                      'packageName': title,
                      'image': image,
                      'description': description,
                      'unit': unit,
                      'price': price,
                      'company': companyName
                    }).then((value) => {
                          if (value == null)
                            {}
                          else
                            {
                              appConfig.notification(data: {
                                'userId': userUid,
                                'companyId': companyId,
                                'userName': userInfo.username,
                                'companyName': companyName,
                                'time': DateTime.now()
                              })
                            }
                        });
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class ProductDetailTop extends StatelessWidget {
  final String? url;
  const ProductDetailTop({
    Key? key,
    this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          height: 45.h,
          width: 100.w,
          child: ClipPath(
            clipper: ContainerCurve(),
            child: Container(
              height: (35.h),
              width: double.infinity,
              color: kPrimaryColor,
              child: Column(
                children: [],
              ),
            ),
          ),
        ),
        CircularProfileAvatar(
          url!,
          backgroundColor: Colors.white,
          borderColor: Colors.white,
          borderWidth: 10,
          elevation: 2,
          radius: 60,
        ),
      ],
    );
  }
}
