import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ibadahku/src/core/theme/app_pallete.dart';

class ActionAyatWidget extends StatelessWidget {
  final IconData? icon;
  final String? svg;
  const ActionAyatWidget({super.key, this.icon, this.svg});

  @override
  Widget build(BuildContext context) {
    return icon != null
        ? Icon(
            icon,
            color: AppPallete.primary,
            size: 35,
          )
        : SvgPicture.asset(svg!);
  }
}
