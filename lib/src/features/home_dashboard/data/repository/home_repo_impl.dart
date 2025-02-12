import 'package:credbevy_task/src/global_export.dart';

final homeRepoProvider = Provider<HomeRepoImpl>((ref){
  final networkService = ref.read(networkServiceProvider);
  return HomeRepoImpl(networkService, ref);
});


class HomeRepoImpl implements HomeRepo {
  HomeRepoImpl(this.networkService, this.ref);

  final NetworkService networkService;
  final Ref ref;

  @override
  Future<ApiResponse<CardsResponseModel>> fetchCreditCards() async{
    try {
      final response = await networkService.get(
        CredBevyUrls.CARDS
      );

      return Successful(
        data: CardsResponseModel.fromJson(response.data),
      );
    } catch (e) {
      return Error(error: CredBevyException.getException(e));
    }
  }


  @override
  Future<ApiResponse<ExpensesResponseModel>> fetchExpenses() async{
    try {
      final response = await networkService.get(
        CredBevyUrls.MY_EXPENSES
      );

      return Successful(
        data: ExpensesResponseModel.fromJson(response.data),
      );
    } catch (e) {
      return Error(error: CredBevyException.getException(e));
    }
  }
}
