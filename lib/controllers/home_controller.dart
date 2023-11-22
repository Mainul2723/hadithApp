import 'package:get/get.dart';

class HomeController extends GetxController {
  // Add any necessary logic or variables here

  // Example function for navigation
  void goToChapterScreen(String selectedBookId) {
    // Your navigation logic here
    Get.toNamed('/chapter', arguments: selectedBookId);
  }

  RxString stringValue = ''.obs;
  RxString stringValue1 = ''.obs;
  RxString bookvalue = ''.obs;
  RxString hadis = ''.obs;

  // Function to update the string value
  void updateStringValue(String newValue) {
    stringValue.value = newValue;
    //stringValue1.value = newValue;
  }

  void updateStringValue1(String newValue) {
    stringValue1.value = newValue;
  }

  void bookNumber(String newValue) {
    bookvalue.value = newValue;
  }

  void hadisNumber(String newValue) {
    hadis.value = newValue;
  }
}
