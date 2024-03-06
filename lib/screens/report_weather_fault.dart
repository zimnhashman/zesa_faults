import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zesa_faults/widgets/bottom_navigation.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';
import 'package:zesa_faults/widgets/home_bottom_navigation.dart';
import 'package:zesa_faults/constants/color_constant.dart';

import '../constants/style_constant.dart';

class ReportWeatherFault extends StatefulWidget {
  const ReportWeatherFault({super.key});

  @override
  _ReportWeatherFaultState createState() => _ReportWeatherFaultState();
}

class _ReportWeatherFaultState extends State<ReportWeatherFault> {

  void _openWhatsApp(String message) async {
    String url = "https://wa.me/?text=${Uri.encodeComponent(message)}";
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      print('cannot launch url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: const Text('Report Weather Condition', style: mAppBarText,),
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
                                          _openWhatsApp('Thunderstorm: Please provide details here...');
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
                                              Icon(Icons.thunderstorm, size: 6.0.h, ),
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
                                                      'ThunderStorm',
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
                                          _openWhatsApp('Lightning: Please provide details here...');
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
                                              Icon(Icons.warning_amber,size: 5.0.h ),
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
                                                      'Lightning',
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
                                          _openWhatsApp('Strong Winds: Please provide details here...');
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
                                              Icon(Icons.ac_unit_rounded, size: 5.0.h),
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
                                                      'Strong Wind',
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
