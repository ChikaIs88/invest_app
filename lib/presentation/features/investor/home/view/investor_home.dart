import 'package:animations/animations.dart';
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
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

PageController _controller =
    PageController(initialPage: 0, viewportFraction: 0.9);

class InvestorHomeView extends StatelessWidget {
  const InvestorHomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const InvestorHomeTop(),
            verticalSpace(2),
            const InvestCardSection(),
            verticalSpace(2),
            const FeaturedProductCard(),
          ],
        ),
      ),
    );
  }
}

class FeaturedProductCard extends StatelessWidget {
  const FeaturedProductCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      color: Colors.white,
      padding: paddingLR20,
      child: Column(
        children: [
          verticalSpace(2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Featured Products',
                style: TextStyling.h2.copyWith(color: Colors.black),
              ),
              Text('See all',
                  style: TextStyling.bodyText1
                      .copyWith(fontSize: 13, color: kLightBlue))
            ],
          ),
          Expanded(
            child: ListView.builder(
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return OpenContainer(
                    closedElevation: 0,
                    transitionType: ContainerTransitionType.fade,
                    transitionDuration: const Duration(milliseconds: 500),
                    openBuilder: (context, action) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const ProductDetailTop(),
                          const ProductDetailDown(),
                        ],
                      );
                    },
                    closedBuilder: (context, action) {
                      return Column(
                        children: [
                          const FeaturedCard(),
                          verticalSpace(2),
                          const MyHorizontalDivider()
                        ],
                      );
                    },
                  );
                }),
          ),
        ],
      ),
    );
  }
}

class ProductDetailDown extends StatelessWidget {
  const ProductDetailDown({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: paddingLR20,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Gojek',
            style: TextStyling.h1.copyWith(color: Colors.black),
          ),
          verticalSpace(1),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Description',
                style: TextStyling.h2.copyWith(color: Colors.black),
              ),
              Text(
                'Westlion is a leading multi-national deals facilitation and business intelligence company with operations in over 30 countries across Africa and interests in over 15 industries.We work with business leaders, entrepreneurs, governments and investors from Africa, Asia, Europe, Americas and the Middle East.',
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
                          '10,00 \u20A6',
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
                        child: Text('90 Units Left',
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
                  onPressed: () {},
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
          child: Assets.images.home.samplecompany.image(),
          maxRadius: 60,
        )
      ],
    );
  }
}

class FeaturedCard extends StatelessWidget {
  const FeaturedCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 23.w,
          height: 11.h,
          child: Card(
            child: Assets.images.home.samplecompany.image(),
            elevation: 4,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpace(2),
            Text(
              'Gojek',
              style: TextStyling.h2.copyWith(color: Colors.black),
            ),
            verticalSpace(1),
            Text(
              'Gojek is now a leading technology group\nof platform serving millions of users in...',
              style: TextStyling.bodyText1
                  .copyWith(fontSize: 13, color: Colors.black45),
            ),
            verticalSpace(1),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  child: Row(
                    children: [
                      Text(
                        '10,00 \u20A6',
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
                      child: Text('90 Units Left',
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

class InvestCardSection extends StatelessWidget {
  const InvestCardSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35.h,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpace(3),
          SizedBox(
            height: 24.h,
            child: PageView.builder(
              controller: _controller,
              itemCount: 4,
              itemBuilder: (context, index) => Container(
                height: 24.h,
                margin: const EdgeInsets.only(right: 5),
                padding: paddingLR20,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: Assets.images.home.cardbg, fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.red),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Investment Now!',
                          style: TextStyling.h1,
                        ),
                        verticalSpace(1),
                        Text(
                          'Find your best investment for you in\nMoney Grow.',
                          style: TextStyling.bodyText1
                              .copyWith(fontSize: 11, color: Colors.white60),
                        ),
                        verticalSpace(2),
                        SizedBox(
                          height: 4.h,
                          width: 25.w,
                          child: TextButton(
                              style: TextButton.styleFrom(
                                  backgroundColor:
                                      Color.fromRGBO(255, 255, 255, 0.15)),
                              onPressed: () {},
                              child: Text('Buy Now',
                                  style: TextStyling.bodyText1.copyWith(
                                      fontSize: 13, color: Color(0xffFFC64E)))),
                        )
                      ],
                    ),
                    Assets.images.home.analysis.image(width: 25.w)
                  ],
                ),
              ),
            ),
          ),
          verticalSpace(2),
          Padding(
            padding: paddingLR20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SmoothPageIndicator(
                    controller: _controller, // PageController
                    count: 4,
                    effect: const ExpandingDotsEffect(
                        activeDotColor: kLightBlue,
                        dotHeight: 10,
                        dotWidth: 10), // your preferred effect
                    onDotClicked: (index) {}),
                Text('See all promo',
                    style: TextStyling.bodyText1
                        .copyWith(fontSize: 13, color: kLightBlue))
              ],
            ),
          )
        ],
      ),
    );
  }
}

class InvestorHomeTop extends StatelessWidget {
  const InvestorHomeTop({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                      'Hi, Chika',
                      style: TextStyling.h1.copyWith(color: Colors.black),
                    ),
                    horizontalSpace(3),
                    Assets.images.home.homewelcome.image(height: 8.h)
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
                  onPressed: () {}, icon: const Icon(EvaIcons.search)),
              hintText: 'Find your best investment...',
              onChanged: (value) {},
              validator: (value) {},
              textInputAction: TextInputAction.next,
            ),
          ],
        ));
  }
}

void displayDetialBottomSheet(BuildContext context) {
  showModalBottomSheet(
      context: context,
      builder: (ctx) {
        return Text('Hello');
      });
}
