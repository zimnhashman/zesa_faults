import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:zesa_faults/home.dart';
import 'package:flutter/material.dart';
import 'package:zesa_faults/widgets/bottom_navigation.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:page_transition/page_transition.dart';

class Twitter extends StatefulWidget {
  const Twitter({super.key});

  @override
  _TwitterState createState() => _TwitterState();
}

class _TwitterState extends State<Twitter> {
  bool isLoading = true;
  final controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..loadRequest(Uri.parse('https://twitter.com/ZetdcOfficial'));


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
            onPressed: () {
              Navigator.of(context, rootNavigator: true).pop();
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.fade,
                      child: const Home()));
            },
            width: 120,
            child: const Text(
              "OK",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
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
        title: const Text('X (Twitter)'),
      ),
      bottomNavigationBar: const BottomNavigation(),

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
