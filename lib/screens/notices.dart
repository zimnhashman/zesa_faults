import 'package:flutter/material.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:page_transition/page_transition.dart';
import 'package:zesa_faults/home.dart';

class Notices extends StatefulWidget {
  const Notices({super.key});

  @override
  WebViewExampleState createState() => WebViewExampleState();
}

class WebViewExampleState extends State<Notices> {
  bool isLoading = true;

  final controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..loadRequest(Uri.parse('https://www.zetdc.co.zw/notices/'));


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
        title: const Text('Notices'),
      ),
      body:Stack(
        children: <Widget>[
          WebViewWidget(
            controller: controller,
          ),
        ],
      ),
    );
  }
}
