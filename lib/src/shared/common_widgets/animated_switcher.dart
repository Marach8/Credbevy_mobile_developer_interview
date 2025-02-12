import 'package:credbevy_task/src/global_export.dart';

class CredBevyScalingAnimatedSwitcher extends StatelessWidget {
  final Widget child;
  final int? duration;
  const CredBevyScalingAnimatedSwitcher({
    super.key,
    required this.child,
    this.duration
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: duration ?? 500),
      reverseDuration: Duration(milliseconds: duration ?? 500),
      switchInCurve: Curves.easeIn,
      switchOutCurve: Curves.easeIn,
      transitionBuilder: (child, animation) {
        return ScaleTransition(
          scale: animation,
          child: child
        );
      },
      child: child
    );
  }
}
