import 'package:credbevy_task/src/global_export.dart';
import 'package:flutter/services.dart';

class CredBevyAnnotatedRegion extends StatelessWidget {
  final Widget child;
  final Brightness? brightness;
  final Color? bgColor;

  const CredBevyAnnotatedRegion({
    super.key,
    required this.child,
    this.bgColor,
    this.brightness
  });

  @override
  Widget build(context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: bgColor ?? CredBevyColors.white,
        statusBarColor: bgColor ?? CredBevyColors.white,
        statusBarIconBrightness: brightness ?? Brightness.dark,
        systemNavigationBarIconBrightness: brightness ?? Brightness.dark
      ),
      child: child
    );
  }
}