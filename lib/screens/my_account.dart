import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:page_transition/page_transition.dart';
import 'package:zesa_faults/constants/color_constant.dart';
import 'package:zesa_faults/screens/account.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({super.key});

  @override
  WebViewExampleState createState() => WebViewExampleState();
}

class WebViewExampleState extends State<MyAccount> {
  bool isLoading = true;

  final controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..loadRequest(Uri.parse('https://selfservice.zetdc.co.zw/'));

  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    checkInternet();
  }

  void checkInternet() async {
    bool result = await InternetConnection().hasInternetAccess;
    if (result == true) {
      print('internet');
    } else {
      print('check whats happening');
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
                      child: const Account()));
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
        title: const Text('My Account', style: mAppBarText,),
        backgroundColor: Colors.lightBlue,
        iconTheme: IconThemeData(
            color: Colors.white
        ),
      ),
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
