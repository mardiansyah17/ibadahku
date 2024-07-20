import 'package:flutter/material.dart';
import 'package:ibadahku/src/core/theme/app_pallete.dart';

class SelectCity extends StatefulWidget {
  const SelectCity({super.key});
  @override
  State<SelectCity> createState() => _SelectCityState();
}

class _SelectCityState extends State<SelectCity> {
  final TextEditingController controller = TextEditingController();

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
        actions: [
          IconButton(
              onPressed: () async {},
              icon: Icon(
                Icons.location_on,
                size: 30,
                color: AppPallete.primary,
              ))
        ],
      ),
      body: Center(
        child: Text(controller.text),
      ),
    );
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
