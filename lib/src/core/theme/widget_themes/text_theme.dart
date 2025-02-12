import 'package:credbevy_task/src/global_export.dart';

class CredBevyTextTheme{
  const CredBevyTextTheme._();

  static TextTheme lightTextTheme = TextTheme( 
    
    // displayLarge: TextStyle(
    //   color: CredBevyColors.hexF0F0F0,
    //   fontSize: CredBevyFontSizes.size20,
    //   fontWeight: CredBevyFontWeights.w800,
    //   overflow: TextOverflow.ellipsis,
    // ),
 
    // displayMedium: TextStyle(
    //   color: ShamaColors.white,
    //   fontSize: ShamaFontSizes.size34,
    //   fontWeight: ShamaFontWeights.w500,
    //   overflow: TextOverflow.ellipsis,
    // ),
    
    displaySmall: TextStyle(
      color: CredBevyColors.hex1B1B1B,
      fontSize: CredBevyFontSizes.size30,
      fontWeight: CredBevyFontWeights.w800,
      overflow: TextOverflow.ellipsis,
    ),

    headlineLarge: TextStyle(
      color: CredBevyColors.hex1B1B1B,
      fontSize: CredBevyFontSizes.size26,
      fontWeight: CredBevyFontWeights.w700,
      overflow: TextOverflow.ellipsis,
    ),

    // headlineMedium: TextStyle(
    //   color: ShamaColors.white,
    //   fontSize: ShamaFontSizes.size16,
    //   fontWeight: ShamaFontWeights.w700,
    //   overflow: TextOverflow.ellipsis,
    // ),

    headlineSmall: TextStyle(
      color: CredBevyColors.hex1B1B2F,
      fontSize: CredBevyFontSizes.size16,
      fontWeight: CredBevyFontWeights.w700,
      overflow: TextOverflow.ellipsis,
    ),

  //   titleLarge: TextStyle(
  //     color: ShamaColors.white,
  //     fontSize: ShamaFontSizes.size28,
  //     fontWeight: ShamaFontWeights.w200,
  //     overflow: TextOverflow.ellipsis,
  //   ),

    titleMedium: TextStyle(
      color: CredBevyColors.hex212B36,
      fontSize: CredBevyFontSizes.size14,
      fontWeight: CredBevyFontWeights.w500,
      overflow: TextOverflow.ellipsis,
    ),

    titleSmall: TextStyle(
      color: CredBevyColors.hex1B1B2F,
      fontSize: CredBevyFontSizes.size16,
      fontWeight: CredBevyFontWeights.w500,
      overflow: TextOverflow.ellipsis,
    ),

    bodyLarge: TextStyle(
      color: CredBevyColors.white,
      fontSize: CredBevyFontSizes.size20,
      fontWeight: CredBevyFontWeights.w400,
      overflow: TextOverflow.ellipsis,
    ),
    
    bodyMedium: TextStyle(
      color: CredBevyColors.hex1B1B1B,
      fontSize: CredBevyFontSizes.size15,
      fontWeight: CredBevyFontWeights.w400,
      overflow: TextOverflow.ellipsis,
    ),
    

    bodySmall: TextStyle(
      color: CredBevyColors.white,
      fontSize: CredBevyFontSizes.size14,
      fontWeight: CredBevyFontWeights.w400,
      overflow: TextOverflow.ellipsis,
    ),
    

    labelLarge: TextStyle(
      color: CredBevyColors.hex8A959E.withValues(alpha: 0.8),
      fontSize: CredBevyFontSizes.size12,
      fontWeight: CredBevyFontWeights.w400,
      overflow: TextOverflow.ellipsis,
    ),
    
    labelMedium: TextStyle(
      color: CredBevyColors.white,
      fontSize: CredBevyFontSizes.size10,
      fontWeight: CredBevyFontWeights.w400,
      overflow: TextOverflow.ellipsis,
    ),

  //   labelSmall: TextStyle(
  //     color: ShamaColors.white,
  //     fontSize: ShamaFontSizes.size8,
  //     fontWeight: ShamaFontWeights.w200,
  //     overflow: TextOverflow.ellipsis,
  //   ),
  );


  //implement darkTextTheme here
}