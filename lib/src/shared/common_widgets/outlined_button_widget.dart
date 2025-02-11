import 'package:credbevy_task/src/global_export.dart';

class CredBevyOutlinedBtn extends StatelessWidget {
  final VoidCallback onPressed;
  final String? btnTitle;
  final Widget? child;
  const CredBevyOutlinedBtn({
    super.key,
    required this.onPressed,
    this.btnTitle,
    this.child
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      child: child ?? Text(btnTitle ?? ''),
    );
  }
}