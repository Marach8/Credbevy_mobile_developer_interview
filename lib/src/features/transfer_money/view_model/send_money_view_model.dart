import 'package:credbevy_task/src/global_export.dart';

final sendMoneyProvider =
  StateNotifierProvider<SendMoneyNotifier, AsyncValue<List<ExpenseData>?>>(
    (ref) => SendMoneyNotifier(ref)
);

class SendMoneyNotifier extends StateNotifier<AsyncValue<List<ExpenseData>?>> {
  SendMoneyNotifier(this.ref)
    : transferRepo = ref.read(transferRepoProvider),
      super(const AsyncData(null));

  final Ref ref;
  final TransferRepo transferRepo;

  Future<GenericResponseModel> sendMoney({
    required String receiverName,
    required String amount
  }) async {
    state = const AsyncLoading(); 
    try{
      final beneficiaries = ref.read(beneficiariesProvider).value;
      final selectedId = beneficiaries?.firstWhere(
        (beneficiary) => beneficiary.fullname?.toLowerCase() == receiverName.toLowerCase(),
        orElse: () => User()
      ).id;

      if((selectedId ?? -1) == -1){
        throw CredBevyStrings.INVALID_BENEFICIARY;
      }

      final parsedAmount = double.parse(amount);

      final sendMoneyModel = SendMoneyRequestModel(receiverId: selectedId ?? -1, amount: parsedAmount);
      final response = await transferRepo.sendMoney(data: sendMoneyModel);

      final result = response.when(
        successful: (result) => GenericResponseModel(
          isSuccessful: true,
          responseMessage: result.data?.responseMessage ?? CredBevyStrings.SUCCESSFUL
        ),
        
        error: (error) => GenericResponseModel(
          isSuccessful: false,
          responseMessage: error.error.message
        )
      );

      return result;
    }
    catch (e){
      return GenericResponseModel(
        isSuccessful: false,
        responseMessage: e.toString()
      );
    }
    finally{state = const AsyncData(null);}
  }
}