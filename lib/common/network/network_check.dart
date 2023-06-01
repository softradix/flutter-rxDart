import 'dart:developer';
import 'dart:io';

// This class used to check the network connectivity
class NetworkCheck {
  Future<bool> hasNetwork() async {
    try {
      List<InternetAddress> result = await InternetAddress.lookup('google.com');
      log("Internet connection Status : $result");

      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (e) {
      log("Internet connection Error: $e");
      return false;
    }
  }
}
