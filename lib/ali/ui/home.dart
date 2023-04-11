import 'package:adhan_dart/adhan_dart.dart';
import 'package:alarm_test_ios/ali/awesome_local_notifcation_v2.dart';
import 'package:alarm_test_ios/ali/local_notifcation.dart';
import 'package:alarm_test_ios/ali/local_notifcation_v3.dart';
import 'package:alarm_test_ios/ali/not_local_notifcation.dart';
import 'package:alarm_test_ios/ali/test_adhan.dart';
import 'package:alarm_test_ios/ali/ui/screen2.dart';
import 'package:alarm_test_ios/ali/ui/widgets/sound_widget/sound_widget.dart';
import 'package:flutter/material.dart';

import 'widgets/sound_widget/sound_widget_view_model.dart';

class HomeAli extends StatefulWidget {
  const HomeAli({Key? key}) : super(key: key);

  @override
  State<HomeAli> createState() => _HomeAliState();
}

class _HomeAliState extends State<HomeAli> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: ListView(
        shrinkWrap: true,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: SoundWidget(),
          ),
          PaddedElevatedButton(buttonText: "change location", onPressed: getLocation),
          PaddedElevatedButton(buttonText: "set to week", onPressed: setTimeDaily),
          PaddedElevatedButton(buttonText: "test", onPressed: test),
          PaddedElevatedButton(buttonText: "test2", onPressed: test2),
        ],
      ),
    ));
  }

  void test2() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Screen2()));
  }

  void getLocation() {
    // AwesomeLocalNotificationsHelperV2.localNotificationsHelper.checkGps();
  }

  void setTimeDaily() {
    AwesomeLocalNotificationsHelperV2.localNotificationsHelper.showAdhansNotificationsToWeek();
    // LocalNotificationsHelper.localNotificationsHelper.showAdhansNotificationsToWeek();
    // LocalNotificationsHelper_v3.localNotificationsHelper.showAdhansNotificationsToWeek();
  }

  int totalMesh = 0;

  void test() {
    // Coordinates myLocaion = Coordinates(30.0594838, 31.2934839);// egypt
    // Coordinates myLocaion = Coordinates(52.5069312,13.7049182); // germany
    Coordinates myLocaion = Coordinates(50.779594, 6.071470); // germany2
    final nyDate = DateTime.now();
    // final nyParams = CalculationMethod.Egyptian();
    for (var element in listPar) {
      final nyPrayerTimes = PrayerTimes(myLocaion, nyDate, element);
      totalMesh = 0;
      print("fajr : ${converDate(nyPrayerTimes.fajr, '05:15')} ,"
          " dhuhr : ${converDate(nyPrayerTimes.dhuhr, '13:45')},"
          " asr : ${converDate(nyPrayerTimes.asr, '17:15')},"
          " maghrib : ${converDate(nyPrayerTimes.maghrib, '20:14')},"
          " isha : ${converDate(nyPrayerTimes.isha, '21:58')} "
          "| ${element.method} | totalMesh : $totalMesh");
      print("---------------------------------------------------------");
    }
  }

  List<CalculationParameters> listPar = [
    CalculationMethod.MuslimWorldLeague(),
    CalculationMethod.Egyptian(),
    CalculationMethod.Karachi(),
    CalculationMethod.UmmAlQura(),
    CalculationMethod.Dubai(),
    CalculationMethod.MoonsightingCommittee(),
    CalculationMethod.NorthAmerica(),
    CalculationMethod.Kuwait(),
    CalculationMethod.Qatar(),
    CalculationMethod.Singapore(),
    CalculationMethod.Tehran(),
    CalculationMethod.Turkey(),
    CalculationMethod.Morocco(),
    CalculationMethod.Other(),
  ];

  String converDate(DateTime? d, String correct) {
    if (d == null) return "null";
    d = d.toLocal();

    var timeList = correct.split(':').map((e) => int.tryParse(e) ?? 0).toList(); // حولهم لارقام
    DateTime myDateTime = DateTime(d.year, d.month, d.day, timeList[0], timeList[1]);
    int diff = myDateTime.difference(d).inMinutes.toInt();
    int willAdd = diff;
    if (willAdd < 0) willAdd = 0 - willAdd;
    totalMesh += willAdd;
    return "${d.hour}:${d.minute}:${d.second}, ($diff)";
  }
}

class PaddedElevatedButton extends StatelessWidget {
  const PaddedElevatedButton({
    required this.buttonText,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  final String buttonText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
        child: ElevatedButton(
          onPressed: onPressed,
          child: Text(buttonText),
        ),
      );
}
