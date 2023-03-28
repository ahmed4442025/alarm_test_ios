import 'dart:async';
import 'dart:math';
import 'package:adhan_dart/adhan_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:geolocator/geolocator.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class LocalNotificationsHelper {
  LocalNotificationsHelper._();

  static LocalNotificationsHelper localNotificationsHelper =
      LocalNotificationsHelper._();

  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  initLocalNotifications() {
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    var initialzationSettingsAndroid =
        const AndroidInitializationSettings('@mipmap/ic_launcher');

    var initialzationSettingsIOS = const DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,

    );

    var initializationSettings = InitializationSettings(
      android: initialzationSettingsAndroid,
      iOS: initialzationSettingsIOS,
    );

    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,

    );
  }

  showAdhanNotification({
    required int idNotification,
    required String titleNotification,
    required String soundName,
    required String subtitleNotification,
    required DateTime scheduledNotificationDateTime,
  }) async {
    tz.initializeTimeZones();

    if (scheduledNotificationDateTime.isAfter(DateTime.now())) {
      AndroidNotificationDetails androidNotificationDetails =
          AndroidNotificationDetails(
        'your other channel id',
        'your other channel name',
        channelDescription: 'your other channel description',
        priority: Priority.high,
        importance: Importance.high,
        autoCancel: false,
        enableLights: true,
        sound: RawResourceAndroidNotificationSound(soundName),
        playSound: true,
            actions: <AndroidNotificationAction>[
              AndroidNotificationAction('stop', 'stop',titleColor: Colors.red,showsUserInterface: true),
              AndroidNotificationAction('id_2', 'Action 2'),
              AndroidNotificationAction('id_3', 'Action 3'),
            ],
      );

      DarwinNotificationDetails iosNotificationDetails =
          const DarwinNotificationDetails(
        presentAlert: true,
        presentBadge: true,
        presentSound: true,
        sound: 'soundName',
      );

      // NotificationDetails platformChannelSpecifics = NotificationDetails(

      //   android: androidNotificationDetails,

      //   iOS: iosNotificationDetails,

      // );

      // await flutterLocalNotificationsPlugin.schedule(

      //   idNotification,

      //   titleNotification,

      //   subtitleNotification,

      //   scheduledNotificationDateTime,

      //   platformChannelSpecifics,

      //   payload: idNotification.toString(),

      //   androidAllowWhileIdle: true,

      // );

      Duration duration = scheduledNotificationDateTime.difference(DateTime.now());

      if (!duration.isNegative) {
        await flutterLocalNotificationsPlugin.zonedSchedule(
          idNotification,
          titleNotification,
          subtitleNotification,
          tz.TZDateTime.now(tz.local).add(duration),
          NotificationDetails(
            android: androidNotificationDetails,
            iOS: iosNotificationDetails,
          ),
          androidAllowWhileIdle: true,
          uiLocalNotificationDateInterpretation:
              UILocalNotificationDateInterpretation.absoluteTime,
        );
      }
    }
  }


  void _setDuhrNotify(DateTime time) {
    for (int i = 2; i < 5; i++) {
      showAdhanNotification(
          idNotification: DateTime.now().microsecond + i + 1,
          titleNotification: 'حان الآن موعد آذان الظهر',
          subtitleNotification: 'azan${i+1}',
          scheduledNotificationDateTime: time.add(Duration(seconds: i * 10)),
          soundName: "azan${i+1}");
    }
  }

  // List<String> _listAzan = [""];
  showAdhansNotificationsToCurrentDay(PrayerTimes prayerTimes) async{
    // show Adhan Notification fajr

    showAdhanNotification(
        idNotification: DateTime.now().microsecond + 1,
        titleNotification: 'حان الآن موعد آذان الفجر',
        subtitleNotification: 'حسب التوقيت المحلي',
        scheduledNotificationDateTime: prayerTimes.fajr!,
        soundName: "azan3");

    // show Adhan Notification dhuhr

    Future.delayed(Duration(seconds: 3));
    showAdhanNotification(
        idNotification: DateTime.now().microsecond + 20,
        titleNotification: 'حان الآن موعد آذان الظهر',
        subtitleNotification: 'حazan3',
        scheduledNotificationDateTime: prayerTimes.dhuhr!,
        soundName: "azan12");

    Future.delayed(Duration(seconds: 3));
    showAdhanNotification(
        idNotification: DateTime.now().microsecond + 21,
        titleNotification: 'حان الآن موعد آذان الظهر',
        subtitleNotification: 'حazan7 ',
        scheduledNotificationDateTime: prayerTimes.dhuhr!.add(Duration(seconds: 5)),
        soundName: "azan7");
    Future.delayed(Duration(seconds: 3));
    showAdhanNotification(
        idNotification: DateTime.now().microsecond + 22,
        titleNotification: 'حان الآن موعد آذان الظهر',
        subtitleNotification: 'azan10',
        scheduledNotificationDateTime: prayerTimes.dhuhr!.add(Duration(seconds: 10)),
        soundName: "azan10");

    // _setDuhrNotify(prayerTimes.dhuhr!);

    // show Adhan Notification asr

    showAdhanNotification(
        idNotification: DateTime.now().microsecond + 3,
        titleNotification: 'حان الآن موعد آذان العصر',
        subtitleNotification: 'حسب التوقيت المحلي',
        scheduledNotificationDateTime: prayerTimes.asr!,
        soundName: "azan3");

    // show Adhan Notification maghrib

    showAdhanNotification(
        idNotification: DateTime.now().microsecond + 4,
        titleNotification: 'حان الآن موعد آذان المغرب',
        subtitleNotification: 'حسب التوقيت المحلي',
        scheduledNotificationDateTime: prayerTimes.maghrib!,
        soundName: "azan3");

    // show Adhan Notification isha

    showAdhanNotification(
        idNotification: DateTime.now().microsecond + 5,
        titleNotification: 'حان الآن موعد آذان العشاء',
        subtitleNotification: 'حسب التوقيت المحلي',
        scheduledNotificationDateTime: prayerTimes.isha!,
        soundName: "azan3");
  }

  showAdhansNotificationsToWeek() async {
    // cancell all old notification

    flutterLocalNotificationsPlugin.cancelAll();

    for (int i = 0; i < 7; i++) {
      DateTime dateTime = DateTime.now().add(Duration(days: i));

      // get times adhans to day

      PrayerTimes prayerTimes = await getAdhanToDayTimes(dateTime: dateTime);

      // set notification adhan to current day

      showAdhansNotificationsToCurrentDay(prayerTimes);
    }
  }

  Future<PrayerTimes> getAdhanToDayTimes({
    required DateTime dateTime,
  }) async {
    // set new my location value

    // Coordinates myLocaion = Coordinates(position.latitude , position.longitude );
    Coordinates myLocaion = Coordinates(30.0920887, 31.3713982);
    // get time adhan to date time
    // final nyUtcOffset = Duration(hours: 2);
    final nyDate = DateTime(dateTime.year, dateTime.month, dateTime.day);
    final nyParams = CalculationMethod.Egyptian();
    nyParams.madhab = Madhab.Shafi;
    final nyPrayerTimes = PrayerTimes(myLocaion, nyDate, nyParams);
    // return current adhans times
    if (dateTime.day == DateTime.now().day) {
      nyPrayerTimes.dhuhr = DateTime.now().add(const Duration(seconds: 10));
    }
    return nyPrayerTimes;
  }

  checkGps() async {
    servicestatus = await Geolocator.isLocationServiceEnabled();
    if (servicestatus) {
      permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          print('Location permissions are denied');
        } else if (permission == LocationPermission.deniedForever) {
          print("'Location permissions are permanently denied");
        } else {
          haspermission = true;
        }
      } else {
        haspermission = true;
      }

      if (haspermission) {
        getLocation();
      }
    } else {
      // showSnackBar(context, "GPSServiceisnotenabledturnonGPSlocation".tr(), 'error');
      print("GPS Service is not enabled, turn on GPS location");
    }
  }

  bool servicestatus = false;
  bool haspermission = false;
  late LocationPermission permission;
  late Position position;

  late StreamSubscription<Position> positionStream;

  getLocation() async {
    position =
        await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    // print(position.longitude); //Output: 80.24599079
    // print(position.latitude); //Output: 29.6593457
    //
    // position.longitude.toString();
    //  position.latitude.toString();
    //
    // print("position.latitude ${position.latitude}");
    // print("position.longitude ${position.longitude}");
    //
    //
    // LocationSettings locationSettings = LocationSettings(
    //   accuracy: LocationAccuracy.high,
    //   distanceFilter: 300,
    //
    // );
    //
    // StreamSubscription<Position> positionStream = Geolocator.getPositionStream(
    //     locationSettings: locationSettings).listen((Position position) {
    //   print(position.longitude); //Output: 80.24599079
    //   print(position.latitude); //Output: 29.6593457
    //
    //  position.longitude.toString();
    //     position.latitude.toString();
    // });
  }
}
