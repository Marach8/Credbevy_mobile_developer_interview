
class SendMoneyRequestModel {
  final int receiverId;
  final double amount;

  SendMoneyRequestModel({required this.receiverId, required this.amount});

  Map<String, dynamic> toJson() => {
    'receiver_id': receiverId,
    'amount': amount,
  };

  @override
  String toString() => 'TransferRequest{receiverId: $receiverId, amount: $amount}';

}