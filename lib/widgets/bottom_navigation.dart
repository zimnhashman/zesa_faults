import 'package:zesa_faults/home.dart';
import 'package:zesa_faults/screens/instagram.dart';
import 'package:zesa_faults/screens/twitter.dart';
import 'package:zesa_faults/screens/youtube.dart';
import 'package:flutter/material.dart';
import 'package:zesa_faults/constants/color_constant.dart';
import 'package:zesa_faults/constants/whatsapp_number_variables.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zesa_faults/screens/facebook.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter_custom_cards/flutter_custom_cards.dart';


class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;

  var bottomTextStyle =
      GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w500);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 0) {
//        _makePhoneCall('tel:0779525756');
        Navigator.push(
            context,
            PageTransition(
                type: PageTransitionType.bottomToTop, child: Facebook()));
      }
//      if (_selectedIndex == 1) {
////        _makePhoneCall('tel:0779525756');
//        Navigator.push(
//            context,
//            PageTransition(
//                type: PageTransitionType.bottomToTop, child: Instagram()));
//      }
      if (_selectedIndex == 1) {
//        _makePhoneCall('tel:0779525756');
        Navigator.push(
            context,
            PageTransition(
                type: PageTransitionType.bottomToTop, child: Twitter()));
      }
      if (_selectedIndex == 2) {
        Navigator.push(
            context,
            PageTransition(
                type: PageTransitionType.bottomToTop, child: Home()));
      }
//      if (_selectedIndex == 4) {
//        Navigator.push(
//            context,
//            PageTransition(
//                type: PageTransitionType.bottomToTop, child: Youtube()));
//      }
      if (_selectedIndex == 3) {
        _makePhoneCall('https://wa.me/'+whatsappNumber);
      }
      if (_selectedIndex == 4) {
        showAnimatedDialog(
          context: context,
          barrierDismissible: true,
          builder: (BuildContext context) {
            void _dismissDialog(){
              Navigator.of(context, rootNavigator: true).pop();
            }
            return AlertDialog(
              title: const Text("CALL CENTER"),
              content: SizedBox(
                height: 400,
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: FlipCard(
                            direction: FlipDirection.HORIZONTAL, // default
                            front: Container(
                              child: CustomCard(
                                  childPadding: 15,
                                  child: Column(
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
                            back: InkWell(
                              onTap: () {
                                _makePhoneCall('tel:704');
                              },
                              child: Container(
                                child: CustomCard(
                                    childPadding: 15,
                                    child: const Column(
                                      children: [
                                        Text(
                                            'Service attracts call charges for non Econet users. Click to make the call'),
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
                          child: FlipCard(
                            direction: FlipDirection.HORIZONTAL, // default
                            front: Container(
                              child: CustomCard(
                                  childPadding: 15,
                                  child: Column(
                                    children: [
                                      const Text('Netone Toll Free'),
                                      Image.asset(
                                        'assets/images/netone.png',
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
                            back: InkWell(
                              onTap: () {
                                _makePhoneCall('tel:704');
                              },
                              child: Container(
                                child: CustomCard(
                                    childPadding: 15,
                                    child: const Column(
                                      children: [
                                        Text(
                                            'Service attracts call charges for non Netone users. Click to make the call'),
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
                          child: FlipCard(
                            direction: FlipDirection.HORIZONTAL, // default
                            front: Container(
                              child: CustomCard(
                                childPadding: 20,
                                  child: const Column(
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
                            back: InkWell(
                              onTap: () {
                                _makePhoneCall('tel:263242704040');
                              },
                              child: Container(
                                child: CustomCard(
                                    childPadding: 20,
                                    child: const Column(
                                      children: [
                                        Text(
                                            'Service attracts call charges. Click to make the call'),
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
              ),
              actions: [
                TextButton(
                  child: const Text("Close"),
                  onPressed: _dismissDialog,
                ),
              ],
            );
          },
          animationType: DialogTransitionType.slideFromBottom,
          curve: Curves.fastOutSlowIn,
          duration: const Duration(seconds: 1),
        );
      }
//      if (_selectedIndex == 2) {
//        _makePhoneCall('https://wa.me/263779525756');
//      }
    });
  }

  void _makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: mFillColor,
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 15,
              offset: const Offset(0, 5))
        ],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: _selectedIndex == 0
                ? const Icon(FontAwesomeIcons.facebook,
                    color: Colors.blue, size: 25)
                : const Icon(FontAwesomeIcons.facebook,
                    color: Colors.blue, size: 25),
            label: 'Facebook',
          ),
//          BottomNavigationBarItem(
//            icon: _selectedIndex == 1
//                ? new Icon(FontAwesomeIcons.instagram,
//                    color: Colors.blue, size: 25)
//                : new Icon(FontAwesomeIcons.instagram,
//                    color: Colors.blue, size: 25),
//            label: 'Instagram',
//          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 2
                ? const Icon(FontAwesomeIcons.twitter,
                    color: Colors.blue, size: 25)
                : const Icon(FontAwesomeIcons.twitter,
                    color: Colors.blue, size: 25),
            label: 'Twitter',
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 3
                ? const Icon(FontAwesomeIcons.house, color: Colors.blue, size: 35)
                : const Icon(FontAwesomeIcons.house, color: Colors.blue, size: 35),
            label: 'Home',
          ),
//          BottomNavigationBarItem(
//            icon: _selectedIndex == 3
//                ? new Icon(FontAwesomeIcons.youtube,
//                    color: Colors.blue, size: 25)
//                : new Icon(FontAwesomeIcons.youtube,
//                    color: Colors.blue, size: 25),
//            label: 'YouTube',
//          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 7
                ? const Icon(FontAwesomeIcons.whatsapp,
                    color: Colors.blue, size: 25)
                : const Icon(FontAwesomeIcons.whatsapp,
                    color: Colors.blue, size: 25),
            label: 'WhatsApp'
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 7
                ? const Icon(FontAwesomeIcons.phone, color: Colors.blue, size: 25)
                : const Icon(FontAwesomeIcons.phone,
                    color: Colors.blue, size: 25),
            label: 'Phone',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: mBlueColor,
        unselectedItemColor: mSubtitleColor,
        onTap: _onItemTapped,
        backgroundColor: Colors.transparent,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 12,
        showUnselectedLabels: true,
        elevation: 0,
      ),
    );
  }
}
