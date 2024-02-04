import 'dart:io' show Platform;
import 'report_fault.dart';

getPlatform() {
  if (Platform.isIOS) {
    // return ReportFault2();
   } else if (Platform.isAndroid) {
    return ReportFault();
  }
}
