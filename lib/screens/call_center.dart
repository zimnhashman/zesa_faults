import 'package:zesa_faults/constants/whatsapp_number_variables.dart';
import 'package:zesa_faults/screens/facebook.dart';
import 'package:zesa_faults/screens/instagram.dart';
import 'package:zesa_faults/screens/twitter.dart';
import 'package:zesa_faults/screens/youtube.dart';
import 'package:zesa_faults/widgets/call_center_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_custom_cards/flutter_custom_cards.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flip_card/flip_card.dart';

const Color backgroundColor = Color(0xFF2d2d39);

class CallCenter extends StatefulWidget {
  const CallCenter({super.key});

  @override
  _accountPageState createState() => _accountPageState();
}

class _accountPageState extends State<CallCenter>
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
    _slideAnimation =
        Tween<Offset>(begin: const Offset(-1, 0), end: const Offset(0, 0))
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
                      color: Colors.white38,
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
                            "CONNECT WITH US",
                            style: TextStyle(
                              fontSize: 16.0.sp,
                              color: const Color(0xFF295D99),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 3.0.h,
                        ),
                        SizedBox(height: 3.0.h),
                        Container(
                          height: 50.0.h,
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
                                color: Colors.white,
                                child: Container(
                                  margin: EdgeInsets.only(
                                      left: 4.0.w, right: 4.0.w),
                                  child: Column(
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Expanded(
                                            child: InkWell(
                                              onTap: () {
                                                _makePhoneCall(
                                                    'https://wa.me/$regwhatsappNumber?text=Meter Number: \n Physical Address: \n Telephone Number: \n Nature of Enquiry/Fault: \n Fault ref%23: \n');
                                              },
                                              child: Container(
                                                margin: EdgeInsets.only(
                                                    right: 2.0.w),
                                                padding: EdgeInsets.only(
                                                    left: 4.0.w),
                                                height: 15.0.h,
                                                width: 30.0.h,
                                                child: Column(
                                                  children: <Widget>[
                                                    CircleAvatar(
                                                      backgroundColor:
                                                          Colors.blue,
                                                      radius: 4.0.h,
                                                      child: const Icon(
                                                        FontAwesomeIcons
                                                            .whatsapp,
                                                        color: Colors.white,
                                                        size: 30,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 2.0.h,
                                                    ),
                                                    Text(
                                                      'Whatsapp',
                                                      style: TextStyle(
                                                          color: Colors.blue,
                                                          fontSize: 12.0.sp),
                                                    ),
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
                                                        type: PageTransitionType
                                                            .bottomToTop,
                                                        child: const Facebook()));
                                              },
                                              child: Container(
                                                margin: EdgeInsets.only(
                                                    left: 2.0.w),
                                                padding: EdgeInsets.only(
                                                    left: 4.0.w),
                                                height: 15.0.h,
                                                child: Column(
                                                  children: <Widget>[
                                                    CircleAvatar(
                                                      backgroundColor:
                                                          Colors.blue,
                                                      radius: 4.0.h,
                                                      child: const Icon(
                                                        FontAwesomeIcons
                                                            .facebook,
                                                        color: Colors.white,
                                                        size: 30,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 2.0.h,
                                                    ),
                                                    Text('Facebook',
                                                        style: TextStyle(
                                                            color: Colors.blue,
                                                            fontSize: 12.0.sp))
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
                                                        type: PageTransitionType
                                                            .bottomToTop,
                                                        child: const Youtube()));
                                              },
                                              child: Container(
                                                margin: EdgeInsets.only(
                                                    left: 2.0.w),
                                                padding: EdgeInsets.only(
                                                    left: 4.0.w),
                                                height: 15.0.h,
                                                child: Column(
                                                  children: <Widget>[
                                                    CircleAvatar(
                                                      backgroundColor:
                                                          Colors.blue,
                                                      radius: 4.0.h,
                                                      child: const Icon(
                                                        FontAwesomeIcons
                                                            .youtube,
                                                        color: Colors.white,
                                                        size: 30,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 2.0.h,
                                                    ),
                                                    Text('Youtube',
                                                        style: TextStyle(
                                                            color: Colors.blue,
                                                            fontSize: 12.0.sp))
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
                                                        type: PageTransitionType
                                                            .bottomToTop,
                                                        child: const Twitter()));
                                              },
                                              child: Container(
                                                margin: EdgeInsets.only(
                                                    right: 2.0.w),
                                                padding: EdgeInsets.only(
                                                    left: 4.0.w),
                                                height: 15.0.h,
                                                child: Column(
                                                  children: <Widget>[
                                                    CircleAvatar(
                                                      backgroundColor:
                                                          Colors.blue,
                                                      radius: 4.0.h,
                                                      child: Icon(
                                                        FontAwesomeIcons
                                                            .twitter,
                                                        color: Colors.white,
                                                        size: 5.0.h,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 2.0.h,
                                                    ),
                                                    Text(
                                                      'Twitter',
                                                      style: TextStyle(
                                                          color: Colors.blue,
                                                          fontSize: 12.0.sp),
                                                    ),
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
                                                        type: PageTransitionType
                                                            .bottomToTop,
                                                        child: const Instagram()));
                                              },
                                              child: Container(
                                                margin: EdgeInsets.only(
                                                    left: 2.0.w),
                                                padding: EdgeInsets.only(
                                                    left: 4.0.w),
                                                height: 15.0.h,
                                                width: 30.0.h,
                                                child: Column(
                                                  children: <Widget>[
                                                    CircleAvatar(
                                                      backgroundColor:
                                                          Colors.blue,
                                                      radius: 4.0.h,
                                                      child: const Icon(
                                                        FontAwesomeIcons
                                                            .instagram,
                                                        color: Colors.white,
                                                        size: 30,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 2.0.h,
                                                    ),
                                                    Text('Instagram',
                                                        style: TextStyle(
                                                            color: Colors.blue,
                                                            fontSize: 12.0.sp)),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: InkWell(
                                              onTap: () {
                                                showAnimatedDialog(
                                                  context: context,
                                                  barrierDismissible: true,
                                                  builder:
                                                      (BuildContext context) {
                                                    void dismissDialog() {
                                                      Navigator.of(context,
                                                              rootNavigator:
                                                                  true)
                                                          .pop();
                                                    }

                                                    return AlertDialog(
                                                      title: const Text(
                                                          "CALL CENTER"),
                                                      content: SizedBox(
                                                        height: 60.0.h,
                                                        width: double.maxFinite,
                                                        child: ListView(
                                                          shrinkWrap: true,
                                                          children: <Widget>[
                                                            Column(
                                                              children: <Widget>[
                                                                Row(
                                                                  children: <Widget>[
                                                                    Expanded(
                                                                      child:
                                                                          FlipCard(
                                                                        direction:
                                                                            FlipDirection.HORIZONTAL,
                                                                        // default
                                                                        front:
                                                                            Container(
                                                                          child:
                                                                              CustomCard(
                                                                            childPadding:
                                                                                15,
                                                                            child:
                                                                                Column(
                                                                              children: [
                                                                                const Text('Econet Toll Free'),
                                                                                Image.asset(
                                                                                  'assets/images/econet.png',
                                                                                  height: 40,
                                                                                ),
                                                                                const Text(
                                                                                  '704',
                                                                                  style: TextStyle(color: Colors.blue),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        back:
                                                                            InkWell(
                                                                          onTap:
                                                                              () {
                                                                            _makePhoneCall('tel:704');
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            child:
                                                                                CustomCard(
                                                                              childPadding: 15,
                                                                              child: const Column(
                                                                                children: [
                                                                                  Text('Service attracts call charges for non Econet users. Click to make the call'),
                                                                                  Icon(
                                                                                    Icons.phone,
                                                                                    color: Colors.blue,
                                                                                    size: 30,
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    )
                                                                  ],
                                                                ),
                                                                const SizedBox(
                                                                  height: 5,
                                                                ),
                                                                Row(
                                                                  children: <Widget>[
                                                                    Expanded(
                                                                      child:
                                                                          FlipCard(
                                                                        direction:
                                                                            FlipDirection.HORIZONTAL,
                                                                        // default
                                                                        front:
                                                                            Container(
                                                                          child:
                                                                              CustomCard(
                                                                            childPadding:
                                                                                15,
                                                                            child:
                                                                                Column(
                                                                              children: [
                                                                                const Text('Telone Toll Free'),
                                                                                Image.asset(
                                                                                  'assets/images/telone.jpg',
                                                                                  height: 40,
                                                                                ),
                                                                                const Text(
                                                                                  '704',
                                                                                  style: TextStyle(color: Colors.blue),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        back:
                                                                            InkWell(
                                                                          onTap:
                                                                              () {
                                                                            _makePhoneCall('tel:704');
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            child:
                                                                                CustomCard(
                                                                              childPadding: 15,
                                                                              child: const Column(
                                                                                children: [
                                                                                  Text('Service attracts call charges for non Netone users. Click to make the call'),
                                                                                  Icon(
                                                                                    Icons.phone,
                                                                                    color: Colors.blue,
                                                                                    size: 30,
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    )
                                                                  ],
                                                                ),
                                                                const SizedBox(
                                                                  height: 16,
                                                                ),
                                                                Row(
                                                                  children: <Widget>[
                                                                    Expanded(
                                                                      child:
                                                                          FlipCard(
                                                                        direction:
                                                                            FlipDirection.HORIZONTAL,
                                                                        // default
                                                                        front:
                                                                            Container(
                                                                          child:
                                                                              CustomCard(
                                                                            childPadding:
                                                                                20,
                                                                            child:
                                                                                const Column(
                                                                              children: [
                                                                                Text('Mobile Number'),
                                                                                Icon(
                                                                                  Icons.phone,
                                                                                  color: Colors.blue,
                                                                                  size: 30,
                                                                                ),
                                                                                Text(
                                                                                  '+263242704040',
                                                                                  style: TextStyle(color: Colors.blue),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        back:
                                                                            InkWell(
                                                                          onTap:
                                                                              () {
                                                                            _makePhoneCall('tel:263242704040');
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            child:
                                                                                CustomCard(
                                                                              childPadding: 20,
                                                                              child: const Column(
                                                                                children: [
                                                                                  Text('Service attracts call charges. Click to make the call'),
                                                                                  Icon(
                                                                                    Icons.phone,
                                                                                    color: Colors.blue,
                                                                                    size: 30,
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    )
                                                                  ],
                                                                ),
                                                                const SizedBox(
                                                                  height: 16,
                                                                ),
                                                                Row(
                                                                  children: <Widget>[
                                                                    Expanded(
                                                                      child:
                                                                          FlipCard(
                                                                        direction:
                                                                            FlipDirection.HORIZONTAL,
                                                                        // default
                                                                        front:
                                                                            Container(
                                                                          child:
                                                                              CustomCard(
                                                                            childPadding:
                                                                                20,
                                                                            child:
                                                                                const Column(
                                                                              children: [
                                                                                Text('Emergency Number'),
                                                                                Icon(
                                                                                  Icons.phone,
                                                                                  color: Colors.blue,
                                                                                  size: 30,
                                                                                ),
                                                                                Text(
                                                                                  '02422704236',
                                                                                  style: TextStyle(color: Colors.blue),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        back:
                                                                            InkWell(
                                                                          onTap:
                                                                              () {
                                                                            _makePhoneCall('tel:02422704236');
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            child:
                                                                                CustomCard(
                                                                              childPadding: 20,
                                                                              child: const Column(
                                                                                children: [
                                                                                  Text('Service attracts call charges. Click to make the call'),
                                                                                  Icon(
                                                                                    Icons.phone,
                                                                                    color: Colors.blue,
                                                                                    size: 30,
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    )
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      actions: [
                                                        ElevatedButton(
                                                          onPressed:
                                                              dismissDialog,
                                                          child: const Text(
                                                              "Close"),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                  animationType:
                                                      DialogTransitionType
                                                          .slideFromBottom,
                                                  curve: Curves.fastOutSlowIn,
                                                  duration: const Duration(
                                                      seconds: 1),
                                                );
                                              },
                                              child: Container(
                                                margin: EdgeInsets.only(
                                                    left: 2.0.w),
                                                padding: EdgeInsets.only(
                                                    left: 4.0.w),
                                                height: 15.0.h,
                                                child: Column(
                                                  children: <Widget>[
                                                    CircleAvatar(
                                                      backgroundColor:
                                                          Colors.blue,
                                                      radius: 4.0.h,
                                                      child: const Icon(
                                                        FontAwesomeIcons.phone,
                                                        color: Colors.white,
                                                        size: 30,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 2.0.h,
                                                    ),
                                                    Text('Call',
                                                        style: TextStyle(
                                                            color: Colors.blue,
                                                            fontSize: 12.0.sp)),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
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
                              ),
                            ],
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
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
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
          title: const Text('CALL CENTER'),
          backgroundColor: Colors.lightBlue,
        ),
        backgroundColor: const Color(0xff343442),
        bottomNavigationBar: const BottomCallCenterNavigation(),
        body: Stack(
          children: <Widget>[
            dashboard(context),
          ],
        ),
      ),
    );
  }
}
