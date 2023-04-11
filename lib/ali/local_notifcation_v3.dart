import 'dart:async';
import 'dart:math';
import 'package:adhan_dart/adhan_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:geolocator/geolocator.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class LocalNotificationsHelper_v3 {
  LocalNotificationsHelper_v3._();

  static LocalNotificationsHelper_v3 localNotificationsHelper =
      LocalNotificationsHelper_v3._();

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

    flutterLocalNotificationsPlugin.initialize(initializationSettings);
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
      totalCall++;
      if (totalCall > 64) return;
      print(
          "v√V ≈≈≈≈≈≈ totalCall : $totalCall ≈≈≈≈≈≈ titleNotification : ${titleNotification} time : ${scheduledNotificationDateTime.toString()} ");
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
        channelShowBadge: true,
        actions: <AndroidNotificationAction>[
          const AndroidNotificationAction('stop', 'Stop', titleColor: Colors.red),
          const AndroidNotificationAction('open', 'Open', titleColor: Colors.green),
          const AndroidNotificationAction('id_3', 'Action 3'),
        ],
      );

      DarwinNotificationDetails iosNotificationDetails = DarwinNotificationDetails(
        presentAlert: true,
        presentBadge: true,
        presentSound: true,
        sound: '$soundName.aiff',
      );

      Duration duration = scheduledNotificationDateTime.difference(DateTime.now());

      if (!duration.isNegative) {
        // await flutterLocalNotificationsPlugin.periodicallyShow(
        //     idNotification, titleNotification, body, repeatInterval, notificationDetails
        // );
        await flutterLocalNotificationsPlugin.zonedSchedule(
          idNotification,
          titleNotification,
          subtitleNotification,
          tz.TZDateTime.now(tz.local).add(duration), //todo
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

  void _setDuhrNotify(DateTime time, bool doa) {
    if (doa == true) {
      for (int i = 0; i < 6; i++) {
        int r = Random().nextInt(999999);
        int id = r + i;
        print("start set nofy from dohr i : $i, id : $id");
        showAdhanNotification(
            idNotification: id,
            titleNotification: 'Now is the time for the Dhuhr call to prayer',
            subtitleNotification: _listAzan[i],
            scheduledNotificationDateTime: time.add(Duration(seconds: i * 22)),
            soundName: "azan${(i + 1)}");
      }
    }

    // if(doa)_setDuaAdhanNotify(time);
  }

  static int totalCall = 0;

  void _setFajrNotify(DateTime time, bool doa) {
    if (doa == true) {
      for (int i = 0; i < 6; i++) {
        int r = Random().nextInt(888888);
        int id = r + i;
        print("start set nofy from fajr i : $i, id : $id time : ${time.toLocal()}");
        showAdhanNotification(
            idNotification: id,
            titleNotification: 'Now is the time for the Fajr call to prayer',
            subtitleNotification: _listAzan[i],
            scheduledNotificationDateTime: time.add(Duration(seconds: i * 22)),
            soundName: "azzan${(i + 1)}");
      }
    }

    // if(doa)_setDuaAdhanNotify(time);
  }

  void _setAsrNotify(DateTime time, bool doa) {
    if (doa == true) {
      for (int i = 0; i < 6; i++) {
        int r = Random().nextInt(99999999);
        int id = r + i;
        print("set nofy succsee i : $i, id : $id");
        showAdhanNotification(
            idNotification: id,
            titleNotification: 'Now is the time for the Asr call to prayer',
            subtitleNotification: _listAzan[i],
            scheduledNotificationDateTime: time.add(Duration(seconds: i * 22)),
            soundName: "azzan${(i + 1)}");
        print("set nofy succsee i : $i, id : $id");
      }
    }

    // if(doa)_setDuaAdhanNotify(time);
  }

  void _setMaghribNotify(DateTime time, bool doa) {
    if (doa == true) {
      for (int i = 0; i < 6; i++) {
        int r = Random().nextInt(99999999);
        int id = r + i;
        print("set nofy succsee i : $i, id : $id");
        showAdhanNotification(
            idNotification: id,
            titleNotification: 'Now is the time for the Maghrib call to prayer',
            subtitleNotification: _listAzan[i],
            scheduledNotificationDateTime: time.add(Duration(seconds: i * 22)),
            soundName: "azzan${(i + 1)}");
        print("set nofy succsee i : $i, id : $id");
      }
    }

    // if(doa)_setDuaAdhanNotify(time);
  }

  void _setIshaNotify(DateTime time, bool doa) {
    if (doa == true) {
      for (int i = 0; i < 6; i++) {
        int r = Random().nextInt(99999999);
        int id = r + i;
        print("set nofy succsee i : $i, id : $id");
        showAdhanNotification(
            idNotification: id,
            titleNotification: 'Now is the time for the Isha call to prayer',
            subtitleNotification: _listAzan[i],
            scheduledNotificationDateTime: time.add(Duration(seconds: i * 22)),
            soundName: "azzan${(i + 1)}");
        print("set nofy succsee i : $i, id : $id");
      }
    }

    // if(doa)_setDuaAdhanNotify(time);
  }

  void _setDuaAdhanNotify(DateTime time) {
    int r = Random().nextInt(888888);
    int id = r + 2;

    showAdhanNotification(
        idNotification: id,
        titleNotification: 'Dua after adhan',
        subtitleNotification: "",
        scheduledNotificationDateTime: time,
        soundName: "DuaAdhan1");
  }

  void setDuaAdhanNotifyTest() {
    DateTime time = DateTime.now().add(const Duration(seconds: 10));
    flutterLocalNotificationsPlugin.cancelAll();
    for (int i = 0; i < 64; i++) {
      int r = Random().nextInt(888888);
      int id = r + 2;
      showAdhanNotification(
          idNotification: id,
          titleNotification: 'Dua after adhan',
          subtitleNotification: "NO : $i",
          scheduledNotificationDateTime: time.add(Duration(hours: i)),
          soundName: "DuaAdhan1");
    }
  }

  final List<String> _listAzan = [
    "Allah is the greatest",
    "I bear witness that there is no god but Allah",
    "I believe that Muhammad is the prophet of God",
    "Come to prayer",
    "Come for the gain",
    "Allah is the greatest",
    "No God except Allah"
  ];

  showAdhansNotificationsToCurrentDay(PrayerTimes prayerTimes) async {
    _setFajrNotify(prayerTimes.fajr!, true);

    _setDuhrNotify(prayerTimes.dhuhr!, true);

    _setAsrNotify(prayerTimes.asr!, true);

    _setMaghribNotify(prayerTimes.maghrib!, true);

    _setIshaNotify(prayerTimes.isha!, true);
  }

  showAdhansNotificationsToWeek() async {
    // cancell all old notification

    flutterLocalNotificationsPlugin.cancelAll();
    totalCall = 0; // reset the counter of notifications set

    for (int i = 0; i < 4; i++) {
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
    Coordinates myLocaion = Coordinates(30.0920887, 31.3713982);
    // get time adhan to date time
    // final nyUtcOffset = Duration(hours: 2);
    final nyDate = DateTime(dateTime.year, dateTime.month, dateTime.day);
    final nyParams = CalculationMethod.MuslimWorldLeague();
    nyParams.madhab = Madhab.Shafi;
    final nyPrayerTimes = PrayerTimes(myLocaion, nyDate, nyParams);
    // return current adhans times
    if (dateTime.day == DateTime.now().day) {
      nyPrayerTimes.dhuhr = DateTime.now().add(const Duration(seconds: 2));
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
    print(position.longitude); //Output: 80.24599079
    print(position.latitude); //Output: 29.6593457

    position.longitude.toString();
    position.latitude.toString();

    print("position.latitude ${position.latitude}");
    print("position.longitude ${position.longitude}");

    LocationSettings locationSettings = const LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 300,
    );

    StreamSubscription<Position> positionStream =
        Geolocator.getPositionStream(locationSettings: locationSettings)
            .listen((Position position) {
      print(position.longitude); //Output: 80.24599079
      print(position.latitude); //Output: 29.6593457

      position.longitude.toString();
      position.latitude.toString();
    });
  }
}
