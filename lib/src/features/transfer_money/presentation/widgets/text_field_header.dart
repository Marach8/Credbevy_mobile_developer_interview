import 'package:credbevy_task/src/global_export.dart';


class TextFieldHeader extends StatelessWidget {
  final String title;
  const TextFieldHeader({super.key, required this.title});

  @override
  Widget build(context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.bodySmall?.copyWith(
        color: CredBevyColors.hex212B36
      )
    );
  }
}