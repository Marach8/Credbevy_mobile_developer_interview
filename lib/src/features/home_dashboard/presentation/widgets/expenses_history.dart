import 'package:credbevy_task/src/global_export.dart';

class TxnHistoryWidget extends ConsumerWidget {
  const TxnHistoryWidget({
    super.key,
  });

  @override
  Widget build(context, ref) {
    final expenses = ref.watch(expensesProvider);
    return Expanded(
      child: CredBevyScalingAnimatedSwitcher(
        child: expenses is AsyncLoading ? Padding(
          key: ValueKey(0),
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: CredBevyLoadingIndicator(),
        )
        : (expenses.value ?? []).isEmpty ? Padding(
          key: ValueKey(1),
          padding: const EdgeInsets.only(bottom: 50),
          child: CredBevyRefreshWidget(
            text: CredBevyStrings.DATA_UNAVAILABLE,
            showImage: true, color: CredBevyColors.black,
            onRefresh: () async{
              final response = await  ref.read(expensesProvider.notifier).fetchExpenses();
              if(context.mounted && !response.isSuccessful!){
                showAppNotification(
                  context: context,
                  icon: Icon(Icons.warning, color: CredBevyColors.red,),
                  text: response.responseMessage ?? ''
                );
              }
            },
          ),
        ) : ListView.builder(
          key: ValueKey(2),
          itemCount: expenses.value?.length,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (_, listIndex){
            final expense = expenses.value?.elementAtOrNull(listIndex);
            return CredBevyContainer(
              color: CredBevyColors.white, radius: 24,
              margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
              padding: const EdgeInsets.fromLTRB(20, 24, 20, 24),
              boxShadow: [
                BoxShadow(
                  spreadRadius: 0, blurRadius: 60,
                  offset: Offset(0, 30),
                  color: CredBevyColors.hex8A959E.withValues(alpha: 0.5)
                )
              ],
              child: Row(
                children: [
                  CredBevyContainer(
                    height: 38, width: 38,
                    color: CredBevyColors.black,
                    alignment: Alignment.center,
                    //The endpoint for expenses did not include the urls for the leading images,
                    //So I had to use the first one
                    child: Text(
                      'UBER',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: CredBevyFontWeights.w600
                      )
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Uber Ride',
                          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: CredBevyColors.hex454545
                          )
                        ),
                        Text(
                          expense?.month ?? '',
                          style: Theme.of(context).textTheme.labelLarge
                        ),
                      ],
                    ),
                  ),
        
                  Text(
                    '-\$${expense?.amountSpent.toString().formatPrice()}',
                    style: Theme.of(context).textTheme.headlineSmall
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

