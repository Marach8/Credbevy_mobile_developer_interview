import 'package:credbevy_task/src/global_export.dart';
import 'package:credbevy_task/src/shared/utils/constants/colors.dart';
import 'package:flutter/services.dart';

class ShamaAnnotatedRegionWidget extends StatelessWidget {
  final Widget child;
  final Brightness? brightness;
  final Color? bgColor;

  const ShamaAnnotatedRegionWidget({
    super.key,
    required this.child,
    this.bgColor,
    this.brightness
  });

  @override
  Widget build(context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: bgColor ?? CredBevColors.white,
        statusBarColor: bgColor ?? CredBevColors.white,
        statusBarIconBrightness: brightness ?? Brightness.dark,
        systemNavigationBarIconBrightness: brightness ?? Brightness.dark
      ),
      child: child
    );
  }
}