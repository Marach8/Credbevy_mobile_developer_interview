import 'package:credbevy_task/src/global_export.dart';

abstract interface class TransferRepo {

  Future<ApiResponse<BalanceResponseModel>> fetchBalance();

  Future<ApiResponse<BeneficiariesResponseModel>> fetchBeneficiaries();

  Future<ApiResponse<GenericResponseModel>> sendMoney({required SendMoneyRequestModel data});
}