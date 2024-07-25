import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibadahku/src/core/config/datepicker_config.dart';
import 'package:ibadahku/src/core/theme/app_pallete.dart';
import 'package:ibadahku/src/features/prayer_time/presentation/blocs/prayer_time_bloc/prayer_time_bloc.dart';
import 'package:ibadahku/src/features/prayer_time/presentation/pages/select_city.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocationAndDateWidget extends StatefulWidget {
  final DateTime dateTime;
  const LocationAndDateWidget({super.key, required this.dateTime});

  @override
  State<LocationAndDateWidget> createState() => _LocationAndDateWidgetState();
}

class _LocationAndDateWidgetState extends State<LocationAndDateWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () async {
            Navigator.push(
                context,
                PageTransition(
                    type: PageTransitionType.rightToLeft, child: SelectCity()));
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
        _datePicker(context, widget.dateTime),
      ],
    );
  }

  GestureDetector _datePicker(BuildContext context, DateTime dateTime) {
    final prayerTimeBloc = context.read<PrayerTimeBloc>();

    CalendarDatePicker2WithActionButtonsConfig config = datePickerConfig;
    return GestureDetector(
      onTap: () async {
        final value = await showCalendarDatePicker2Dialog(
          context: context,
          config: config,
          dialogSize: const Size(325, 370),
          borderRadius: BorderRadius.circular(15),
          dialogBackgroundColor: Colors.white,
          value: [dateTime],
        );
        if (value != null) {
          if (context.mounted) {
            prayerTimeBloc.add(LoadPrayerTime(
                date: DateFormat("yyyy-MM-dd").format(value.first!)));
          }
        }
      },
      child: Text(
        "${DateFormat("EEEE, dd MMMM yyyy").format(dateTime)}",
        style: TextStyle(fontSize: 16, color: AppPallete.white),
      ),
    );
  }
}
