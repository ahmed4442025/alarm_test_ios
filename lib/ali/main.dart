import 'package:alarm_test_ios/ali/awesome_local_notifcation_v2.dart';
import 'package:alarm_test_ios/ali/local_notifcation.dart';
import 'package:alarm_test_ios/ali/not_local_notifcation.dart';
import 'package:alarm_test_ios/ali/ui/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  AwesomeLocalNotificationsHelperV2.localNotificationsHelper.initLocalNotifications();
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomeAli());
  }
}
