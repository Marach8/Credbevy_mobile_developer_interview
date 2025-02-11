import 'package:credbevy_task/src/global_export.dart';

class CredBevOutlinedButtonTheme{
  const CredBevOutlinedButtonTheme._();

  static OutlinedButtonThemeData lightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      // backgroundColor: ShamaColors.white.withOpacity(0.09),
      // foregroundColor: ShamaColors.white,
      fixedSize: Size(0, 50),
      //side:  BorderSide(color: ShamaColors.hex1F1B4C),
      // textStyle: TextStyle(
      //   fontFamily: ShamaStrings.FUNNEL_SANS,
      //   fontSize: ShamaFontSizes.size16,
      //   fontWeight: ShamaFontWeights.w700
      // ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
        //side: BorderSide(color: ShamaColors.hex1F1B4C)
      )
    )
  );

  //Implement for dark Theme here
}