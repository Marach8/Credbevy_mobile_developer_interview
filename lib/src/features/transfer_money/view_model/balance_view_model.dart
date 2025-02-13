import 'package:credbevy_task/src/global_export.dart';

final balanceProvider =
  StateNotifierProvider<BalanceNotifier, AsyncValue<BalanceResponseModel?>>(
    (ref) => BalanceNotifier(ref)
);

class BalanceNotifier extends StateNotifier<AsyncValue<BalanceResponseModel?>> {
  BalanceNotifier(this.ref)
    : transferRepo = ref.read(transferRepoProvider),
      super(const AsyncData(null));

  final Ref ref;
  final TransferRepo transferRepo;

  Future<GenericResponseModel> fetchBalance() async {
    //To prevent redundant fetches 
    if(state.value == null) {
      state = const AsyncLoading(); 
      try{
        final response = await transferRepo.fetchBalance();

        final result = response.when(
          successful: (result){
            state = AsyncData(result.data);
            return GenericResponseModel(
              isSuccessful: true,
              responseMessage: result.data?.message ?? CredBevyStrings.SUCCESSFUL
            );
          },
          
          error: (error){
            state = AsyncData(null);
            return GenericResponseModel(
              isSuccessful: false,
              responseMessage: error.error.message
            );
          }
        );

        return result;
      }
      catch (e){
        state = AsyncData(null);
        return GenericResponseModel(
          isSuccessful: false,
          responseMessage: e.toString()
        );
      }
    }

    return GenericResponseModel(
      isSuccessful: true,
      responseMessage: CredBevyStrings.SUCCESSFUL
    );
  }
}