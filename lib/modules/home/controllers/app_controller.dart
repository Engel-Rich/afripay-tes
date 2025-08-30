import 'package:afrypay/modules/auth/datas/users.dart';
import 'package:get/get.dart';

class ApppController extends GetxController {
  Users? users;

  bool nativeSoldVisible = true;
  double balanceNative = 0.0;

  void changeNativeSoldVisibility() {
    nativeSoldVisible = !nativeSoldVisible;
    update();
  }
}
