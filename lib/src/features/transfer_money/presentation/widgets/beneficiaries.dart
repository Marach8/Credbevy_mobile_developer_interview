import 'package:credbevy_task/src/global_export.dart';

class Beneficiaries extends ConsumerWidget {
  const Beneficiaries({super.key});

  @override
  Widget build(context, ref) {
    final beneficiaries = ref.watch(beneficiariesProvider);
    
    return CredBevyScalingAnimatedSwitcher(
      child: beneficiaries is AsyncLoading ? Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: CredBevyLoadingIndicator(),
        ),
      )
      : (beneficiaries.value ?? []).isEmpty ? CredBevyRefreshWidget(
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
      ) : SizedBox(
        height: 180,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: beneficiaries.value?.length,
          itemBuilder: (_, listIndex){
            final beneficiary = beneficiaries.value?.elementAtOrNull(listIndex);
            final noImage = (beneficiary?.image ?? '').isEmpty;
            return Consumer(
              builder: (_, ref1, __) {
                final index = ref.watch(globalIntProvider(CredBevyRoutes.TRANSFER_MONEY_SCREEN));
                final isSelected = listIndex == index;
                
                return CredBevyContainer(
                  onTap: (){
                    CredBevyHelperFuncs.setAProvider(
                      provider: globalIntProvider(CredBevyRoutes.TRANSFER_MONEY_SCREEN),
                      value: listIndex, widgetRef: ref,
                    );
                    CredBevyHelperFuncs.setAProvider(
                      provider: globalStringProvider(CredBevyStrings.NAME),
                      value: beneficiary?.fullname ?? CredBevyStrings.NAME,
                      widgetRef: ref1
                    );
                  },
                  margin: const EdgeInsets.only(left: 20, bottom: 20),
                  radius: 23, duration: 200,
                  padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                  color: isSelected ? CredBevyColors.hex171728 : CredBevyColors.white,
                  boxShadow: [
                    BoxShadow(
                      spreadRadius: 0, blurRadius: 4,
                      offset: Offset(0, 2),
                      color: CredBevyColors.hex8A959E.withValues(alpha: 0.2)
                    )
                  ],
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CredBevyContainer(
                        height: 64, width: 64,
                        boxShape: BoxShape.circle,
                        color: CredBevyColors.hex8A959E,
                        child: noImage ? 
                          FittedBox(
                            child: Text(
                              maxLines: 2,
                              CredBevyStrings.IMG_UNAVAILABLE,
                              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                                color: CredBevyColors.black,
                                fontWeight: CredBevyFontWeights.w700
                              )
                            ),
                          ) :
                          CredBevImgLoader(imagePath: beneficiary?.image ?? ''),
                      ),
                      Text(
                        beneficiary?.fullname ?? '',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: CredBevyFontSizes.size16,
                          color: isSelected ? CredBevyColors.hexF0F0F0 : CredBevyColors.hex1B1B1B,
                        ),
                      ),
                      Icon(
                        Iconsax.star1, size: 16,
                        color: isSelected ? CredBevyColors.hexF0F0F0 : CredBevyColors.black,
                      )
                    ],
                  ),
                );
              }
            );
          }
        ),
      ),
    );
  }
}
