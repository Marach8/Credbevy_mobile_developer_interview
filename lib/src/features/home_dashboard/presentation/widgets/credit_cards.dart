import 'package:credbevy_task/src/global_export.dart';

class CreditCardsViewWidget extends ConsumerWidget {
  const CreditCardsViewWidget({super.key});

  @override
  Widget build(context, ref) {
    final creditCards = ref.watch(creditCardsProvider);
    return CredBevyScalingAnimatedSwitcher(
      child: creditCards is AsyncLoading ? Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: CredBevyLoadingIndicator(),
      )
      : (creditCards.value ?? []).isEmpty ? CredBevyRefreshWidget(
        text: CredBevyStrings.DATA_UNAVAILABLE,
        showImage: true, color: CredBevyColors.black,
        onRefresh: () async{
          final response = await  ref.read(creditCardsProvider.notifier).fetchCreditCards();
          if(context.mounted && !response.isSuccessful!){
            showAppNotification(
              context: context,
              icon: Icon(Icons.warning, color: CredBevyColors.red,),
              text: response.responseMessage ?? ''
            );
          }
        },
      ) : CredBevyContainer(
        boxShadow: [
          BoxShadow(
            spreadRadius: 0, blurRadius: 30,
            offset: Offset(0, 10),
            color: CredBevyColors.hexFBAEEE.withValues(alpha: 0.3713)
          )
        ],
        height: 190,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: creditCards.value?.length,
          itemBuilder: (_, listIndex){
            final card = creditCards.value?.elementAtOrNull(listIndex);
            return CredBevyContainer(
              margin: const EdgeInsets.only(left: 20),
              radius: 23, width: 288,
              padding: const EdgeInsets.all(20),
              color: Colors.black,
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: listIndex == 0 ? [
                  CredBevyColors.hexFF78ED,
                  CredBevyColors.hexFFC3E0,
                ]: [
                  CredBevyColors.hex5FAFD3,
                  CredBevyColors.hexD3E8E1,
                ]
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        card?.bankName ?? '',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
      
                      CredBevyContainer(
                        height: 28, width: 44,
                        color: CredBevyColors.white
                      )
                    ],
                  ),
      
                  const Spacer(),
                  Text(
                    card?.cardNumber ?? '',
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
                            card?.name ?? '',
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
                            card?.expiryDate ?? '',
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
      ),
    );
  }
}
