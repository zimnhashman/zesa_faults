import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:page_transition/page_transition.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:zesa_faults/screens/report_vandalism.dart';
import 'package:zesa_faults/widgets/bottom_navigation.dart';

class MapSelectionScreen extends StatefulWidget {
  const MapSelectionScreen({super.key});

  @override
  State<MapSelectionScreen> createState() => _MapSelectionScreenState();
}

class _MapSelectionScreenState extends State<MapSelectionScreen> {
  GoogleMapController? mapController;

  bool isLoading = true;
  late LatLng _selectedLocation = LatLng(0.0, 0.0);

  final List<Marker> _markers = <Marker>[];

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  void initState() {
    super.initState();
    _markers.add(
      Marker(
        markerId: const MarkerId('Location'),
        position: _selectedLocation,
        infoWindow: const InfoWindow(
          title: 'Vandalism Location',
        ),
      ),
    );
    checkInternet();
    _getCurrentLocation();
  }

  // Method to get the device's current location using GeoLocator
  Future<void> _getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      setState(() {
        _selectedLocation = LatLng(position.latitude, position.longitude);
      });

      _updateMarkerLocation();
    } catch (e) {
      print('Error getting current location: $e');
    }
  }

  void _updateMarkerLocation() {
    _markers.clear(); // Clear existing markers
    _markers.add(
      Marker(
        markerId: const MarkerId('Location'),
        position: _selectedLocation,
        infoWindow: const InfoWindow(
          title: 'Vandalism Location',
        ),
      ),
    );
  }

  void _confirmLocation() {
    Navigator.pop(context, _selectedLocation);
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
                  child: const ReportVandalismFault(),
                ),
              );
            },
            width: 120,
            child: const Text(
              "OK",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ],
      ).show();
      print('No internet :( Reason:');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vandalism Location'),
      ),
      bottomNavigationBar: const BottomNavigation(),
      body: Stack(
        children: <Widget>[
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _selectedLocation,
              zoom: 15.0,
            ),
            markers: Set<Marker>.of(_markers),
          ),
          if (isLoading)
            const Center(
              child: CircularProgressIndicator(),
            ),
          Align(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Confirm Location',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontFamily: 'SFUIDisplay',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              onTap: () {
                _confirmLocation();
              },
            ),
          ),
        ],
      ),
    );
  }
}
