import 'package:adhan/adhan.dart';

class TestAdhan {
  void test1() {
    print('My Prayer Times');
    final myCoordinates = Coordinates(23.9088, 89.1220); // Replace with your own location lat, lng.
    final params = CalculationMethod.karachi.getParameters();
    params.madhab = Madhab.hanafi;
    final prayerTimes = PrayerTimes.today(myCoordinates, params);
    SekoLalaMeme newPrayerTimes = SekoLalaMeme(prayerTimes);

    newPrayerTimes.duhr = newPrayerTimes.duhr?.add(Duration(minutes: 5));

    // return newPrayerTimes;
  }
}

class SekoLalaMeme {
  DateTime? fajr;
  DateTime? duhr;
  DateTime? asr;
  DateTime? mashrb;
  DateTime? isha;

  SekoLalaMeme(PrayerTimes prayerTimes) {
    fajr = prayerTimes.fajr;
    duhr = prayerTimes.dhuhr;
    asr = prayerTimes.asr;
    mashrb = prayerTimes.maghrib;
    isha = prayerTimes.isha;
  }
}
