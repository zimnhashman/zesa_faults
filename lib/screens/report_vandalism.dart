import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zesa_faults/constants/whatsapp_number_variables.dart';
import 'package:zesa_faults/screens/map_selection.dart';
import 'package:zesa_faults/widgets/bottom_navigation.dart';
import 'package:flutter/services.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:sizer/sizer.dart';
import 'package:zesa_faults/widgets/mytextfield.dart';
import 'package:zesa_faults/constants/color_constant.dart';

class ReportVandalismFault extends StatefulWidget {
  const ReportVandalismFault({super.key});

  @override
  _ReportVandalismFaultState createState() => _ReportVandalismFaultState();
}

class _ReportVandalismFaultState extends State<ReportVandalismFault> {

  final TextEditingController _descriptionController = TextEditingController();
  File? _image;
  LatLng? _selectedLocation;

  @override
  void dispose() {
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: const Text('Report Vandalism', style: mAppBarText,),
        iconTheme: const IconThemeData(
            color: Colors.white
        ),
      ),
      bottomNavigationBar: const BottomNavigation(),
      // Body
      body: Container(
        decoration: const BoxDecoration(
          color: Color(0xFF295D99),
        ),
        child: Stack(
          children: [
            //background widget
            Container(
              decoration: BoxDecoration(
                //   color: const Color(0xFF295D99),
                  image: DecorationImage(
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.4), BlendMode.dstATop),
                      image: const AssetImage('assets/images/back.jpg'),
                      fit: BoxFit.fitWidth,
                      alignment: Alignment.topCenter)),
            ),

            //selected widget
            Positioned.fill(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child:  Container(
                  width: MediaQuery.of(context).size.width,
                  height: 120.0.h,
                  margin: EdgeInsets.only(top: 15.0.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blue,
                  ),
                  child: Padding(
                      padding: const EdgeInsets.all(23),
                      child: SingleChildScrollView(
                          physics: const ClampingScrollPhysics(),
                          child: Column(
                            children: [
                              const Center(
                                  child: Text(
                                    'Report Vandalism',
                                    style: TextStyle(
                                        fontSize: 27.0,
                                        color: Colors.white),
                                  )),
                              const SizedBox(height: 10),

                              // fault description
                              MyTextField(
                                controller: _descriptionController,
                                hint: "Vandalism Description",
                                isMultiline: true,
                                maxLines: 4,
                                icon: Icons.warning_amber_rounded,
                                validation: (val) {
                                  if (val.isEmpty) {
                                    return "";
                                  }
                                  return null;
                                },
                              ),

                              // Image picker button
                              ElevatedButton(
                                onPressed: () async {
                                  final pickedImage = await ImagePicker().pickImage(
                                    source: ImageSource.camera,
                                  );

                                  if (pickedImage != null) {
                                    setState(() {
                                      _image = File(pickedImage.path);
                                    });
                                  }
                                },
                                child: const Text('Take Photo'),
                              ),

                              // Display selected image
                              _image != null
                                  ? Image.file(_image!)
                                  : Container(
                                height: 5.0.h,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                  BorderRadius.circular(50),
                                ),
                              ),

                              ElevatedButton(
                                onPressed: () {
                                  _selectLocationFromMap();
                                },
                                child: const Text('Select Location on Map'),
                              ),

                              // Display selected location
                              _selectedLocation != null
                                  ? Text(
                                  'Selected Location: ${_selectedLocation!.latitude}, ${_selectedLocation!.longitude}')
                                  : Container(), // Placeholder for no location// Placeholder for no image


                              // submit button
                              GestureDetector(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.blueGrey,
                                      borderRadius:
                                      BorderRadius.circular(50),
                                    ),
                                    child: const Padding(
                                      padding:
                                      EdgeInsets.all(8.0),
                                      child: Text(
                                        'Submit Fault',
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
                                    if (_descriptionController
                                        .text.isEmpty ) {
                                      Alert(
                                        context: context,
                                        type: AlertType.error,
                                        title:
                                        "Make sure the description field is not empty",
                                        desc: "",
                                        buttons: [
                                          DialogButton(
                                            onPressed: () {
                                              Navigator.of(context,
                                                  rootNavigator:
                                                  true)
                                                  .pop();
                                            },
                                            width: 120,
                                            child: const Text(
                                              "OK",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20),
                                            ),
                                          )
                                        ],
                                      ).show();
                                    } else {
                                      _shareToWhatsApp();
                                      // _makePhoneCall('https://wa.me/$regwhatsappNumber?text=Description: ${_descriptionController.text}');
                                    }
                                  }),
                            ],
                          ))),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to open the map for location selection
  void _selectLocationFromMap() async {
    // Open a new screen or dialog where users can select the location on the map
    LatLng? selectedLocation = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const MapSelectionScreen(),
      ),
    );

    // Update the selected location
    if (selectedLocation != null) {
      setState(() {
        _selectedLocation = selectedLocation;
      });
    }
  }

  void _shareToWhatsApp() async {
    try {
      // Create a message with description and image path
      String message = "Description: ${_descriptionController.text}";

      // Include selected location if available
      if (_selectedLocation != null) {
        message += "Location: ${_selectedLocation!.latitude}, ${_selectedLocation!.longitude}\n";
      }

      // Launch WhatsApp with the pre-filled message
      String url = "https://wa.me/?text=${Uri.encodeComponent(message)}";
      if (_image != null) {
        // If an image is selected, add it to the message
        url += "&media=${Uri.encodeComponent(_image!.path)}";
      }

      // Open WhatsApp
      await launchUrl(Uri.parse(url));
    } catch (error) {
      print('could not launch url');
    }
  }

  // void _makePhoneCall(String url) async {
  //   if (await canLaunchUrl(Uri.parse(url))) {
  //     await launchUrl(Uri.parse(url));
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }
}
