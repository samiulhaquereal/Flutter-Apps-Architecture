import 'dart:convert';
import 'dart:io';
import 'package:admissionhelpline/Utils/Push%20Notification/push_notification_screen.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

Future<void> handleBackGroundMessage(RemoteMessage message) async{
  FirebaseAPI.handleMessage(message);
}

class FirebaseAPI {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotification() async {
    await _firebaseMessaging.requestPermission();
    //final fCMToken = await _firebaseMessaging.getToken();
    //print(fCMToken);
    initPushNotification();

  }

  Future initPushNotification() async{
    await _firebaseMessaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    FirebaseMessaging.instance.getInitialMessage().then((value) => handleMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
    FirebaseMessaging.onBackgroundMessage(handleBackGroundMessage);
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      showNotification(message);
    });
    initialize();
  }

  static void handleMessage(RemoteMessage? message){
    if(message == null) return;
    Get.to(const DisplayNotificationScreen(),arguments: message);
  }



//----------------------------------------------------------------------


  final _androidChannel = const AndroidNotificationChannel(
      'high_importance_channel',
      'High Importance Notifications',
      description: 'This channel is used for important notification',
      importance: Importance.defaultImportance
  );

  final FlutterLocalNotificationsPlugin _notiPlugin = FlutterLocalNotificationsPlugin();


  void initialize() async {
    const InitializationSettings initialSettings = InitializationSettings(
      android: AndroidInitializationSettings(
        '@mipmap/ic_launcher',
      ),
    );
    await _notiPlugin.initialize(
      initialSettings,
      onDidReceiveNotificationResponse: (NotificationResponse details) {
        if (details.payload != null) {
          final message =RemoteMessage.fromMap(jsonDecode(details.payload!));
          handleMessage(message);
        }
      },
    );
    final platform = _notiPlugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();
    await platform?.createNotificationChannel(_androidChannel);
  }

  void showNotification(RemoteMessage message) async{
    try{
      var link = message.notification?.android?.imageUrl.toString();
      final bigPicturePath = await Utils.downloadFile(link!, 'bigPicture');
      final styleInformation = BigPictureStyleInformation(
          FilePathAndroidBitmap(bigPicturePath)
      );

      final NotificationDetails notiDetails = NotificationDetails(
        android: AndroidNotificationDetails(
          _androidChannel.id,
          _androidChannel.name,
          importance: Importance.max,
          priority: Priority.high,
          styleInformation: styleInformation,
          playSound: true,
        ),
      );
      _notiPlugin.show(
        DateTime.now().microsecond,
        message.notification!.title,
        message.notification!.body,
        notiDetails,
        payload: jsonEncode(message.toMap()),
      );
    }catch(e){
      print(e);
    }
  }

}
class Utils{
  static Future<String> downloadFile(String url,String filename) async{
    final directory = await getApplicationDocumentsDirectory();
    final filePath = '${directory.path}/$filename';
    final response = await http.get(Uri.parse(url));
    final file = File(filePath);
    await file.writeAsBytes(response.bodyBytes);
    return filePath;
  }
}