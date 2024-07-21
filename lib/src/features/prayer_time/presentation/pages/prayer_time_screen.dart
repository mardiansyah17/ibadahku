import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibadahku/src/core/theme/app_pallete.dart';
import 'package:ibadahku/src/core/widgets/app_button.dart';
import 'package:ibadahku/src/core/widgets/app_loading.dart';
import 'package:ibadahku/src/features/prayer_time/presentation/blocs/prayer_time_bloc/prayer_time_bloc.dart';
import 'package:ibadahku/src/features/prayer_time/presentation/pages/no_location_screen.dart';
import 'package:ibadahku/src/features/prayer_time/presentation/widgets/prayer_time_list_widget.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrayerTimeScreen extends StatefulWidget {
  const PrayerTimeScreen({super.key});

  @override
  State<PrayerTimeScreen> createState() => _PrayerTimeScreenState();
}

class _PrayerTimeScreenState extends State<PrayerTimeScreen> {
  final String date = DateFormat("yyyy-MM-dd").format(DateTime.now());

  @override
  void initState() {
    context.read<PrayerTimeBloc>().add(LoadPrayerTime(date: date));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: BlocBuilder<PrayerTimeBloc, PrayerTimeState>(
          builder: (context, state) {
            if (state is PrayerTimeLoading) {
              return const AppLoading();
            }
            if (state is LocationIsNotExist) {
              return const NoLocationScreen();
            }

            if (state is InternetIsNotConnected) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Tidak ada koneksi internet"),
                    const SizedBox(height: 10),
                    AppButton(
                      text: "Coba lagi",
                      onPressed: () {
                        context
                            .read<PrayerTimeBloc>()
                            .add(LoadPrayerTime(date: date));
                      },
                    ),
                  ],
                ),
              );
            }

            if (state is PrayerTimeLoaded) {
              return Stack(
                children: [
                  Container(
                    height: 350,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          AppPallete.primary,
                          AppPallete.second,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Ashar",
                            style: TextStyle(
                                fontSize: 20, color: AppPallete.white),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            "16.20",
                            style: TextStyle(
                                fontSize: 22, color: AppPallete.white),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            "2 jam 4 menit 30 detik lagi",
                            style: TextStyle(
                                fontSize: 16, color: AppPallete.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                      top: 35,
                      left: 15,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () async {
                              SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
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
                          Text(
                            "${DateFormat("EEEE, dd MMMM yyyy").format(DateTime.now())}",
                            style: TextStyle(
                                fontSize: 16, color: AppPallete.white),
                          )
                        ],
                      )),
                  PrayerTimeListWidget(
                    prayerTime: state.prayerTime,
                  )
                ],
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
