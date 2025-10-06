import 'dart:convert';

import 'package:cluster_arabia/firebase_options.dart';
import 'package:cluster_arabia/utilities/strings.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_custom_utils/flutter_custom_utils.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
initFirebase() async {
  try {
    if (kDebugMode) {
      // print('Cs Android Init Firebase');
    }
    if (cIsAndroid) {
      if (kDebugMode) {
        // print('Cs Android');
      }
      AndroidNotificationChannel channel = AndroidNotificationChannel(
        'high_importance_channel', // id
        'High Importance Notifications', // title
        description:
        'This channel is used for important notifications.', // description
        importance: Importance.high,
      );
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
      FirebaseMessaging.instance.getToken().then((token) {
        if (kDebugMode) {
           print('FcM Id = >$token');
        }
        GetStorage('cluster_arabia').write(SessionKeys.FCM_ID, token);
      });
      //  if (!kDebugMode) {

      /// Create an Android Notification Channel.
      ///
      /// We use this channel in the `AndroidManifest.xml` file to override the
      /// default FCM channel to enable heads up notifications.
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
          ?.createNotificationChannel(channel);

      ///Click Function
      var initializationSettingsAndroid =
      const AndroidInitializationSettings('@drawable/icon_menu_car_no');
      // var initializationSettingsIOs = const IOSInitializationSettings();
      var initSettings = InitializationSettings(
        android: initializationSettingsAndroid,
        // iOS: initializationSettingsIOs,
      );
      flutterLocalNotificationsPlugin.initialize(
        initSettings,
        onDidReceiveBackgroundNotificationResponse: (payload) {
          GetStorage('cluster_arabia')
              .write(SessionKeys.TO_FIREBASE, payload.payload);
          // GetStorage('cluster_arabia')
          //     .write(SessionKeys.PAYLOAD_DETAILS, payload.payload);
          // Get.offAllNamed(Routes.splash);
          // cLog('Payload Is Normal ${payload.payload}');
        },
        onDidReceiveNotificationResponse: (payload) {
          cLog('Payload Is Normal ${payload.payload}');
          GetStorage('cluster_arabia')
              .write(SessionKeys.TO_FIREBASE, payload.payload);
          // GetStorage('cluster_arabia')
          //     .write(SessionKeys.PAYLOAD_DETAILS, payload.payload);
          // Get.offAllNamed(Routes.splash);
        },
      );

      /// Update the iOS foreground notification presentation options to allow
      /// heads up notifications.
      await FirebaseMessaging.instance
          .setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
      );
      //}
      FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
        RemoteNotification? notification = message.notification;
        AndroidNotification? android = message.notification?.android;
        var imageLink = message.notification?.android?.imageUrl ?? '';
        var bigPictureStyleInformation;
        if ((message.notification?.android?.imageUrl ?? '').isNotEmpty) {
          final http.Response response = await http.get(
            Uri.parse(
              imageLink,
            ),
          );
          bigPictureStyleInformation = BigPictureStyleInformation(
            ByteArrayAndroidBitmap.fromBase64String(
              base64Encode(response.bodyBytes),
            ),
          );
        }
        if (kDebugMode) {
          // print('onMessage data: ${message.data.keys.first}');
        }
        if (notification != null && android != null && !kIsWeb) {
          flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            payload: message.data.toString(),
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                playSound: true,
                importance: Importance.max,
                priority: Priority.high,
                channelDescription: channel.description ?? '',
                icon: '@mipmap/ic_launcher',
                styleInformation: bigPictureStyleInformation,
              ),
            ),
          );
        }
      });
    } else {
      FirebaseMessaging messaging = FirebaseMessaging.instance;
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
      ;
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      final bool? result = await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
          IOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions(
        alert: true,
        badge: true,
        sound: true,
      );
      FirebaseMessaging.instance.subscribeToTopic('userApp');
      FirebaseMessaging.instance.getToken().then((token) {
        GetStorage('Asli_fresh').write(SessionKeys.FCM_ID, token);
      });
      await FirebaseMessaging.instance
          .setForegroundNotificationPresentationOptions(
        alert: true, // Required to display a heads up notification
        badge: true,
        sound: true,
      );
      FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
        RemoteNotification? notification = message.notification;
        if (kDebugMode) {
          print('Handling a background message: ${message.messageId}');
          print(
            'Handling a background message: ${message.notification?.apple ?? ''}',
          );
          print('Handling a background message: ${message.senderId ?? ''}');
        }
        var imageLink = message.notification?.apple?.imageUrl ?? '';
        final http.Response response = await http.get(
          Uri.parse(
            imageLink,
          ),
        );
        flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification?.title,
          notification?.body,
          payload: message.data.toString(),
          NotificationDetails(
            iOS: DarwinNotificationDetails(
              presentAlert: true,
              presentBadge: true,
              presentSound: true,
              categoryIdentifier: '',
            ),
          ),
        );
      });
    }
  } catch (e) {
    if (kDebugMode) {
      // print('Error In main.dart' + e.toString());
    }
    GetStorage('Asli_fresh').remove(SessionKeys.FCM_ID);
    GetStorage('Asli_fresh').write('error', e.toString());
  }
}
