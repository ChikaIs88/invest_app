import 'package:animations/animations.dart';
import 'package:chipln/presentation/global/routing/routes.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:chipln/presentation/global/assets/assets.gen.dart';
import 'package:chipln/presentation/global/constants.dart';
import 'package:chipln/presentation/global/text_styling.dart';
import 'package:chipln/presentation/global/ui_helper.dart';
import 'package:chipln/presentation/global/widget/app_flat_button.dart';
import 'package:chipln/presentation/global/widget/app_text_field.dart';
import 'package:chipln/presentation/global/widget/container_clipper.dart';
import 'package:chipln/presentation/global/widget/transparent_status_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:chipln/presentation/global/widget/ioptions.dart';


class ProductDetailDown extends StatelessWidget {
  final String title;
  final String description;
  final double price;
  final int unit;
  final String company;
  //final Assets profile;

  // ignore: lines_longer_than_80_chars
  const ProductDetailDown(this.title, this.description, this.price, this.unit, this.company);

  @override
  Widget build(BuildContext context) {
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
                  onPressed: () {},
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
  const ProductDetailTop({
    Key? key,
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
        CircleAvatar(
          backgroundColor: Colors.white,
          maxRadius: 60,
          child: Assets.images.home.samplecompany.image(),
        )
      ],
    );
  }
}