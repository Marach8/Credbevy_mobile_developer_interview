class CardsResponseModel {
  final bool? error;
  final String? message;
  final List<CardInfo>? data;

  CardsResponseModel({
    this.error,
    this.message,
    this.data,
  });

  factory CardsResponseModel.fromJson(Map<String, dynamic> json) 
    => CardsResponseModel(
      error: json['error'] as bool?,
      message: json['message'] as String?,
      data: (json['data'] as List?)
          ?.map((e) => CardInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

  Map<String, dynamic> toJson() => {
    'error': error,
    'message': message,
    'data': data?.map((e) => e.toJson()).toList(),
  };

  @override
  String toString() => 'CardInfoResponse{error: $error, message: $message, data: $data}';
}



class CardInfo {
  final int? id;
  final String? cardNumber;
  final String? cardType;
  final int? balance;
  final String? name;
  final String? bankName;
  final String? expiryDate;

  CardInfo({
    this.id,
    this.cardNumber,
    this.cardType,
    this.balance,
    this.name,
    this.bankName,
    this.expiryDate,
  });

  factory CardInfo.fromJson(Map<String, dynamic> json) => CardInfo(
    id: json['id'],
    cardNumber: json['card_number'],
    cardType: json['card_type'],
    balance: json['balance'],
    name: json['name'],
    bankName: json['bank_name'],
    expiryDate: json['expiry_date'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'card_number': cardNumber,
    'card_type': cardType,
    'balance': balance,
    'name': name,
    'bank_name': bankName,
    'expiry_date': expiryDate,
  };

    @override
  String toString() {
    return 'CardInfo{id: $id, cardNumber: $cardNumber, cardType: $cardType, balance: $balance, name: $name, bankName: $bankName, expiryDate: $expiryDate}';
  }
}
