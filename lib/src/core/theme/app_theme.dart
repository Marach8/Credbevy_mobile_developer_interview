import 'package:credbevy_task/src/global_export.dart';

class CredBevThemeData{
  const CredBevThemeData._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: CredBevyStrings.INTER,
    brightness: Brightness.light,
    scaffoldBackgroundColor: CredBevyColors.white,
    textTheme: CredBevyTextTheme.lightTextTheme,
    iconTheme: CredBevyIconTheme.lightIconTheme,
    inputDecorationTheme: CredBevyInputDecorationTheme.lightInputDecorationTheme,
    elevatedButtonTheme: CredBevyElevatedButtonTheme.lightElevatedButtonTheme,
    appBarTheme: CredBevAppBarTheme.lightAppBarTheme,
    bottomSheetTheme: CredBevyBottomSheetTheme.lightBottomSheetTheme,
    outlinedButtonTheme: CredBevyOutlinedButtonTheme.lightOutlinedButtonTheme,
  );


  //darkTheme will be added here when the need arises
}
