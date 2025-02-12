import 'package:credbevy_task/src/global_export.dart';

class CredBevTrnsfrMoneyScreen extends StatefulWidget {
  const CredBevTrnsfrMoneyScreen({super.key});

  @override
  State<CredBevTrnsfrMoneyScreen> createState() => _CredBevTrnsfrMoneyScreenState();
}

class _CredBevTrnsfrMoneyScreenState extends State<CredBevTrnsfrMoneyScreen> {
  late TextEditingController _nameCntrl, _amtCntrl, _refCntrl;
  final _formKey = GlobalKey<FormState>();
  final _validator = Validator();

  @override 
  void initState(){
    super.initState();
    _nameCntrl = TextEditingController();
    _amtCntrl = TextEditingController();
    _refCntrl = TextEditingController();
  }

  @override
  void dispose(){
    _nameCntrl.dispose();
    _amtCntrl.dispose();
    _refCntrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CredBevyAnnotatedRegion(
      child: Scaffold(
        appBar: CredBevyAppBar(
          leadingWidth: 46,
          leading: CredBevyContainer(
            onTap: () => Navigator.pop(context),
            boxShape: BoxShape.circle,
            height: 46, width: 46,
            padding: const EdgeInsets.fromLTRB(10.5, 0, 10.5, 0),
            color: CredBevyColors.hexF0F0F0,
            child: Icon(Icons.home_outlined)
          ),
          actions: [
            CredBevyContainer(
              height: 46, width: 46,
              boxShape: BoxShape.circle,
              color: CredBevyColors.black
            )
          ],
        ),

        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  CredBevyStrings.CURRENT_BALANCE,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Consumer(
                  builder: (_, ref, __) {
                    final balance = ref.watch(balanceProvider);
                    return CredBevyScalingAnimatedSwitcher(
                      child: balance is AsyncLoading ? 
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                          child: CredBevyLoadingIndicator(key: ValueKey(0), size: 25),
                        ) : 
                        (balance.value == null) ? CredBevyRefreshWidget(
                          key: ValueKey(1), color: CredBevyColors.black,
                          onRefresh: () async{
                            final response = await ref.watch(balanceProvider.notifier).fetchbalance();
                            if(context.mounted && !response.isSuccessful!){
                              showAppNotification(
                                context: context,
                                icon: Icon(Icons.warning, color: CredBevyColors.red,),
                                text: response.responseMessage ?? ''
                              );
                            }
                          },
                        ) :
                        Text(
                        key: ValueKey(2),
                        '\$${balance.value?.data.toString().formatPrice()}',
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                    );
                  }
                ),
              ),
              const SizedBox(height: 40),
          
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: RowOfFavAndFriendsWidget(),
              ),
          
              const SizedBox(height: 25),
          
              Align(
                alignment: Alignment.center,
                child: const Beneficiaries()
              ),
          
              const SizedBox(height: 10),
          
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TextFieldHeader(title: CredBevyStrings.NAME),
                      const SizedBox(height: 8,),
                      Consumer(
                        builder: (_, ref, __) {
                          final selectedName = ref.watch(globalStringProvider(CredBevyStrings.NAME));
                          Future.delayed(
                            const Duration(milliseconds: 200),
                            () => _nameCntrl.text = selectedName
                          );
                          return CredBevyTextField(
                            controller: _nameCntrl,
                            hintText: CredBevyStrings.SAMPLE_NAME,
                            validator: _validator.validateEmptyField,
                          );
                        }
                      ),
                      
                      const SizedBox(height: 20,),
                      const TextFieldHeader(title: CredBevyStrings.AMOUNT),
                      const SizedBox(height: 8,),
                      Consumer(
                        builder: (_, ref, __) {
                          final amount = ref.watch(globalStringProvider(CredBevyStrings.AMOUNT));
                          Future.delayed(
                            const Duration(milliseconds: 200),
                            () => _amtCntrl.text = amount
                          );
                          return CredBevyTextField(
                            controller: _amtCntrl,
                            hintText: CredBevyStrings.HOW_MUCH_2_SEND,
                            inputType: TextInputType.number,
                            validator: _validator.validateDouble,
                          );
                        }
                      ),
                      const SizedBox(height: 7),
                  
                      Row(
                        children: [
                          ContainerWithInteger(number: '+10', amtCntrl: _amtCntrl),
                          const SizedBox(width: 8),
                          ContainerWithInteger(number: '+100', amtCntrl: _amtCntrl),
                          const SizedBox(width: 8),
                          ContainerWithInteger(number: '-10', amtCntrl: _amtCntrl),
                          const SizedBox(width: 8),
                          ContainerWithInteger(number: '-100', amtCntrl: _amtCntrl),
                          const Spacer()
                        ],
                      ),
                  
                  
                      const SizedBox(height: 20),
                      const TextFieldHeader(title: CredBevyStrings.REFERENCE),
                      const SizedBox(height: 8,),
                      CredBevyTextField(
                        controller: _refCntrl,
                        hintText: CredBevyStrings.TRSF_REASON,
                        validator: _validator.validateEmptyField,
                      ),
                      const SizedBox(height: 100)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

        bottomSheet: CredBevyContainer(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 5),
          width: CredBevyHelperFuncs.getScreenWidth(context),
          child: Consumer(
            builder: (_, ref, __) {
              final isLoading = ref.watch(sendMoneyProvider) is AsyncLoading;
              return ElevatedButton.icon(
                onPressed: isLoading ? null : ()async{
                  final name = _nameCntrl.text.trim();
                  final amount = _amtCntrl.text.trim();
                  final reference = _refCntrl.text.trim();

                  if(_formKey.currentState?.validate() ?? false){
                    final response = await ref.read(sendMoneyProvider.notifier).sendMoney(
                      receiverName: name,
                      amount: amount
                    );
                    if(context.mounted && response.isSuccessful!){
                      //Reset inputs
                      _amtCntrl.clear(); _nameCntrl.clear(); _refCntrl.clear();
                      ref.invalidate(globalStringProvider(CredBevyStrings.NAME));
                      ref.invalidate(globalStringProvider(CredBevyStrings.AMOUNT));

                      Navigator.of(context).pushNamed(
                        CredBevyRoutes.SUCCESS_SCREEN,
                        arguments: [amount, name, reference]
                      );
                    }
                    else if(context.mounted && !response.isSuccessful!){
                      showAppNotification(
                        context: context,
                        icon: Icon(Icons.warning, color: CredBevyColors.red,),
                        text: response.responseMessage ?? ''
                      );
                    }
                  }
                },
                icon: CredBevyContainer(
                  padding: const EdgeInsets.all(1), radius: 3,
                  border: Border.all(color: CredBevyColors.hexF0F0F0),
                  child: Icon(Iconsax.arrow_swap_horizontal, color: CredBevyColors.hexF0F0F0, size: 15,),
                ),
                label: isLoading ? CredBevyLoadingIndicator(
                  color: CredBevyColors.hex1B1B1B,
                ) : Text(CredBevyStrings.SEND_MONEY),
              );
            }
          ),
        ),
      ),
    );
  }
}