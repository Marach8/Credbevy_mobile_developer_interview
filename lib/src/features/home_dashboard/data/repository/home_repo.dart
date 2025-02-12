import 'package:credbevy_task/src/global_export.dart';

abstract interface class HomeRepo {

  Future<ApiResponse<CardsResponseModel>> fetchCreditCards();

  Future<ApiResponse<ExpensesResponseModel>> fetchExpenses();
}