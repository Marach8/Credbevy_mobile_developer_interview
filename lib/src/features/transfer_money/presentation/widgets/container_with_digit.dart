import 'package:credbevy_task/src/global_export.dart';

class ContainerWithInteger extends StatelessWidget {
  final String number;
  const ContainerWithInteger({
    super.key,
    required this.number
  });

  @override
  Widget build(BuildContext context) {
    return CredBevyContainer(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      radius: 24,
      border: Border.all(width: 0.5, color: CredBevyColors.hex444449),
      child: Text(
        number,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          fontSize: CredBevyFontSizes.size16,
          color: CredBevyColors.hex444449
        )
      ),
    );
  }
}