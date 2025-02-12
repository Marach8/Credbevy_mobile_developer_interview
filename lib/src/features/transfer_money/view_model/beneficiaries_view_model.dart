import 'package:credbevy_task/src/global_export.dart';

final beneficiariesProvider =
  StateNotifierProvider<BeneficiariesNotifier, AsyncValue<List<User>?>>(
    (ref) => BeneficiariesNotifier(ref)
);

class BeneficiariesNotifier extends StateNotifier<AsyncValue<List<User>?>> {
  BeneficiariesNotifier(this.ref)
    : transferRepo = ref.read(transferRepoProvider),
      super(const AsyncData(null));

  final Ref ref;
  final TransferRepo transferRepo;

  Future<GenericResponseModel> fetchBeneficiaries() async {
    //To prevent redundant api calls 
    if((state.value ?? []).isEmpty) {
      state = const AsyncLoading(); 
      try{
        final response = await transferRepo.fetchBeneficiaries();

        final result = response.when(
          successful: (result){
            final beneficiaries = result.data?.data;
            state = AsyncData(beneficiaries);
            
            //Immediately we are done fetching beneficiaries, set the name of the 
            //first beneficiary to be the hinttext of the  "Name" textfield
            CredBevyHelperFuncs.setAProvider(
              provider: globalStringProvider(CredBevyStrings.NAME),
              value: beneficiaries?.first.fullname ?? CredBevyStrings.NAME,
              ref: ref
            );

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