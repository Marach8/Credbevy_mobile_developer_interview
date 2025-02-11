import 'package:credbevy_task/src/global_export.dart';

class CredBevyOutlinedButtonTheme{
  const CredBevyOutlinedButtonTheme._();

  static OutlinedButtonThemeData lightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: CredBevyColors.hex444449,
      fixedSize: Size(0, 52),
      backgroundColor: CredBevyColors.white,
      textStyle: TextStyle(
        fontFamily: CredBevyStrings.INTER,
        fontSize: CredBevyFontSizes.size16,
        fontWeight: CredBevyFontWeights.w700,
        color: CredBevyColors.hex444449,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: CredBevyColors.hex444449,
          width: 0.5
        )
      )
    )
  );

  //Implement for dark Theme here
}