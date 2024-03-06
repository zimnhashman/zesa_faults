import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zesa_faults/constants/whatsapp_number_variables.dart';
import 'package:zesa_faults/widgets/bottom_navigation.dart';
import 'package:flutter/services.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:sizer/sizer.dart';
import 'package:zesa_faults/widgets/mytextfield.dart';
import 'package:zesa_faults/constants/color_constant.dart';

class ReportOtherFault extends StatefulWidget {
  const ReportOtherFault({super.key});

  @override
  _ReportOtherFaultState createState() => _ReportOtherFaultState();
}

class _ReportOtherFaultState extends State<ReportOtherFault> {
  static const platform =
      MethodChannel("https://zetdc.co.zw/trackcomplaint");

  String? validateMobile(String value) {
    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = RegExp(pattern);

    if (value.isEmpty) {
      return 'Mobile number is required';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter a valid mobile number';
    }
    return null;
  }

  final TextEditingController _meterNumberController = TextEditingController();
  final TextEditingController _physicalAddressController = TextEditingController();
  final TextEditingController _telephoneController = TextEditingController();
  final TextEditingController _enquiryController = TextEditingController();
  final TextEditingController _faultRefController = TextEditingController();

  bool isSelected = false;

  @override
  void dispose() {
    _meterNumberController.dispose();
    _physicalAddressController.dispose();
    _telephoneController.dispose();
    _enquiryController.dispose();
    _faultRefController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: const Text('Report Other Fault', style: mAppBarText,),
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
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isSelected = true;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: isSelected
                      ? Container(
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
                                        'Report A Fault',
                                        style: TextStyle(
                                            fontSize: 27.0,
                                            color: Colors.white),
                                      )),
                                      const SizedBox(height: 10),

                                      // meter number
                                      MyTextField(
                                        controller: _meterNumberController,
                                        hint: "Meter Number",
                                        icon: Icons.phone_android_rounded,
                                        validation: (val) {
                                          if (val.isEmpty) {
                                            return "Meter Number is required";
                                          }
                                          return null;
                                        },
                                      ),

                                      // physical address
                                      MyTextField(
                                        controller: _physicalAddressController,
                                        hint: "Physical Address",
                                        icon: Icons.home,
                                        validation: (val) {
                                          if (val.isEmpty) {
                                            return "Physical Address is required";
                                          }
                                          return null;
                                        },
                                      ),

                                      // telephone number
                                      MyTextField(
                                        controller: _telephoneController,
                                        hint: "Telephone Number",
                                        isEmail: true,
                                        icon: Icons.phone,
                                        validation: (val) {
                                          return validateMobile(val);
                                        },
                                      ),

                                      // fault description
                                      MyTextField(
                                        controller: _enquiryController,
                                        hint: "Fault Description",
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

                                      // fault ref
                                      MyTextField(
                                        controller: _faultRefController,
                                        hint: "Fault Ref #",
                                        icon: Icons.note,
                                        validation: (val) {
                                          if (val.isEmpty) {
                                            return "";
                                          }
                                          return null;
                                        },
                                      ),

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
                                            if (_meterNumberController
                                                    .text.isEmpty ||
                                                _physicalAddressController
                                                    .text.isEmpty ||
                                                _telephoneController
                                                    .text.isEmpty) {
                                              Alert(
                                                context: context,
                                                type: AlertType.error,
                                                title:
                                                    "Make sure the fields are not empty",
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
                                              _makePhoneCall('https://wa.me/$regwhatsappNumber?text=Meter Number: ${_meterNumberController.text}\nPhysical Address: ${_physicalAddressController
                                                      .text}\nTelephone Number: ${_telephoneController.text}\nFault: ${_enquiryController.text}\nFault ref%23: ${_faultRefController.text}');
                                            }
                                          }),
                                    ],
                                  ))),
                        )
                      : Container(
                          width: MediaQuery.of(context).size.width,
                          height: 70.0.h,
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
                                        'Report A Fault',
                                        style: TextStyle(
                                            fontSize: 27.0,
                                            color: Colors.white),
                                      )),
                                      const SizedBox(height: 10),

                                      // meter number
                                      MyTextField(
                                        controller: _meterNumberController,
                                        hint: "Meter Number",
                                        icon: Icons.phone_android_rounded,
                                        validation: (val) {
                                          if (val.isEmpty) {
                                            return "Meter Number is required";
                                          }
                                          return null;
                                        },
                                      ),

                                      // physical address
                                      MyTextField(
                                        controller: _physicalAddressController,
                                        hint: "Physical Address",
                                        icon: Icons.home,
                                        validation: (val) {
                                          if (val.isEmpty) {
                                            return "Physical Address is required";
                                          }
                                          return null;
                                        },
                                      ),

                                      // telephone number
                                      MyTextField(
                                        controller: _telephoneController,
                                        hint: "Telephone Number",
                                        isEmail: true,
                                        icon: Icons.phone,
                                        validation: (val) {
                                          return validateMobile(val);
                                        },
                                      ),

                                      // fault description
                                      MyTextField(
                                        controller: _enquiryController,
                                        hint: "Fault Description",
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

                                      // fault ref
                                      MyTextField(
                                        controller: _faultRefController,
                                        hint: "Fault Ref #",
                                        icon: Icons.note,
                                        validation: (val) {
                                          if (val.isEmpty) {
                                            return "";
                                          }
                                          return null;
                                        },
                                      ),

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
                                            if (_meterNumberController
                                                    .text.isEmpty ||
                                                _physicalAddressController
                                                    .text.isEmpty ||
                                                _telephoneController
                                                    .text.isEmpty) {
                                              Alert(
                                                context: context,
                                                type: AlertType.error,
                                                title:
                                                    "Make sure the fields are not empty",
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
                                                    child:  const Text(
                                                      "OK",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 20),
                                                    ),
                                                  )
                                                ],
                                              ).show();
                                            } else {
                                              _makePhoneCall('https://wa.me/$regwhatsappNumber?text=Meter Number: ${_meterNumberController.text}\nPhysical Address: ${_physicalAddressController
                                                      .text}\nTelephone Number: ${_telephoneController.text}\nFault: ${_enquiryController.text}\nFault ref%23: ${_faultRefController.text}');
                                            }
                                          }),
                                    ],
                                  ))),
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _makePhoneCall(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }
}
