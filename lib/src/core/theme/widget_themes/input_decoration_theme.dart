import 'package:credbevy_task/src/global_export.dart';

class CredBevyInputDecorationTheme{
  const CredBevyInputDecorationTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 1,
    isDense: true,
    contentPadding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
    fillColor: CredBevyColors.transparent,
    filled: true,
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        width: 1.5,
        color: CredBevyColors.hexE0E0E0
      )
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        width: 1.5,
        color: CredBevyColors.red.withValues(alpha: 0.3)
      )
    ),

    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        width: 1.5,
        color: CredBevyColors.red.withValues(alpha: 0.8)
      )
    ),

    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        width: 1.5,
        color: CredBevyColors.hex444449
      )
    ),
  );


  //Implement for dark theme here
}