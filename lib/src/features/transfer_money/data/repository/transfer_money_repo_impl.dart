import 'package:credbevy_task/src/global_export.dart';


final transferRepoProvider = Provider<TransferRepoImpl>((ref){
  final networkService = ref.read(networkServiceProvider);
  return TransferRepoImpl(networkService, ref);
});


class TransferRepoImpl implements TransferRepo {
  TransferRepoImpl(this.networkService, this.ref);

  final NetworkService networkService;
  final Ref ref;

  @override
  Future<ApiResponse<BalanceResponseModel>> fetchBalance() async{
    try {
      final response = await networkService.get(
        CredBevyUrls.BALANCE
      );

      return Successful(
        data: BalanceResponseModel.fromJson(response.data),
      );
    } catch (e) {
      return Error(error: CredBevyException.getException(e));
    }
  }


  @override
  Future<ApiResponse<BeneficiariesResponseModel>> fetchBeneficiaries() async{
    try {
      final response = await networkService.get(
        CredBevyUrls.BENEFICIARIES
      );

      return Successful(
        data: BeneficiariesResponseModel.fromJson(response.data),
      );
    } catch (e) {
      return Error(error: CredBevyException.getException(e));
    }
  }



  @override
  Future<ApiResponse<GenericResponseModel>> sendMoney(
    {required SendMoneyRequestModel data}
  ) async{
    try {
      final response = await networkService.post(
        CredBevyUrls.TRANSFER,
        data: data.toJson()
      );

      return Successful(
        data: GenericResponseModel.fromJson(response.data),
      );
    } catch (e) {
      return Error(error: CredBevyException.getException(e));
    }
  }
}
