// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:snkr_flutter/main.dart';
// import 'package:snkr_flutter/screen/splashScreen/splash_screen.dart';

// Future<void> handleBackgroundMessage(RemoteMessage message) async {
//   print('title: ${message.notification?.title}');
//   print('title: ${message.notification?.body}');
//   print('title: ${message.data}');
// }

// class FirebaseApi {
//   final _firebaseMessaging = FirebaseMessaging.instance;

//   void handleMessage(RemoteMessage? message) {
//     if (message == null) return;
//     navigatorKey.currentState?.pushNamed(
//       SplashScreen.route,
//       arguments: message,
//     );
//   }

//   Future initPushNotifications() async {
//     await FirebaseMessaging.instance
//         .setForegroundNotificationPresentationOptions(
//       alert: true,
//       badge: true,
//       sound: true,
//     );
//     FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
//     FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
//     FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
//   }

//   Future<void> initNotifications() async {
//     await _firebaseMessaging.requestPermission();
//     final fCMToken = await _firebaseMessaging.getToken();
//     print('token: $fCMToken');
//     initPushNotifications();
//   }
// }

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/widgets.dart';
import 'package:snkr_flutter/core/helper/sharedPreferences/shared_preferences.dart';
import 'package:snkr_flutter/core/helper/snackBar/snack_bar_helper.dart';
import 'package:snkr_flutter/main.dart';

Future<void> handleBackgroundMessage(RemoteMessage message) async {
  print('title: ${message.notification?.title}');
  print('title: ${message.notification?.body}');
  print('title: ${message.data}');
}

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;
  void handleMessage(RemoteMessage? message) {
    if (message == null) return;
    navigatorKey.currentState?.pushNamed(
      '/',
      arguments: message,
    );
  }

  Future initPushNotifications() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
  }

  Future<bool> requestPermission(BuildContext context) async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
      return true;
    } else {
      print('User declined or has not accepted permission');
      // displayCustomToast(
      //     context, 'Notification Permission Not Allowed', 'error');
      customErrorSnackBar("Notification Permission Not Allowed");
      return false;
    }
  }

  Future<void> initNotifications(BuildContext context) async {
    String? existingToken = await getStringData('fcmToken');
    if (existingToken == null) {
      bool isPermissionGranted = await requestPermission(context);
      if (isPermissionGranted) {
        final fCMToken = await _firebaseMessaging.getToken();
        print('ftoken: $fCMToken');
        await setStringData('fcmToken', fCMToken.toString());
        initPushNotifications();
      }
    } else {
      print('Existing token: $existingToken');
      initPushNotifications();
    }
  }
}
