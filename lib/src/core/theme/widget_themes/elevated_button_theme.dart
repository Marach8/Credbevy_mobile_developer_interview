import 'package:credbevy_task/src/global_export.dart';

class CredBevyElevatedButtonTheme{
  const CredBevyElevatedButtonTheme._();

  static ElevatedButtonThemeData lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: CredBevyColors.hexF0F0F0,
      fixedSize: Size(0, 52),
      backgroundColor: CredBevyColors.hex171728,
      textStyle: TextStyle(
        fontFamily: CredBevyStrings.INTER,
        fontSize: CredBevyFontSizes.size16,
        fontWeight: CredBevyFontWeights.w700,
        color: CredBevyColors.hexF0F0F0,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))
    )
  );

  //darkTheme will be implemented here
}