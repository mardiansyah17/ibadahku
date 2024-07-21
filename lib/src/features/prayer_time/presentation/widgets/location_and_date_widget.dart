import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:ibadahku/src/core/theme/app_pallete.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocationAndDateWidget extends StatelessWidget {
  final void Function() onDateTap;
  const LocationAndDateWidget({super.key, required this.onDateTap});

  onDateTapHandler(BuildContext context) async {
    await showCalendarDatePicker2Dialog(
      context: context,
      config: CalendarDatePicker2WithActionButtonsConfig(),
      dialogSize: const Size(325, 370),
      borderRadius: BorderRadius.circular(15),
      // value: _dialogCalendarPickerValue,
      dialogBackgroundColor: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.remove('latitude');
            prefs.remove('longitude');
          },
          child: Text(
            "Palembang",
            style: TextStyle(
              fontSize: 16,
              color: AppPallete.white,
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        GestureDetector(
          onTap: () => onDateTapHandler(context),
          child: Text(
            "${DateFormat("EEEE, dd MMMM yyyy").format(DateTime.now())}",
            style: TextStyle(fontSize: 16, color: AppPallete.white),
          ),
        ),
      ],
    );
  }
}
