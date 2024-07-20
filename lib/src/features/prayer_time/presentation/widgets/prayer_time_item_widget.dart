import 'package:flutter/material.dart';
import 'package:ibadahku/src/core/theme/app_pallete.dart';

class PrayerTimeItemWidget extends StatelessWidget {
  const PrayerTimeItemWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0xFF000000).withOpacity(0.1),
            offset: Offset(0, 5),
            blurRadius: 10,
            spreadRadius: 1,
          ),
        ],
        border: Border.all(
          color: AppPallete.primary,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Imsak"),
          Row(
            children: [
              Text("04:20"),
              SizedBox(width: 10),
              Icon(
                Icons.notifications_on,
                color: AppPallete.second,
              ),
            ],
          )
        ],
      ),
    );
  }
}
