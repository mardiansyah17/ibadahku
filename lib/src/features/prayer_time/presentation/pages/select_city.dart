import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibadahku/src/core/theme/app_pallete.dart';
import 'package:ibadahku/src/features/prayer_time/presentation/blocs/city_bloc/city_bloc.dart';

class SelectCity extends StatefulWidget {
  const SelectCity({super.key});
  @override
  State<SelectCity> createState() => _SelectCityState();
}

class _SelectCityState extends State<SelectCity> {
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    context.read<CityBloc>().add(LoadedCities());
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: AddressInputWidget(
            controller: controller,
          ),
        ),
        body: BlocBuilder<CityBloc, CityState>(
          builder: (context, state) {
            if (state is CityLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is CityLoaded) {
              return ListView.builder(
                itemCount: state.cities.length,
                itemBuilder: (context, index) {
                  final city = state.cities[index];
                  return ListTile(
                    title: Text(city.name),
                    onTap: () {
                      Navigator.pop(context, city);
                    },
                  );
                },
              );
            } else {
              return Center(
                child: Text("Error"),
              );
            }
          },
        ));
  }
}

class AddressInputWidget extends StatelessWidget {
  final TextEditingController controller;
  const AddressInputWidget({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: TextStyle(
        color: Colors.black,
        decorationThickness: 0,
      ),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppPallete.primary),
          borderRadius: BorderRadius.circular(10),
        ),
        hintText: "Cari Kota",
        prefixIcon: Icon(Icons.search),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: AppPallete.primary,
            width: 2,
          ),
        ),
      ),
    );
  }
}
