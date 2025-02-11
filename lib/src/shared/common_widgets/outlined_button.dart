import 'package:credbevy_task/src/global_export.dart';

class OutlinedBtn extends StatelessWidget {
  final VoidCallback onPressed;
  final String btnTitle;
  const OutlinedBtn({
    super.key,
    required this.onPressed,
    required this.btnTitle
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      child: Text(btnTitle),
    );
  }
}