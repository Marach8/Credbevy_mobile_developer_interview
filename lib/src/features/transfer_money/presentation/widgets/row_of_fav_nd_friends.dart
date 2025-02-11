import 'package:credbevy_task/src/global_export.dart';

class RowOfFavAndFriendsWidget extends StatelessWidget {
  const RowOfFavAndFriendsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CredBevyContainer(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
          radius: 24,
          border: Border.all(width: 0.5, color: CredBevyColors.hex444449),
          child: Row(
            children: [
              Icon(Iconsax.star1, size: 20, color: CredBevyColors.hex444449,),
              const SizedBox(width: 5),
              Text(
                CredBevyStrings.FAV,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: CredBevyFontSizes.size16,
                  color: CredBevyColors.hex444449
                )
              )
            ],
          ),
        ),
        const SizedBox(width: 10),
        CredBevyContainer(
          padding: const EdgeInsets.fromLTRB(15, 8, 16, 8),
          radius: 24,
          border: Border.all(width: 0.5, color: CredBevyColors.hex444449.withValues(alpha: 0.5)),
          child: Row(
            children: [
              CredBevImgLoader(
                imagePath: CredBevyImgStrings.FRIEND_ICON,
                width: 18, height: 20,
              ),
              const SizedBox(width: 5),
              Text(
                CredBevyStrings.ALL_FRNDS,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: CredBevyFontSizes.size16,
                  color: CredBevyColors.hex444449.withValues(alpha: 0.5)
                )
              )
            ],
          ),
        ),
        const Spacer(),
    
        CredBevyContainer(
          height: 36, width: 36,
          boxShape: BoxShape.circle,
          border: Border.all(width: 0.5, color: CredBevyColors.hex444449),
          child: Icon(Icons.add, color: CredBevyColors.hex444449,),
        )
      ],
    );
  }
}