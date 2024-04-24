import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:doob/utils/constants.dart';
import 'package:doob/utils/sharedPreference.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
// import 'package:one_context/one_context.dart';

Future<void> onmsg(RemoteMessage msg) async {
  print("Msgggg: ${msg.toMap()}");
  print("Helloooooo : ${msg.toMap()}");
  if (msg.notification != null) {
    // print("Helloooooo : $msg");
    await FireMSG.display(msg);
  }
}

void onBGmag(RemoteMessage message) async {
  print("Helloooooo : ${message.toMap()}");
  if (message.notification != null) {
    // print("Helloooooo : $message");
    await FireMSG.display(message);
  }
}

class FireMSG {
  static final _fireMsg = FirebaseMessaging.instance;

  static String? CTOKEN;
  static String? DID;

  static DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

  // var androiInit = AndroidInitializationSettings(‘@mipmap/ic_launcher’);//for logo
  // var iosInit = IOSInitial izationSettings();
  // var initSetting=InitializationSettings(android: androiInit,iOS:
  //  iosInit);
  //  var fltNotification = FlutterLocalNotificationsPlugin();
  //  fltNotific-ation.initialize(initSetting);

  // static final _localNotifications = FlutterLocalNotificationsPlugin();

  static Future<void> display(RemoteMessage message) async {
    // To display the notification in device
    try {
      print(message.notification!.android!.sound);
      final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      // NotificationDetails notificationDetails = NotificationDetails(
      //   android: AndroidNotificationDetails(
      //     "high_importance_channel", 'High Importance Notifications',
      //     groupKey: "555555",
      //     color: Colors.yellow,
      //     importance: Importance.max,
      //     icon: '@mipmap/ic_launcher',

      //     // sound: RawResourceAndroidNotificationSound(
      //     //     message.notification!.android!.sound ?? "gfg"),

      //     // different sound for
      //     // different notification
      //     // sound: RawResourceAndroidNotificationSound('am`ongus'),
      //     playSound: true,
      //     priority: Priority.max,
      //   ),
      // );
      // await _localNotifications.show(
      //   id,
      //   message.notification?.title,
      //   message.notification?.body,
      //   notificationDetails,
      //   payload: message.data['route'],
      // );
    } catch (e) {
      debugPrint("Noo : ${e.toString()}");
    }
  }
static Future<String?> getFireToken()async{
      return await _fireMsg.getToken();
    }

  static Future<void> initNoti() async {
    NotificationSettings notiPermission = await _fireMsg.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    
    print("nlm ${notiPermission.authorizationStatus}");
    final CMToken = await _fireMsg.getToken();
    print("Token : $CMToken");

    CTOKEN = CMToken;

    // const InitializationSettings initializationSettingsAndroid =
    //     InitializationSettings(
    //         android: AndroidInitializationSettings("@mipmap/ic_launcher'"));
    // _localNotifications.initialize(
    //   initializationSettingsAndroid,
    //   // to handle event when we receive notification
    //   onDidReceiveNotificationResponse: (details) {
    //     print("local noti : ondidreceive : $details");
    //     GLOBALS.router.push("/chat-web");
    //     // }

    //     if (details.input != null) {}
    //   },
    // );
    // _localNotifications.initialize(initializationSettings);
    // String? deviceID;

    if (Platform.isAndroid) {
      var info = await deviceInfo.androidInfo;
      DID = info.id;
      print("Token IDID : ${info.id}");
    } else if (Platform.isIOS) {
      var info = await deviceInfo.iosInfo;
      DID = info.identifierForVendor!;
      print("Token IDID : ${info.identifierForVendor}");
    }

    await _fireMsg.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    RemoteMessage? rm = await FirebaseMessaging.instance.getInitialMessage();
    if (rm != null) {
      print("INITIAL MSG : $rm");

      //GLOBALS.router.push("/chat-web");
      // }
    }

    FirebaseMessaging.onBackgroundMessage(onmsg);
    FirebaseMessaging.onMessage.listen(onBGmag);
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      print("open??? $event");

      // GLOBALS.router.push("/chat-web");
    });

    await addToken();
  }

  static Future<void> postToken(token, devideId, userID) async {
    // final url = Uri.parse("${AppConfig.BASE_URL}/customer/add-device-token");

    // print("RES : ${access_token.$}");
    final tokenb = await SharedPref.getData(key: SharedPref.token);

    final headers = {
      'Content-Type': 'application/json',
      "Authorization": "Bearer $tokenb",
    };

    //final Map<String, dynamic> data = {
    final data = {
      "device_token": token,
      "user_id": userID.toString(),
    };

    http.Response response = await http.post(Uri.parse(ApiUrl.loginUrl),
        // Uri.parse("${ApiUrl.loginUrl}/customer/add-device-token"),
        headers: headers,
      //  body: data);
     body: jsonEncode(data));
    print("Firebase result ****** : ${response.body}");
    print(' %%%%%%%%%%%%%%%%%%%%%%% $token');

    // http.Response res = await ApiRequest.post(

    //   url: "${AppConfig.BASE_URL}/customer/add-device-token",
    //   headers: {
    //     "Authorization": "Bearer ${access_token.$}",
    //   },
    //   body: json.encode({
    //     "device_token": token,
    //     // "device_id": devideId,
    //     "user_id": userID.toString(),
    //   }),
    // );
    // print("RES : ${res.body}");
  }

  static Future<void> addToken() async {
    Box authBox = Hive.box("auth");
    print("TOKEN ADDED");

    if (Hive.box("MiscBox").get("tokenAdded") == null &&
        CTOKEN != null &&
        DID != null &&
        authBox.get("user") != null) {
      await postToken(
        CTOKEN,
        DID,
        authBox.get("user")["id"],
      );
      Hive.box("MiscBox").put("tokenAdded", 1);

      print("TK ADDED");
    } else {
      print("TK NOO");
    }

    print("555555 $CTOKEN $DID");
  }
}


// fLa7CbGdSEmCWndmrOK0gu:APA91bGV-TPe-I7H8-4pIufVAe6sx9cNUW4kdJQxxzQew0EkDXYoUgCXgfjQwl8f_n3PBoYUFEZ7FYpSrsu3ZiXiMK7Gr6ZswnR0qaUuEdBqJoKZ5f0DufTbXN1WU0ekfK7IwguxSCyf
// RP1A.200720.012




