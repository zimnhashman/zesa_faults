import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:page_transition/page_transition.dart';
import 'package:zesa_faults/home.dart';
import 'package:zesa_faults/widgets/bottom_navigation.dart';
import 'package:webview_flutter/webview_flutter.dart';


class Map extends StatefulWidget {
  @override
  WebViewExampleState createState() => WebViewExampleState();
}

class WebViewExampleState extends State<Map> {
  GoogleMapController? mapController;

  bool isLoading = true;
  final LatLng _center = const  LatLng(38.9647,35.2233);

  List<Marker> _markers = <Marker>[];

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  final controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..loadRequest(Uri.parse('https://www.google.com/maps/place/Megawatt+House/@-17.8272991,31.0425089,17z/data=!3m1!4b1!4m6!3m5!1s0x1931a5581d821351:0xbcfa02bc769c73e8!8m2!3d-17.8272991!4d31.0450892!16s%2Fg%2F11grv2yp4g?entry=ttu'));

  @override
  void initState() {
    super.initState();
    _markers.add(
        const Marker(
            markerId: MarkerId('SomeId'),
            position: LatLng(38.123,35.123),
            infoWindow: InfoWindow(
                title: 'The title of the marker'
            )
        )
    );
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
                      child: Home()));
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
        title: const Text('ZETDC Map'),
      ),
      bottomNavigationBar: BottomNavigation(),
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
