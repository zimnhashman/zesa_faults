import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:whatsapp_share/whatsapp_share.dart';
import 'package:zesa_faults/constants/whatsapp_number_variables.dart';
import 'package:zesa_faults/widgets/bottom_navigation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/services.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:sizer/sizer.dart';
import 'package:image_picker_platform_interface/image_picker_platform_interface.dart';


class ReportFault extends StatefulWidget {
  @override
  _ReportFaultState createState() => _ReportFaultState();
}

class _ReportFaultState extends State<ReportFault> {
  static const platform = const MethodChannel("https://zetdc.co.zw/trackcomplaint");

  TextEditingController textController = TextEditingController();

  String text = '';
  List<String> imagePaths = [];

  File? _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        SendImageAndText();
      } else {
        print('No image selected.');
      }
    });
  }

  Future<void> isInstalled() async {
    final val = await WhatsappShare.isInstalled(
        package: Package.businessWhatsapp
    );
    print('Whatsapp Business is installed: $val');

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fault Management'),
      ),
      bottomNavigationBar: BottomNavigation(),

      // Body
      body: Container(
        decoration: const BoxDecoration(
          color: Color(0xFF295D99),
        ),
        child: Stack(
          children: <Widget>[
            Container(
              child: _image == null
                  ? Container(
                decoration: BoxDecoration(
               //   color: const Color(0xFF295D99),
                    image: DecorationImage(
                        colorFilter: new ColorFilter.mode(
                            Colors.black.withOpacity(0.4), BlendMode.dstATop),
                        image: const AssetImage('assets/images/back.jpg'),
                        fit: BoxFit.fitWidth,
                        alignment: Alignment.topCenter)),
              )
                  : Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: new FileImage(_image!),
                        fit: BoxFit.fitWidth,
                        alignment: Alignment.topCenter)),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 70.0.h,
              margin: EdgeInsets.only(top: 15.0.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.blue,
              ),
              child: Padding(
                padding: const EdgeInsets.all(23),
                child: ListView(
                  physics: const ClampingScrollPhysics(),
                  children: <Widget>[
                    const Center(
                        child: Text(
                          'Report A Fault',
                          style: TextStyle(fontSize: 32.0, color: Colors.white),
                        )),
                    Container(
                      padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                      child: Container(
                        color: const Color(0xfff5f5f5),
                        child: TextField(
                          style: const TextStyle(
                              color: Colors.black, fontFamily: 'SFUIDisplay'),
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Type a description of the fault and attach a picture',
//                              labelText: 'Type a description of the fault and attach \n a picture',
                              labelStyle: TextStyle(fontSize: 15),
                              floatingLabelBehavior: FloatingLabelBehavior.auto
                          ),
                          keyboardType: TextInputType.multiline,
                          maxLines: 3,
                          onChanged: (String value) => setState(() {
                            text = value;
                            print('value');
                          }),

                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    FloatingActionButton(
                      onPressed: getImage,
                      tooltip: 'Pick Image',
                      child: const Icon(Icons.add_a_photo),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: MaterialButton(
                        onPressed: ()  {

                          if(_image != null && text != null){
                            print('image test');
                            print(_image!.path.toString());
                            // SendImageAndText();
                             WhatsappShare.shareFile(
                                text: text,
                                phone: whatsappNumber,
                                filePath: [_image!.path.toString()],
                            );
                          }
                          else if(text != "" && _image == null) {
                            print('image null');
                            WhatsappShare.share(
                                text: text,
                                phone: whatsappNumber,
                              );
                          } else {
                            print('all empty');
                            Alert(
                              context: context,
                              type: AlertType.error,
                              title: "Make sure the fields are not empty",
                              desc: "",
                              buttons: [
                                DialogButton(
                                  child: const Text(
                                    "OK",
                                    style: TextStyle(color: Colors.white, fontSize: 20),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context, rootNavigator: true).pop();
                                  },
                                  width: 120,
                                )
                              ],
                            ).show();
                          }
                        },
                        //since this is only a UI app
                        child: const Text(
                          'Submit Fault',
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'SFUIDisplay',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        color: Colors.white,
                        elevation: 0,
                        minWidth: 400,
                        height: 50,
                        textColor: const Color(0xFF295D99),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void SendImageAndText() async {
    var sendMap = <String, dynamic>{
      'val1': text,
      'val2': _image!.path.toString(),
      'val3': whatsappNumber,

    };
    String? value;
    try {
      text="";
      _image= null;

      value = await platform.invokeMethod("SendImage", sendMap);
    } catch (e) {
      print(e);
    }
    print(value);
    }


}
