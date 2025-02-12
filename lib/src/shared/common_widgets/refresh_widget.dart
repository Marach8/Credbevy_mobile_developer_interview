import 'package:credbevy_task/src/global_export.dart';

class CredBevyRefreshWidget extends StatelessWidget {
  final VoidCallback? onRefresh;
  final String? text;
  final Color? color;
  final bool? showImage;
  final double? imageHeight;
  final Widget? child;
  const CredBevyRefreshWidget({
    super.key, 
    this.onRefresh,
    this.color,
    this.text,
    this.showImage,
    this.imageHeight,
    this.child
  });

  @override
  Widget build(context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if(showImage ?? false) CredBevImgLoader(
            imagePath: CredBevyImgStrings.EMPTY_STATE,
            height: imageHeight ?? 200,
          ),
          if(text != null)
            Text(text ?? '', style: Theme.of(context).textTheme.titleMedium),
          if(text != null || showImage != null) const SizedBox(height: 20),
          if(onRefresh != null) GestureDetector(
            onTap: onRefresh,
            child: Icon(Iconsax.refresh, color: color)
          ),
        ],
      ),
    );
  }
}

