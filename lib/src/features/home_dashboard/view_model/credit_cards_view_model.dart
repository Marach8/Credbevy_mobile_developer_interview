import 'package:credbevy_task/src/global_export.dart';

final creditCardsProvider =
  StateNotifierProvider<CreditCardsNotifier, AsyncValue<List<CardInfo>?>>(
    (ref) => CreditCardsNotifier(ref)
);

class CreditCardsNotifier extends StateNotifier<AsyncValue<List<CardInfo>?>> {
  CreditCardsNotifier(this.ref)
    : homeRepo = ref.read(homeRepoProvider),
      super(const AsyncData(null));

  final Ref ref;
  final HomeRepo homeRepo;


  Future<GenericResponseModel> fetchCreditCards() async {   
    state = const AsyncLoading(); 
    try{
      final response = await homeRepo.fetchCreditCards();

      final result = response.when(
        successful: (result){
          final listOfCards = result.data?.data;
          state = AsyncData(listOfCards);
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
}