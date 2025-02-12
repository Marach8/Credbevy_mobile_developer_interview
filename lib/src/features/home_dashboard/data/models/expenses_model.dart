class ExpensesResponseModel {
  final bool? error;
  final String? message;
  final List<ExpenseData>? data;

  ExpensesResponseModel({this.error, this.message, this.data});

  factory ExpensesResponseModel.fromJson(Map<String, dynamic> json) 
    =>ExpensesResponseModel(
      error: json['error'] as bool?,
      message: json['message'] as String?,
      data: (json['data'] as List?)
          ?.map((e) => ExpenseData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

  Map<String, dynamic> toJson() => {
    'error': error,
    'message': message,
    'data': data?.map((e) => e.toJson()).toList(),
  };

  @override
  String toString() => 'SpendingDataResponse{error: $error, message: $message, data: $data}';
}

class ExpenseData {
  final String? month;
  final int? amountSpent;

  ExpenseData({this.month, this.amountSpent});

  factory ExpenseData.fromJson(Map<String, dynamic> json)
    => ExpenseData(
      month: json['month'] as String?,
      amountSpent: json['amount_spent'] as int?,
    );

  Map<String, dynamic> toJson() => {
    'month': month,
    'amount_spent': amountSpent,
  };

  @override
  String toString() => 'SpendingData{month: $month, amountSpent: $amountSpent}';
}