import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:invest_app/presentation/global/assets/assets.gen.dart';
import 'package:invest_app/presentation/global/constants.dart';
import 'package:invest_app/presentation/global/widget/curve_painter.dart';
import 'package:invest_app/presentation/global/text_styling.dart';
import 'package:invest_app/presentation/global/ui_helper.dart';
import 'package:invest_app/presentation/global/widget/curve_wave.dart';
import 'package:sizer/sizer.dart';

class InvestorProfileView extends StatefulWidget {
  const InvestorProfileView({Key? key}) : super(key: key);

  @override
  _InvestorProfileViewState createState() => _InvestorProfileViewState();
}

class _InvestorProfileViewState extends State<InvestorProfileView>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000))
      ..repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 40.h,
            width: double.infinity,
            decoration: const BoxDecoration(color: kPrimaryColor),
            child: Stack(
              children: [
                Assets.images.login.loginbg.svg(height: 40.h),
                verticalSpace(10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: CustomPaint(
                        painter: CirclePainter(
                          _controller,
                          color: Colors.white,
                        ),
                        child: SizedBox(
                          width: 30.0 * 4.125,
                          height: 30.0 * 4.125,
                          child: ProileCard(controller: _controller),
                        ),
                      ),
                    ),
                    verticalSpace(5),
                    Padding(
                      padding: paddingLR20,
                      child: IntrinsicHeight(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const ProfileText(
                              title: '20,000',
                              subText: 'Min Investment',
                            ),
                            const VerticalDivider(color: Colors.white54),
                            const ProfileText(
                              title: '10',
                              subText: 'Total Connection',
                            ),
                            const VerticalDivider(color: Colors.white54),
                            const ProfileText(
                              title: '100',
                              subText: 'Intrested',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          verticalSpace(2),
          Expanded(
            child: ListView.builder(
                padding: EdgeInsets.zero,
                physics: const BouncingScrollPhysics(),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return const NotifcatioCards();
                }),
          ),
        ],
      ),
    );
  }
}

class NotifcatioCards extends StatelessWidget {
  const NotifcatioCards({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 12.h,
      margin: paddingLR20.copyWith(bottom: 2.h),
      width: double.infinity,
      padding: paddingLR20,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
          // borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          border: const Border(
              left: BorderSide(color: Colors.redAccent, width: 5))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          verticalSpace(2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    'Investment Notice',
                    style: TextStyling.h2.copyWith(color: Colors.black),
                  ),
                Icon(
                    EvaIcons.alertCircle,
                    color: Colors.red[100],
                  )
                ],
              ),
              Text(
                'Today',
                style: TextStyling.bodyText1
                    .copyWith(fontSize: 13, color: Colors.black54),
              )
            ],
          ),
          verticalSpace(2),
          Text(
            'Your just liked an investment.you have intrest in Goki Investment,Jamp to thier dm',
            style: TextStyling.bodyText1
                .copyWith(fontSize: 13, color: Colors.black54),
          ),
 
        ],
      ),
    );
  }
}

class ProfileText extends StatelessWidget {
  const ProfileText({
    Key? key,
    this.title,
    this.subText,
  }) : super(key: key);

  final String? title;
  final String? subText;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title!,
          style: TextStyling.h2,
        ),
        verticalSpace(1),
        Text(
          subText!,
          style: TextStyling.bodyText1
              .copyWith(fontSize: 13, color: Colors.white54),
        )
      ],
    );
  }
}

class ProileCard extends StatelessWidget {
  const ProileCard({
    Key? key,
    required AnimationController controller,
  })  : _controller = controller,
        super(key: key);

  final AnimationController _controller;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(80.0),
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              colors: <Color>[
                Colors.white,
                Color.lerp(Colors.white, Colors.black, .05)!
              ],
            ),
          ),
          child: ScaleTransition(
              scale: Tween(begin: 0.95, end: 1.0).animate(
                CurvedAnimation(
                  parent: _controller,
                  curve: const CurveWave(),
                ),
              ),
              child: Assets.images.home.productlist.image(height: 80)),
        ),
      ),
    );
  }
}
