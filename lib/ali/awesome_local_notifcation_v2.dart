import 'dart:async';
import 'dart:math';
import 'dart:ui';
import 'package:adhan_dart/adhan_dart.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

import 'package:geolocator/geolocator.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

// import '../../../helper/app_constants.dart';
// import '../../../helper/cache_helper.dart';

class AwesomeLocalNotificationsHelperV2 {
  AwesomeLocalNotificationsHelperV2._();

  static AwesomeLocalNotificationsHelperV2 localNotificationsHelper = AwesomeLocalNotificationsHelperV2._();

  initLocalNotifications() async {
    await AwesomeNotifications().initialize(
        // set the icon to null if you want to use the default app icon
        null,
        [
          NotificationChannel(
              channelGroupKey: 'basic_channel_group',
              channelKey: 'basic_channel',
              channelName: 'Basic notifications',
              channelDescription: 'Notification channel for basic tests',
              defaultColor: Color(0xFF9D50DD),
              playSound: true,
              // soundSource: "resource://raw/azan1",
              soundSource: "'resource://raw/azan1'",
              ledColor: Colors.white)
        ],
        // Channel groups are only visual and are not required
        debug: true);
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
      print("v√V ≈≈≈≈≈≈ totalCall : $totalCall ≈≈≈≈≈≈ titleNotification : ${titleNotification} time : ${scheduledNotificationDateTime.toString()} ");

      Duration duration = scheduledNotificationDateTime.difference(DateTime.now());

      if (!duration.isNegative) {
        // await flutterLocalNotificationsPlugin.periodicallyShow(
        //     idNotification, titleNotification, body, repeatInterval, notificationDetails
        // );

        print("alllllyyyyyyy");
        AwesomeNotifications().createNotification(
            content: NotificationContent(
              id: idNotification,
              title: titleNotification,
              body: subtitleNotification,
              channelKey: 'basic_channel',
            ),
            schedule: NotificationCalendar.fromDate(
              date: tz.TZDateTime.now(tz.local).add(duration),
            ));
        print("beliedy");
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
            soundName: "azzan${(i + 1)}");
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

    showAdhanNotification(idNotification: id, titleNotification: 'Dua after adhan', subtitleNotification: "", scheduledNotificationDateTime: time, soundName: "DuaAdhan1");
  }

  void setDuaAdhanNotifyTest() {
    DateTime time = DateTime.now().add(Duration(seconds: 10));
    AwesomeNotifications().cancelAll();
    for (int i = 0; i < 64; i++) {
      int r = Random().nextInt(888888);
      int id = r + 2;
      showAdhanNotification(
          idNotification: id, titleNotification: 'Dua after adhan', subtitleNotification: "NO : $i", scheduledNotificationDateTime: time.add(Duration(hours: i)), soundName: "DuaAdhan1");
    }
  }

  List<String> _listAzan = [
    "Allah is the greatest",
    "I bear witness that there is no god but Allah",
    "I believe that Muhammad is the prophet of God",
    "Come to prayer",
    "Come for the gain",
    "Allah is the greatest",
    "No God except Allah"
  ];

  showAdhansNotificationsToCurrentDay(PrayerTimes prayerTimes) async {
    // show Adhan Notification fajr

    _setFajrNotify(prayerTimes.fajr!, false);
    // _setFajrNotify(prayerTimes.fajr!,CacheHelper.getData(key: 'fajerTimeBool')??false);
    // _setFajrNotify(prayerTimes.fajr!,true);
    // _setDuaAdhanNotify(prayerTimes.fajr!);

    // show Adhan Notification Duhr
    _setDuhrNotify(prayerTimes.dhuhr!, true);
    // _setDuhrNotify(prayerTimes.dhuhr!,CacheHelper.getData(key: 'dhuhrTimeBool')??false);
    // _setDuhrNotify(prayerTimes.dhuhr!,true);

    // _setDuaAdhanNotify(prayerTimes.dhuhr!);
    // show Adhan Notification asr

    // _setAsrNotify(prayerTimes.asr!,CacheHelper.getData(key: 'asrTimeBool')??false);
    // _setAsrNotify(prayerTimes.asr!,true);
    // _setDuaAdhanNotify(prayerTimes.asr!);

    // show Adhan Notification maghrib

    // _setMaghribNotify(prayerTimes.maghrib!,CacheHelper.getData(key: 'maghribTimeBool')??false);
    // _setMaghribNotify(prayerTimes.maghrib!,true);
    // _setDuaAdhanNotify(prayerTimes.maghrib!);
    // show Adhan Notification isha

    // _setIshaNotify(prayerTimes.isha!,CacheHelper.getData(key: 'ishaTimeBool')??false);
    //  _setIshaNotify(prayerTimes.isha!,true);
    // _setDuaAdhanNotify(prayerTimes.isha!);
  }

  showAdhansNotificationsToWeek() async {
    // cancell all old notification

    // AwesomeNotifications().cancelAll();
    totalCall = 0; // reset the counter of notifications set

    for (int i = 0; i < 3; i++) {
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
    // Coordinates myLocaion = Coordinates(double.parse(CacheHelper.getData(key: 'latitude', )), double.parse(CacheHelper.getData(key: 'longitude', )) );
    Coordinates myLocaion = Coordinates(30.0920887, 31.3713982);
    // Coordinates myLocaion = Coordinates(position.latitude, position.longitude );
    // Coordinates myLocaion = Coordinates(30.0920887, 31.3713982);
    // get time adhan to date time
    // final nyUtcOffset = Duration(hours: 2);
    final nyDate = DateTime(dateTime.year, dateTime.month, dateTime.day);
    final nyParams = CalculationMethod.MuslimWorldLeague();
    nyParams.madhab = Madhab.Shafi;
    final nyPrayerTimes = PrayerTimes(myLocaion, nyDate, nyParams);
    // return current adhans times
    if (dateTime.day == DateTime.now().day) {
      nyPrayerTimes.dhuhr = DateTime.now().add(const Duration(seconds: 1));
    }

    // to get
    nyPrayerTimes.fajr?.add(Duration(minutes: PrayerType.fajr.getM()));
    nyPrayerTimes.dhuhr?.add(Duration(minutes: PrayerType.duhr.getM()));
    nyPrayerTimes.asr?.add(Duration(minutes: PrayerType.asr.getM()));
    // to save
    PrayerType.asr.saveToShared(5);
    PrayerType.duhr.saveToShared(5);

    return nyPrayerTimes;
  }
}


enum PrayerType { fajr, duhr, asr,mashreb,isha }

extension PrayerTypeEX on PrayerType {
  int getM(){
    List<int> values = _getList();
    switch(this){
      case PrayerType.fajr:
        return values[0];
      case PrayerType.duhr:
        return values[1];
      case PrayerType.asr:
        return values[2];
      case PrayerType.mashreb:
        return values[3];
      case PrayerType.isha:
        return values[4];
    }
  }

  void saveToShared(int m) {
    List<int> values = _getList();
    switch (this) {
      case PrayerType.fajr:
        values[0] = m;
        break;
      case PrayerType.duhr:
        values[1] = m;
        break;
      case PrayerType.asr:
        values[2] = m;
        break;
      case PrayerType.mashreb:
        values[3] = m;
        break;
      case PrayerType.isha:
        values[4] = m;
        break;
    }
    _saveList(values);
  }

  List<int> _getList() {
    String oldShared = ""; // todo cachehelper.get("") اكتب الكود اللي بيجيب القيم
    List<int> values = oldShared.split(",").map((e) => int.tryParse(e) ?? 0).take(5).toList();
    for (int i = values.length; i <= values.length; i++) {
      values.add(0);
    }
    return values;
  }

  void _saveList(List<int> values) {
    String toSave = "";
    for (var element in values) {
      toSave += "$element,";
    }
    if(toSave.contains(","))toSave.substring(0,toSave.length-1);
    // todo اكتب هنا الكود اللي هيعمل save
    // sharedhelper.save("key",toSave);
  }
}
