import 'dart:io' show Platform;
import 'package:zesa_faults/screens/report_fault_selection.dart';

getPlatform() {
  if (Platform.isIOS) {
    // return ReportFault2();
   } else if (Platform.isAndroid) {
    return  ReportFault();
  }
}
