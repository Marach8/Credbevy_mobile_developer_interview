import 'package:credbevy_task/src/global_export.dart';

final expensesProvider =
  StateNotifierProvider<ExpensesNotifier, AsyncValue<List<ExpenseData>?>>(
    (ref) => ExpensesNotifier(ref)
);

class ExpensesNotifier extends StateNotifier<AsyncValue<List<ExpenseData>?>> {
  ExpensesNotifier(this.ref)
    : homeRepo = ref.read(homeRepoProvider),
      super(const AsyncData(null));

  final Ref ref;
  final HomeRepo homeRepo;


  Future<GenericResponseModel> fetchExpenses() async {  
    state = const AsyncLoading(); 
    try{
      final response = await homeRepo.fetchExpenses();

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