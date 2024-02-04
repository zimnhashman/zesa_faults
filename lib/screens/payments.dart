import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_custom_cards/flutter_custom_cards.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:page_transition/page_transition.dart';

import 'online-payment.dart';

final Color backgroundColor = const Color(0xFF2d2d39);

class TransactionDetails {
  final String item;
  final String companyName;
  final int amount;
  final bool income;
  final IconData icon;

  TransactionDetails({
    required this.item,
    required this.amount,
    required this.companyName,
    required this.income,
    required this.icon,
  });
}

class Payments extends StatefulWidget {
  @override
  _MenuDashboardPageState createState() => _MenuDashboardPageState();
}

class _MenuDashboardPageState extends State<Payments>
    with SingleTickerProviderStateMixin {
  bool isCollapsed = true;
  double? screenWidth, screenHeight;
  final Duration duration = const Duration(milliseconds: 200);
  AnimationController? _controller;
  Animation<double>? _scaleAnimation;
  Animation<double>? _menuScaleAnimation;
  Animation<Offset>? _slideAnimation;

  double mainBorderRadius = 0;
  Brightness statusIconColor = Brightness.dark;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: duration);
    _scaleAnimation = Tween<double>(begin: 1, end: 0.7).animate(_controller!);
    _menuScaleAnimation = Tween<double>(
      begin: 0.5,
      end: 1,
    ).animate(_controller!);
    _slideAnimation = Tween<Offset>(begin: const Offset(-1, 0), end: const Offset(0, 0))
        .animate(_controller!);
  }

  void _makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  Widget dashboard(context) {
    return AnimatedPositioned(
      duration: duration,
      top: 0,
      bottom: 0,
      left: isCollapsed ? 0 : 0.5 * screenWidth!,
      width: screenWidth,
      child: ScaleTransition(
        scale: _scaleAnimation!,
        child: Material(
          borderRadius: BorderRadius.circular(mainBorderRadius),
          color: const Color(0xfff4faff),
          child: SafeArea(
              child: Stack(
            children: <Widget>[
              ListView(
                padding: const EdgeInsets.all(0),
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(
                      top: 5,
                      bottom: 30,
                    ),
                    decoration: const BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 2.0.h),
                        Center(
                          child: Text(
                            "SWIPE RIGHT TO VIEW MORE PAYMENT METHODS",
                            style: TextStyle(
                              fontSize: 10.0.sp,
                              color: const Color(0xFF295D99),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: 1.0.h),
                        Container(
                          height: 40.0.h,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                          ),
                          child: PageView(
                            controller: PageController(viewportFraction: 0.9),
                            scrollDirection: Axis.horizontal,
                            pageSnapping: true,
                            children: <Widget>[
                              CustomCard(
                                color: Colors.blue,
                                child: ListView(
                                  children: [
                                    SizedBox(height: 3.0.h),
                                    Image.asset(
                                      'assets/images/ecocash.png',
                                      height: 10.0.h,
                                    ),
                                    const Center(
                                      child: Text(
                                        'BILLER CODE: 93560',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                    SizedBox(height: 2.0.h),
                                    const Center(
                                      child: Text(
                                        'SHORT CODE: *151*2*3*1*1*AMOUNT#',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                    SizedBox(height: 2.0.h),
                                    FloatingActionButton(
                                        child: const Icon(
                                          Icons.phone,
                                          color: Colors.white,
                                          size: 30,
                                        ),
                                        elevation: 0.6,
                                        onPressed: () {
                                          _makePhoneCall(
                                              'tel:*151*2*3*1*1%23');
                                        })
                                  ],
                                ),
                              ),
                              CustomCard(
                                color: Colors.orange,
                                child: ListView(
                                  children: [
                                    SizedBox(height: 3.0.h),
                                    Image.asset(
                                      'assets/images/onemoney.png',
                                      height: 10.0.h,
                                    ),
                                    SizedBox(height: 2.0.h),
                                    const Center(
                                      child: Text(
                                        'BILLER CODE: ZESA',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                    SizedBox(height: 2.0.h),
                                    Center(
                                      child: Text(
                                        'SHORT CODE: *111*2*1*1#',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12.0.sp),
                                      ),
                                    ),
                                    SizedBox(height: 2.0.h),
                                    FloatingActionButton(
                                        backgroundColor: Colors.orange,
                                        child: const Icon(
                                          Icons.phone,
                                          color: Colors.white,
                                          size: 30,
                                        ),
                                        elevation: 0.6,
                                        onPressed: () {
                                          _makePhoneCall(
                                              'tel:*111*2*1*1%23');
                                        })
                                  ],
                                ),
                              ),
                              CustomCard(
                                color: Colors.redAccent,
                                child: ListView(
                                  children: [
                                    SizedBox(height: 3.0.h),
                                    Image.asset(
                                      'assets/images/telecash.png',
                                      height: 10.0.h,
                                    ),
                                    const Center(
                                      child: Text(
                                        'BILLER CODE: 100122',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                    SizedBox(height: 3.0.h),
                                    Center(
                                      child: Text(
                                        'SHORT CODE: *888#',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 10.0.sp),
                                      ),
                                    ),
                                    SizedBox(height: 3.0.h),
                                    FloatingActionButton(
                                        backgroundColor: Colors.redAccent,
                                        child: const Icon(
                                          Icons.phone,
                                          color: Colors.white,
                                          size: 30,
                                        ),
                                        elevation: 0.6,
                                        onPressed: () {
                                          _makePhoneCall('tel:*888%23');
                                        })
                                  ],
                                ),
                              ),
                              CustomCard(
                                color: Colors.lightBlueAccent,
                                child: ListView(
                                  children: [
                                    SizedBox(height: 3.0.h),
                                    Image.asset(
                                      'assets/images/ecobank.png',
                                      height: 10.0.h,
                                    ),
                                    SizedBox(height: 2.0.h),
                                    Center(
                                      child: Text(
                                        'ACCOUNT: 5783600001498',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14.0.sp),
                                      ),
                                    ),
                                    SizedBox(height: 3.0.h),
                                    const Center(
                                      child: Text(
                                        'BRANCH: Joina City Branch',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                    const Center(
                                      child: Text(
                                        'ACCOUNT NAME: ZETDC',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                    const Center(
                                      child: Text(
                                        'SWIFT CODE: ECOCZWHXXXX',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              CustomCard(
                                color: const Color(0xFF009eca),
                                child: ListView(
                                  children: [
                                    SizedBox(height: 3.0.h),
                                    Image.asset(
                                      'assets/images/stanbic.png',
                                      height: 10.0.h,
                                    ),
                                    SizedBox(height: 2.0.h),
                                    Center(
                                      child: Text(
                                        'ACCOUNT: 9140001610758',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14.0.sp),
                                      ),
                                    ),
                                    SizedBox(height: 3.0.h),
                                    const Center(
                                      child: Text(
                                        'BRANCH: Parklane Branch',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                    const Center(
                                      child: Text(
                                          'ACCOUNT NAME: ZETDC',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                    const Center(
                                      child: Text(
                                        'SWIFT CODE: SBICZWHX',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              CustomCard(
                                color: Colors.white,
                                child: ListView(
                                  children: [
                                    SizedBox(height: 3.0.h),
                                    Image.asset(
                                      'assets/images/cbz.png',
                                      height: 10.0.h,
                                    ),
                                    SizedBox(height: 3.0.h),
                                    Center(
                                      child: Text(
                                        'ACCOUNT: 01520379310020',
                                        style: TextStyle(
                                            color: const Color(0xFF233167),
                                            fontSize: 14.0.sp),
                                      ),
                                    ),
                                    SizedBox(height: 3.0.h),
                                    const Center(
                                      child: Text(
                                        'BRANCH: Chitungwiza Makoni Branch',
                                        style:
                                            TextStyle(color: Color(0xFF233167)),
                                      ),
                                    ),
                                    const Center(
                                      child: Text(
                                        'ACCOUNT NAME: ZETDC Revenue Account',
                                        style:
                                            TextStyle(color: Color(0xFF233167)),
                                      ),
                                    ),
                                    const Center(
                                      child: Text(
                                        'SWIFT CODE: COBZZWHAXXX',
                                        style:
                                            TextStyle(color: Color(0xFF233167)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                            ],
                          ),
                        ),
                        SizedBox(height: 1.0.h),
                        Center(
                          child: Text(
                            "When making bank payments, customers are advised to "
                                "quote their account number and name. \n PLEASE SEND ALL PROOF OF PAYMENTS TO pop@zetdc.co.zw",
                            style: TextStyle(
                              fontSize: 8.0.sp,
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.lightBlue,
                    ),
                    padding: const EdgeInsets.only(bottom: 20),
                    height: 50.0.h,
                    child: ListView(
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      children: <Widget>[
                        SizedBox(height: 3.0.h),
                        Padding(
                          padding: const EdgeInsets.only(left: 16, right: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width - 50,
                                padding: EdgeInsets.only(left: 1.6.w),
                                child: Center(
                                  child: Text(
                                    "PAY YOUR BILLS FROM THE COMFORT OF YOUR HOME",
                                    style: TextStyle(
                                      fontSize: 10.0.sp,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 6.0.h),
                        Padding(
                          padding: EdgeInsets.only(
                              top: 2.0.h, left: 3.0.h, right: 3.0.h),
                          child: MaterialButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.fade,
                                      child: OnlinePayments()));
                            },
                            //since this is only a UI app
                            child: const Text(
                              'Pay Using PayNow',
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'SFUIDisplay',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            color: Colors.white,
                            elevation: 0,
                            minWidth: 400,
                            height: 50,
                            textColor: const Color(0xFF295D99),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          )),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: statusIconColor,
      ),
    );
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('PAYMENTS'),
          backgroundColor: Colors.lightBlue,
        ),
        backgroundColor: const Color(0xff343442),
        body: Stack(
          children: <Widget>[
            dashboard(context),
          ],
        ),
      ),
    );
  }
}
