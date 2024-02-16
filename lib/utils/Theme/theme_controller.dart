import 'package:get/get.dart';

class ThemeController extends GetxController{

  RxBool isDarkModeClick = false.obs;


  @override
  void onInit() {
    super.onInit();
    isDarkModeClick.value =  Get.isDarkMode ? true : false;
  }

}