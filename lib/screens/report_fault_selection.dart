import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:zesa_faults/screens/platformLogic.dart';
import 'package:zesa_faults/screens/report_fault.dart';
import 'package:zesa_faults/screens/report_vandalism.dart';
import 'package:zesa_faults/screens/report_weather_fault.dart';
import 'package:zesa_faults/widgets/bottom_navigation.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';
import 'package:zesa_faults/widgets/home_bottom_navigation.dart';
import 'package:zesa_faults/constants/color_constant.dart';

import '../constants/style_constant.dart';

class ReportFault extends StatefulWidget {
  const ReportFault({super.key});

  @override
  _ReportFaultState createState() => _ReportFaultState();
}

class _ReportFaultState extends State<ReportFault> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: const Text('Fault Management', style: mAppBarText,),
        iconTheme: const IconThemeData(
            color: Colors.white
        ),
      ),
      bottomNavigationBar: const BottomNavigation(),
      // Body
      body: LayoutBuilder(
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
                          SizedBox(height: 2.0.h),
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
                                                  child: const ReportWeatherFault()));
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
                                                    left: 2.0.h),
                                                child: Column(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    Text(
                                                      'Report \nWeather',
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
                                                  child: const ReportVandalismFault()));
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
                                                'assets/icons/report.png',
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
                                                      'Report Vandalism',
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
                                                  child: ReportOtherFault()));
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
                                                      'Report \nOther Fault',
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
      ),
    );
  }

}
