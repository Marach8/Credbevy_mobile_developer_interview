import 'package:credbevy_task/src/global_export.dart';

class CredBevyElevetedBtn extends StatelessWidget {
  final VoidCallback onPressed;
  final String? btnTitle;
  final Widget? child;
  const CredBevyElevetedBtn({
    super.key,
    required this.onPressed,
    this.btnTitle,
    this.child
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: child ?? Text(btnTitle ?? ''),
    );
  }
}