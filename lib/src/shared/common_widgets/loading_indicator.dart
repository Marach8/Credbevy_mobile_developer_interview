import 'package:credbevy_task/src/global_export.dart';

class CredBevyLoadingIndicator extends StatelessWidget {
  final double? size, strokeWidth;
  final Color? color;
  const CredBevyLoadingIndicator({
    super.key,
    this.size,
    this.color,
    this.strokeWidth
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size, width: size,
      child: FittedBox(
        fit: BoxFit.cover,
        child: CircularProgressIndicator(
          strokeWidth: strokeWidth ?? 2,
          strokeCap: StrokeCap.round,
          backgroundColor: CredBevyColors.transparent,
          color: color
        ),
      ),
    );
  }
}