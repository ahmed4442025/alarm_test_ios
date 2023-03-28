// import 'dart:async';
// import 'dart:math';
// import 'package:adhan_dart/adhan_dart.dart';
// import 'package:awesome_notifications/awesome_notifications.dart';
// import 'package:flutter/material.dart';
//
// // import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:timezone/data/latest_all.dart' as tz;
// import 'package:timezone/timezone.dart' as tz;
//
// class NotLocalNotificationsHelper {
//   NotLocalNotificationsHelper._();
//
//   static NotLocalNotificationsHelper localNotificationsHelper =
//       NotLocalNotificationsHelper._();
//
//   static late  AwesomeNotifications flutterLocalNotificationsPlugin;
//
//   void _listner() async{
//     AwesomeNotifications().setListeners(
//         onActionReceivedMethod: (ReceivedAction receivedAction) async {
//           NotificationController.onActionReceivedMethod(receivedAction);
//           print('Notification key pressed: ${receivedAction.buttonKeyPressed}');
//         },
//
//
//         );
//
//   }
//
//   initLocalNotifications() {
//     flutterLocalNotificationsPlugin = AwesomeNotifications();
//     flutterLocalNotificationsPlugin.initialize(
//         // set the icon to null if you want to use the default app icon
//         null,
//         [
//           NotificationChannel(
//               channelGroupKey: 'basic_channel_group',
//               channelKey: 'basic_channel',
//               channelName: 'Basic notifications',
//               channelDescription: 'Notification channel for basic tests',
//               defaultColor: const Color(0xFF9D50DD),
//               playSound: true,
//               soundSource: "resource://raw/azan1",
//               importance: NotificationImportance.High,
//               enableVibration: true,
//               enableLights: true,
//               ledColor: Colors.white)
//         ],
//         // Channel groups are only visual and are not required
//         channelGroups: [
//           NotificationChannelGroup(
//               channelGroupKey: 'basic_channel_group',
//               channelGroupName: 'Basic group')
//         ],
//         debug: true);
//
//     // _listner();
//   }
//
//   showAdhanNotification({
//     required int idNotification,
//     required String titleNotification,
//     required String soundName,
//     required String subtitleNotification,
//     required DateTime scheduledNotificationDateTime,
//   }) async {
//     tz.initializeTimeZones();
//
//     if (scheduledNotificationDateTime.isAfter(DateTime.now())) {
//       await AwesomeNotifications().createNotification(
//           content: NotificationContent(
//             id: idNotification,
//             channelKey: 'basic_channel',
//             title: titleNotification,
//             criticalAlert: true,
//             body: subtitleNotification,
//             wakeUpScreen: true,
//             category: NotificationCategory.Reminder,
//             displayOnBackground: true,
//             displayOnForeground: true,
//             badge: idNotification,
//             customSound: "resource://raw/azan3",
//             // notificationLayout: NotificationLayout.BigPicture,
//             // bigPicture: 'asset://assets/images/delivery.jpeg',
//             payload: {'uuid': 'uuid-test'},
//             autoDismissible: false,
//           ),
//           schedule:
//               NotificationCalendar.fromDate(date: scheduledNotificationDateTime),
//           actionButtons: [NotificationActionButton(key: "key", label: "label")]);
//     }
//   }
//
//
//   void _setDuhrNotify(DateTime time) {
//     for (int i = 2; i < 5; i++) {
//       showAdhanNotification(
//           idNotification: DateTime.now().microsecond + i + 1,
//           titleNotification: 'حان الآن موعد آذان الظهر',
//           subtitleNotification: 'azan${i + 1}',
//           scheduledNotificationDateTime: time.add(Duration(seconds: i * 10)),
//           soundName: "azan${i + 1}");
//     }
//   }
//
//   // List<String> _listAzan = [""];
//   showAdhansNotificationsToCurrentDay(PrayerTimes prayerTimes) async {
//     // show Adhan Notification fajr
//
//     showAdhanNotification(
//         idNotification: DateTime.now().microsecond + 1,
//         titleNotification: 'حان الآن موعد آذان الفجر',
//         subtitleNotification: 'حسب التوقيت المحلي',
//         scheduledNotificationDateTime: prayerTimes.fajr!,
//         soundName: "azan3");
//
//     // show Adhan Notification dhuhr
//
//     Future.delayed(Duration(seconds: 3));
//     showAdhanNotification(
//         idNotification: DateTime.now().microsecond + 20,
//         titleNotification: 'حان الآن موعد آذان الظهر',
//         subtitleNotification: 'حazan3',
//         scheduledNotificationDateTime: prayerTimes.dhuhr!,
//         soundName: "azan12");
//
//     Future.delayed(Duration(seconds: 3));
//     showAdhanNotification(
//         idNotification: DateTime.now().microsecond + 21,
//         titleNotification: 'حان الآن موعد آذان الظهر',
//         subtitleNotification: 'حazan7 ',
//         scheduledNotificationDateTime: prayerTimes.dhuhr!.add(Duration(seconds: 5)),
//         soundName: "azan7");
//     Future.delayed(Duration(seconds: 3));
//     showAdhanNotification(
//         idNotification: DateTime.now().microsecond + 22,
//         titleNotification: 'حان الآن موعد آذان الظهر',
//         subtitleNotification: 'azan10',
//         scheduledNotificationDateTime: prayerTimes.dhuhr!.add(Duration(seconds: 10)),
//         soundName: "azan10");
//
//     // _setDuhrNotify(prayerTimes.dhuhr!);
//
//     // show Adhan Notification asr
//
//     showAdhanNotification(
//         idNotification: DateTime.now().microsecond + 3,
//         titleNotification: 'حان الآن موعد آذان العصر',
//         subtitleNotification: 'حسب التوقيت المحلي',
//         scheduledNotificationDateTime: prayerTimes.asr!,
//         soundName: "azan3");
//
//     // show Adhan Notification maghrib
//
//     showAdhanNotification(
//         idNotification: DateTime.now().microsecond + 4,
//         titleNotification: 'حان الآن موعد آذان المغرب',
//         subtitleNotification: 'حسب التوقيت المحلي',
//         scheduledNotificationDateTime: prayerTimes.maghrib!,
//         soundName: "azan3");
//
//     // show Adhan Notification isha
//
//     showAdhanNotification(
//         idNotification: DateTime.now().microsecond + 5,
//         titleNotification: 'حان الآن موعد آذان العشاء',
//         subtitleNotification: 'حسب التوقيت المحلي',
//         scheduledNotificationDateTime: prayerTimes.isha!,
//         soundName: "azan3");
//   }
//
//   showAdhansNotificationsToWeek() async {
//     // cancell all old notification
//
//    flutterLocalNotificationsPlugin.cancelAll();
//
//     for (int i = 0; i < 7; i++) {
//       DateTime dateTime = DateTime.now().add(Duration(days: i));
//
//       // get times adhans to day
//
//       PrayerTimes prayerTimes = await getAdhanToDayTimes(dateTime: dateTime);
//
//       // set notification adhan to current day
//
//       showAdhansNotificationsToCurrentDay(prayerTimes);
//     }
//   }
//
//   Future<PrayerTimes> getAdhanToDayTimes({
//     required DateTime dateTime,
//   }) async {
//     // set new my location value
//
//     // Coordinates myLocaion = Coordinates(position.latitude , position.longitude );
//     Coordinates myLocaion = Coordinates(30.0920887, 31.3713982);
//     // get time adhan to date time
//     // final nyUtcOffset = Duration(hours: 2);
//     final nyDate = DateTime(dateTime.year, dateTime.month, dateTime.day);
//     final nyParams = CalculationMethod.Egyptian();
//     nyParams.madhab = Madhab.Shafi;
//     final nyPrayerTimes = PrayerTimes(myLocaion, nyDate, nyParams);
//     // return current adhans times
//     if (dateTime.day == DateTime.now().day) {
//       nyPrayerTimes.dhuhr = DateTime.now().add(const Duration(seconds: 3));
//     }
//     return nyPrayerTimes;
//   }
//
//   checkGps() async {
//     servicestatus = await Geolocator.isLocationServiceEnabled();
//     if (servicestatus) {
//       permission = await Geolocator.checkPermission();
//
//       if (permission == LocationPermission.denied) {
//         permission = await Geolocator.requestPermission();
//         if (permission == LocationPermission.denied) {
//           print('Location permissions are denied');
//         } else if (permission == LocationPermission.deniedForever) {
//           print("'Location permissions are permanently denied");
//         } else {
//           haspermission = true;
//         }
//       } else {
//         haspermission = true;
//       }
//
//       if (haspermission) {
//         getLocation();
//       }
//     } else {
//       // showSnackBar(context, "GPSServiceisnotenabledturnonGPSlocation".tr(), 'error');
//       print("GPS Service is not enabled, turn on GPS location");
//     }
//   }
//
//   bool servicestatus = false;
//   bool haspermission = false;
//   late LocationPermission permission;
//   late Position position;
//
//   late StreamSubscription<Position> positionStream;
//
//   getLocation() async {
//     position =
//         await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
//     // print(position.longitude); //Output: 80.24599079
//     // print(position.latitude); //Output: 29.6593457
//     //
//     // position.longitude.toString();
//     //  position.latitude.toString();
//     //
//     // print("position.latitude ${position.latitude}");
//     // print("position.longitude ${position.longitude}");
//     //
//     //
//     // LocationSettings locationSettings = LocationSettings(
//     //   accuracy: LocationAccuracy.high,
//     //   distanceFilter: 300,
//     //
//     // );
//     //
//     // StreamSubscription<Position> positionStream = Geolocator.getPositionStream(
//     //     locationSettings: locationSettings).listen((Position position) {
//     //   print(position.longitude); //Output: 80.24599079
//     //   print(position.latitude); //Output: 29.6593457
//     //
//     //  position.longitude.toString();
//     //     position.latitude.toString();
//     // });
//   }
// }
//
//
// class NotificationController {
//
//   /// Use this method to detect when a new notification or a schedule is created
//   @pragma("vm:entry-point")
//   static Future <void> onNotificationCreatedMethod(ReceivedNotification receivedNotification) async {
//     // Your code goes here
//   }
//
//   /// Use this method to detect every time that a new notification is displayed
//   @pragma("vm:entry-point")
//   static Future <void> onNotificationDisplayedMethod(ReceivedNotification receivedNotification) async {
//     // Your code goes here
//   }
//
//   /// Use this method to detect if the user dismissed a notification
//   @pragma("vm:entry-point")
//   static Future <void> onDismissActionReceivedMethod(ReceivedAction receivedAction) async {
//     // Your code goes here
//   }
//
//   /// Use this method to detect when the user taps on a notification or action button
//   @pragma("vm:entry-point")
//   static Future <void> onActionReceivedMethod(ReceivedAction receivedAction) async {
//     // Your code goes here
//     print('Notification key pressed: ${receivedAction.buttonKeyPressed} 222222222');
//
//     // Navigate into pages, avoiding to open the notification details page over another details page already opened
//     // MyApp.navigatorKey.currentState?.pushNamedAndRemoveUntil('/notification-page',
//     //         (route) => (route.settings.name != '/notification-page') || route.isFirst,
//     //     arguments: receivedAction);
//   }
// }