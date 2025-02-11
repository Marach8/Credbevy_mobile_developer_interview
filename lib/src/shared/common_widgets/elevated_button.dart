
import 'package:credbevy_task/src/global_export.dart';

class GradientElevetedBtn extends StatelessWidget {
  final VoidCallback onPressed;
  final String btnTitle;
  const GradientElevetedBtn({
    super.key,
    required this.onPressed,
    required this.btnTitle
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(btnTitle),
    );
  }
}