import 'package:credbevy_task/src/global_export.dart';

class ListOfNames extends StatelessWidget {
  const ListOfNames({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 176,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (_, listIndex){
          return CredBevyContainer(
            margin: const EdgeInsets.only(left: 20),
            radius: 23,
            padding: const EdgeInsets.all(20),
            color: Colors.black,
            width: 137,
            boxShadow: [
              BoxShadow(
                spreadRadius: 0, blurRadius: 4,
                offset: Offset(0, 2),
                color: CredBevyColors.hex8A959E
              )
            ],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CredBevyContainer(
                  height: 64, width: 64,
                  color: Colors.green,
                  boxShape: BoxShape.circle,
                ),
                const SizedBox(height: 10,),
                Text(
                  'Chase Bank',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: CredBevyFontSizes.size16,
                    color: CredBevyColors.hexF0F0F0
                  ),
                ),
                const SizedBox(height: 20,),
                Icon(Iconsax.star1, size: 20)
              ],
            ),
          );
        }
      ),
    );
  }
}
