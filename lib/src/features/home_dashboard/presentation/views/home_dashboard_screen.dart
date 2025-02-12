import 'package:credbevy_task/src/global_export.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CredBevyHomeScreen extends ConsumerStatefulWidget {
  const CredBevyHomeScreen({super.key});

  @override
  ConsumerState<CredBevyHomeScreen> createState() => _CredBevyHomeScreenState();
}

class _CredBevyHomeScreenState extends ConsumerState<CredBevyHomeScreen> {
  @override
  void initState(){
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _performInitializations());
  }

  void _performInitializations(){
    ref.read(creditCardsProvider.notifier).fetchCreditCards();
    ref.read(expensesProvider.notifier).fetchExpenses();
  }


  @override
  Widget build(BuildContext context) {
    return CredBevyAnnotatedRegion(
      child: Scaffold(
        appBar: CredBevyAppBar(
          leadingWidth: 46,
          leading: CredBevyContainer(
            boxShape: BoxShape.circle,
            height: 46, width: 46,
            padding: const EdgeInsets.fromLTRB(10.5, 0, 10.5, 0),
            color: CredBevyColors.hexF0F0F0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                3,
                (_) => CredBevyContainer(
                  boxShape: BoxShape.circle,
                  height: 7, width: 7,
                  border: Border.all(width: 2, color: CredBevyColors.black),
                )
              )
            ),
          ),
          actions: [
            CredBevyContainer(
              height: 46, width: 46,
              boxShape: BoxShape.circle,
              color: CredBevyColors.black
            )
          ],
        ),

        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  CredBevyStrings.MY_CARDS,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
            ),
            const SizedBox(height: 10),
        
            const CreditCardsViewWidget(),
        
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    CredBevyStrings.TXN_HISTORY,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  Icon(Iconsax.filter, color: CredBevyColors.black)
                ],
              ),
            ),

            const SizedBox(height: 20,),
            const TxnHistoryWidget()
        
          ],
        ),
        bottomSheet: const _BottomButtons(),
      ),
    );
  }
}


class _BottomButtons extends StatelessWidget {
  const _BottomButtons();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton.icon(
              onPressed: (){},
              icon: FaIcon(FontAwesomeIcons.chartColumn, color: CredBevyColors.hex444449),
              label: Text(CredBevyStrings.ANALYTICS),
            )
          ),
          const SizedBox(width: 15),
          Expanded(
            child: ElevatedButton.icon(
              onPressed: () {
                final ref = CredBevyHelperFuncs.getRef(context);
                ref.read(balanceProvider.notifier).fetchbalance();
                ref.read(beneficiariesProvider.notifier).fetchBeneficiaries();
                Navigator.of(context).pushNamed(CredBevyRoutes.TRANSFER_MONEY_SCREEN);
              },
              icon: CredBevyContainer(
                padding: const EdgeInsets.all(1), radius: 3,
                border: Border.all(color: CredBevyColors.hexF0F0F0),
                child: Icon(Iconsax.arrow_swap_horizontal, color: CredBevyColors.hexF0F0F0, size: 15,),
              ),
              label: Text(CredBevyStrings.SEND_MONEY),
            ),
          )
        ],
      ),
    );
  }
}
