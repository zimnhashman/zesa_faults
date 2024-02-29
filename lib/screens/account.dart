import 'package:zesa_faults/constants/whatsapp_number_variables.dart';
import 'package:zesa_faults/screens/my_account.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_custom_cards/flutter_custom_cards.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:page_transition/page_transition.dart';

const Color backgroundColor = Color(0xFF2d2d39);

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

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<Account>
    with SingleTickerProviderStateMixin {
  bool isCollapsed = true;
  double? screenWidth, screenHeight;
  final Duration duration = const Duration(milliseconds: 200);
  AnimationController? _controller;
  Animation<double>? _scaleAnimation;
  late Animation<double> _menuScaleAnimation;
  late Animation<Offset> _slideAnimation;

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
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
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
                            "CHECK YOUR ZETDC ACCOUNT ONLINE",
                            style: TextStyle(
                              fontSize: 10.0.sp,
                              color: const Color(0xFF295D99),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: 1.0.h),
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
                              ListView(
                                children: <Widget>[
                                  CustomCard(
                                    color: Colors.blue,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          left: 3.0.h, right: 3.0.h), child: Column(
                                      children: [

                                        Text(
                                          'TO REGISTER YOUR ACCOUNT',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16.0.sp),
                                        ),
                                        SizedBox(height: 3.0.h),
                                        Text(
                                          'Send your account holder`s name, surname, ID number, date of birth, account number, property number, cell number',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14.0.sp),
                                        ),
                                        SizedBox(height: 3.0.h),
                                        Text(
                                          'To register email contactcentre@zetdc.co.zw or WhatsApp +263715519387/9, +263719219977 or use any of our social media platforms',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14.0.sp),
                                        ),
                                        SizedBox(height: 3.0.h),
                                        Text(
                                          'You will get a One Time Pin Code to enable you to access your account.',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14.0.sp),
                                        ),
                                        SizedBox(height: 3.0.h),

                                      ],
                                    ),),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.lightBlue,
                    ),
                    padding: const EdgeInsets.only(bottom: 40),
                    child: ListView(
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      children: <Widget>[

                        SizedBox(height: 3.0.h),
                        Padding(
                          padding: EdgeInsets.only(
                              top: 2.0.h, left: 3.0.h, right: 3.0.h),
                          child: FilledButton.icon(
                            style: ButtonStyle(
                              padding: MaterialStateProperty.resolveWith((states) => const EdgeInsets.symmetric(
                                vertical: 10.0,
                                horizontal: 20.0,
                              ),),
                              backgroundColor: MaterialStateColor.resolveWith((states) => Colors.green),
                              // shape: MaterialStateProperty.resolveWith((states) => BorderRadius.circular(30))
                            ),

                          onPressed: () {
                            _makePhoneCall('https://wa.me/$regwhatsappNumber?text=Account Holder`s Name: \n Account Holder`s Surname: \n ID Number: \n Date Of Birth: \n Account Number: \n Property Number: \n Cell Number: \n Email Address: \n');
                          },

                          icon: const Icon(
                            FontAwesomeIcons.whatsapp,
                            color: Colors.white,
                          ),
                          label: const Text(
                            'Register Via Whatsapp',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                    ),

                        SizedBox(height: 3.0.h),
                        Padding(
                          padding: EdgeInsets.only(
                              top: 2.0.h, left: 3.0.h, right: 3.0.h),
                          child: MaterialButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.fade,
                                      child: const MyAccount()));
                            },
                            color: Colors.white,
                            elevation: 0,
                            minWidth: 400,
                            height: 50,
                            textColor: const Color(0xFF295D99),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            //since this is only a UI app
                            child: const Text(
                              'PROCEED TO LOGIN',
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'SFUIDisplay',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
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
          title: const Text('MY ACCOUNT'),
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
