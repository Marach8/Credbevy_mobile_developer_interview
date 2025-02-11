import 'package:credbevy_task/src/global_export.dart';

class ListViewOfDebitCards extends StatelessWidget {
  const ListViewOfDebitCards({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 187,
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
            width: 288,
            boxShadow: [
              BoxShadow(
                spreadRadius: 0, blurRadius: 40,
                offset: Offset(0, 20),
                color: CredBevyColors.hexFBAEEE
              )
            ],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Chase Bank',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
    
                    CredBevyContainer(
                      height: 28, width: 44,
                      color: Colors.white,
                    )
                  ],
                ),
    
                const Spacer(),
                Text(
                  '1234456789876',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
    
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          CredBevyStrings.NAME.toUpperCase(),
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        Text(
                          'Chase Bank',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
    
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          CredBevyStrings.EXPIRY.toUpperCase(),
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        Text(
                          'Chase Bank',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
        }
      ),
    );
  }
}
