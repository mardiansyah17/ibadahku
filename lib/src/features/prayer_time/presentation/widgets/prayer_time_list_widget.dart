import 'package:flutter/material.dart';
import 'package:ibadahku/src/features/prayer_time/domain/entities/prayer_time.dart';
import 'package:ibadahku/src/features/prayer_time/presentation/widgets/prayer_time_item_widget.dart';

class PrayerTimeListWidget extends StatelessWidget {
  final PrayerTime prayerTime;
  const PrayerTimeListWidget({
    super.key,
    required this.prayerTime,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 280,
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF000000).withOpacity(0.1),
              offset: const Offset(0, -5),
              blurRadius: 22,
              spreadRadius: 5,
            ),
          ],
          color: Colors.white,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        ),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            PrayerTimeItemWidget(name: "Imsak", time: prayerTime.imsak),
            PrayerTimeItemWidget(name: "Subuh", time: prayerTime.subuh),
            PrayerTimeItemWidget(name: "Dzuhur", time: prayerTime.dzuhur),
            PrayerTimeItemWidget(name: "Ashar", time: prayerTime.ashar),
            PrayerTimeItemWidget(name: "Maghrib", time: prayerTime.maghrib),
            PrayerTimeItemWidget(name: "Isya", time: prayerTime.isya),
          ],
        )),
      ),
    );
  }
}
