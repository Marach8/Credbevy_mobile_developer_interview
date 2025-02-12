import 'package:credbevy_task/src/global_export.dart';

class ContainerWithInteger extends StatelessWidget {
  final String number;
  final TextEditingController amtCntrl;
  const ContainerWithInteger({
    super.key,
    required this.number,
    required this.amtCntrl
  });

  @override
  Widget build(context) {
    return CredBevyContainer(
      onTap: ()  => CredBevyHelperFuncs.callDebouncer(
        200,
        (){
          final result = CredBevyHelperFuncs.add2OrSubtract4rmAmount(
            number2AddOrSubtractFrom: amtCntrl.text.trim(),
            numberBeingAddedOrSubtracted: number
          );

          if(result != null){
            CredBevyHelperFuncs.setAProvider(
              provider: globalStringProvider(CredBevyStrings.AMOUNT),
              value: result, context: context
            );
          }
          else{
            showAppNotification(
              context: context,
              icon: Icon(Icons.cancel, color: CredBevyColors.red,),
              text: CredBevyStrings.INVALID_INPUT
            );
          }
        }
      ),
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