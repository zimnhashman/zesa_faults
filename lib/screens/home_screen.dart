import 'dart:io';
import 'package:zesa_faults/widgets/home_bottom_navigation.dart';
import 'package:zesa_faults/screens/payments.dart';
import 'package:zesa_faults/screens/notices.dart';
import 'package:zesa_faults/screens/map.dart';
import 'package:zesa_faults/screens/report_fault.dart';
import 'package:zesa_faults/screens/account.dart';
import 'package:flutter/material.dart';
import 'package:zesa_faults/constants/color_constant.dart';
import 'package:zesa_faults/constants/style_constant.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sizer/sizer.dart';
import 'platformLogic.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

Widget okButton = ElevatedButton(
  child: const Text("What"),
  onPressed: () {
    print("yes");
  },
);

class _HomeScreenState extends State<HomeScreen> {
  int _current = 0;

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {


    return LayoutBuilder(
      //return LayoutBuilder
      builder: (context, constraints) {
        return OrientationBuilder( //return OrientationBuilder
          builder: (context, orientation) {
            //initialize SizerUtil()
            SizerUtil.setScreenSize(constraints, orientation);
             return
              SafeArea(
                top: false,
                child:
                Scaffold(
                  bottomNavigationBar: const BottomHomeNavigation(),
                  body: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF295D99),
                      image: DecorationImage(
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.2), BlendMode.dstATop),
                        image: const AssetImage("assets/images/back.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: ListView(
                      children: <Widget>[
                        // Promos Section
                        Padding(
                          padding: EdgeInsets.only(left: 1.6.w, bottom: 1.0.h),
                          child: Text(
                            '',
                            style: mTitleStyle,
                          ),
                        ),
                        Center(
                          child: Column(
                            children: <Widget>[
                              Text(
                                'ZETDC',
                                style: TextStyle(
                                    fontSize: 24.0.sp, color: Colors
                                    .white),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 2.0.h),
                        CircleAvatar(
                          minRadius: 15.0.h,
                          backgroundColor: Colors.white,
                          backgroundImage:
                          const AssetImage('assets/images/zesa_logo.jpg'),
                        ),
                        SizedBox(height: 2.0.h),
                        Container(
                          margin: EdgeInsets.only(left: 4.0.w, right: 4.0.w),
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            PageTransition(
                                                type: PageTransitionType.fade,
                                                child: Payments()));
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(right: 2.0.w),
                                        padding: EdgeInsets.only(left: 4.0.w),
                                        height: 10.0.h,
                                        decoration: BoxDecoration(
                                          color: mFillColor,
                                          borderRadius: BorderRadius.circular(
                                              2.0.h),
                                          border:
                                          Border.all(
                                              color: mBorderColor, width: 1),
                                        ),
                                        child: Row(
                                          children: <Widget>[
                                            Image.asset(
                                              'assets/icons/payments.png',
                                              height: 6.0.h,
                                              fit: BoxFit.contain,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: 2.0.h),
                                              child: Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Text(
                                                    'Bill \nPayment',
                                                    style: mServiceTitleStyle,
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            PageTransition(
                                                type: PageTransitionType.fade,
                                                child: Account()));
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(left: 2.0.w),
                                        padding: EdgeInsets.only(left: 4.0.w),
                                        height: 10.0.h,
                                        decoration: BoxDecoration(
                                          color: mFillColor,
                                          borderRadius: BorderRadius.circular(
                                              2.0.h),
                                          border:
                                          Border.all(
                                              color: mBorderColor, width: 1),
                                        ),
                                        child: Row(
                                          children: <Widget>[
                                            Image.asset(
                                              'assets/icons/profile.png',
                                              height: 5.0.h,
                                              fit: BoxFit.contain,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: 2.0.h),
                                              child: Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Text(
                                                    'My Account',
                                                    style: mServiceTitleStyle,
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 4.0.h,
                              ),

                              Row(
                                children: <Widget>[
                                  Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            PageTransition(
                                                type: PageTransitionType.fade,
                                                child: getPlatform()));
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(right: 2.0.w),
                                        padding: EdgeInsets.only(left: 4.0.w),
                                        height: 10.0.h,
                                        decoration: BoxDecoration(
                                          color: mFillColor,
                                          borderRadius: BorderRadius.circular(
                                              2.0.h),
                                          border:
                                          Border.all(
                                              color: mBorderColor, width: 1),
                                        ),
                                        child: Row(
                                          children: <Widget>[
                                            Image.asset(
                                              'assets/icons/report.png',
                                              height: 6.0.h,
                                              fit: BoxFit.contain,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: 2.3.h),
                                              child: Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Text(
                                                    'Report \nFault',
                                                    style: mServiceTitleStyle,
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            PageTransition(
                                                type: PageTransitionType.fade,
                                                child: Notices()));
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(left: 2.0.w),
                                        padding: EdgeInsets.only(left: 4.0.w),
                                        height: 10.0.h,
                                        decoration: BoxDecoration(
                                          color: mFillColor,
                                          borderRadius: BorderRadius.circular(
                                              2.0.h),
                                          border:
                                          Border.all(
                                              color: mBorderColor, width: 1),
                                        ),
                                        child: Row(
                                          children: <Widget>[
                                            Image.asset(
                                              'assets/icons/notices.png',
                                              height: 6.0.h,
                                              fit: BoxFit.contain,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: 2.0.h),
                                              child: Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Text(
                                                    'Notices',
                                                    style: mServiceTitleStyle,
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 4.0.h,
                              ),
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    child: InkWell(
                                      onTap: () async {
                                        try {
                                          final result = await InternetAddress
                                              .lookup(
                                              'google.com');
                                          if (result.isNotEmpty &&
                                              result[0].rawAddress.isNotEmpty) {
                                            print('connected');
                                            Navigator.push(
                                                context,
                                                PageTransition(
                                                    type: PageTransitionType
                                                        .fade,
                                                    child: Map()));
                                          } else {
                                            print('not connected');
                                          }
                                        } on SocketException catch (_) {
                                          Alert(
                                            context: context,
                                            type: AlertType.error,
                                            title: "Please check your connectivity",
                                            desc: "",
                                            buttons: [],
                                          ).show();
                                        }
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(
                                            right: 10.0.h, left: 10.0.h),
                                        padding: EdgeInsets.only(left: 10.0.h),
                                        height: 10.0.h,
                                        decoration: BoxDecoration(
                                          color: mFillColor,
                                          borderRadius: BorderRadius.circular(
                                              2.0.h),
                                          border:
                                          Border.all(
                                              color: mBorderColor, width: 1),
                                        ),
                                        child: Row(
                                          children: <Widget>[
                                            Image.asset(
                                              'assets/images/map.png',
                                              height: 6.0.h,
                                              fit: BoxFit.contain,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 4.0.h,
                              ),
//                      InkWell(
//                        onTap: () {
//                          Navigator.push(
//                              context,
//                              PageTransition(
//                                  type: PageTransitionType.bottomToTop,
//                                  child: CallCenter()));
//                        },
//                        child: Center(
//                          child: CircleAvatar(
//                            radius: 4.0.h,
//                            backgroundColor: Colors.blue,
//                            backgroundImage:
//                            AssetImage('assets/images/call-icon.png'),
//                          ),
//                        ),
//                      ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
          },);
      },
    );

  }
}
