class BalanceResponseModel {
  final bool? error;
  final String? message;
  final num? data;

  BalanceResponseModel({this.error, this.message, this.data});

  factory BalanceResponseModel.fromJson(Map<String, dynamic> json) => BalanceResponseModel(
    error: json['error'],
    message: json['message'],
    data: json['data']
  );

  Map<String, dynamic> toJson() => {
    'error': error,
    'message': message,
    'data': data,
  };

  @override
  String toString() => 'BalanceResponse{error: $error, message: $message, data: $data}';
}
