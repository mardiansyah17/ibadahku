import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibadahku/init_depedencies.dart';
import 'package:ibadahku/src/core/theme/app_theme.dart';
import 'package:ibadahku/src/core/widgets/main_screen.dart';
import 'package:ibadahku/src/features/prayer_time/presentation/blocs/prayer_time_bloc/prayer_time_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDepedencies();
  runApp(MultiBlocProvider(
      providers: [BlocProvider(create: (_) => sl<PrayerTimeBloc>())],
      child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      home: const MainScreen(),
    );
  }
}
