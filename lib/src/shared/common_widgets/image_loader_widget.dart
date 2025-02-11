import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ShamaImgLoader extends StatelessWidget {
  final String imagePath;
  final String? package;
  final BoxFit boxFit;
  final double? height, width;

  const ShamaImgLoader({
    super.key,
    required this.imagePath,
    this.height = 35,
    this.width = 35,
    this.package,
    this.boxFit = BoxFit.contain
  });

  @override
  Widget build(BuildContext context) {
    final imageExtension = imagePath.split('.').last;

    if(imagePath.startsWith('http://') || imagePath.startsWith('https://') ){
      return Image.network(
        imagePath, 
        fit: boxFit,
        height: height,
        width: width,
      );
    }

    else if(imageExtension == 'jpg' || imageExtension == 'png'){
      return Image.asset(
        imagePath,
        fit: boxFit,
        height: height,
        width: width,
        package: package,
      );
    }

    else if(imageExtension == 'svg'){
      return SvgPicture.asset(
        imagePath, 
        fit: boxFit,
        height: height,
        width: width,
        package: package,
      );
    }

    //This should never happen
    else{
      return const SizedBox.shrink();
    }
  }
}