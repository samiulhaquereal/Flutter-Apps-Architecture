import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class DrawerControllere extends GetxController{

  late PackageInfo packageInfo;
  RxString version = ''.obs;
  RxString packegename = ''.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    version.value = packageInfo.version;
    packegename.value = packageInfo.packageName;
  }
  void openPlayStoreDevAccount() async {
    const playStoreDevAccountUrl = 'https://play.google.com/store/apps/dev?id=5551015295329500291';
    if (await canLaunch(playStoreDevAccountUrl)) {
      await launch(playStoreDevAccountUrl);
    } else {
      throw 'Could not launch $playStoreDevAccountUrl';
    }
  }
}