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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        PrayerTimeItemWidget(),
        PrayerTimeItemWidget(),
        PrayerTimeItemWidget(),
        PrayerTimeItemWidget(),
        PrayerTimeItemWidget(),
        PrayerTimeItemWidget(),
      ],
    );
  }
}
