import 'package:credbevy_task/src/global_export.dart';

class CredBevElevatedButtonTheme{
  const CredBevElevatedButtonTheme._();

  static ElevatedButtonThemeData lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      //foregroundColor: ShamaColors.white,
      padding: EdgeInsets.symmetric(vertical: 10),
      fixedSize: Size(0, 56),
      // backgroundColor: ShamaColors.white,
      // textStyle: TextStyle(
      //   fontFamily: ShamaStrings.FUNNEL_SANS,
      //   fontSize: ShamaFontSizes.size16,
      //   fontWeight: ShamaFontWeights.w700
      // ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35))
    )
  );

  //darkTheme will be implemented here
}