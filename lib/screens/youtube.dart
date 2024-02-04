import 'dart:io';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:zesa_faults/home.dart';
import 'package:flutter/material.dart';
import 'package:zesa_faults/widgets/bottom_navigation.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:page_transition/page_transition.dart';

class Youtube extends StatefulWidget {
  @override
  _YoutubeState createState() => _YoutubeState();
}

class _YoutubeState extends State<Youtube> {
  bool isLoading = true;
  final controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..loadRequest(Uri.parse('https://www.youtube.com/channel/UCJ82YaWr43krjhc96TK3ROQ'));


  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    checkInternet();

  }

  void checkInternet() async {
    bool result = await InternetConnection().hasInternetAccess;
    if (result == true) {
    } else {
      Alert(
        context: context,
        type: AlertType.error,
        title: "Please check your internet connectivity",
        desc: "",
        buttons: [
          DialogButton(
            child: const Text(
              "OK",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () {
              Navigator.of(context, rootNavigator: true).pop();
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.fade,
                      child: const Home()));
            },
            width: 120,
          )
        ],
      ).show();
      print('No internet :( Reason:');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Youtube'),
      ),
      bottomNavigationBar: BottomNavigation(),

      // Body
      body: Stack(
        children: <Widget>[
          WebViewWidget(
            controller: controller,
          ),
        ],
      ),
    );
  }
}
