class BeneficiariesResponseModel {
  final bool? error;
  final String? message;
  final List<User>? data;

  BeneficiariesResponseModel({this.error, this.message, this.data});

  factory BeneficiariesResponseModel.fromJson(Map<String, dynamic> json) =>
  BeneficiariesResponseModel(
    error: json['error'],
    message: json['message'],
    data: (json['data'] as List?)
        ?.map((e) => User.fromJson(e as Map<String, dynamic>))
        .toList(),
  );

  Map<String, dynamic> toJson() => {
    'error': error,
    'message': message,
    'data': data?.map((e) => e.toJson()).toList(),
  };

  @override
  String toString() => 'UserListResponse{error: $error, message: $message, data: $data}';
}



class User {
  final int? id;
  final String? fullname;
  final String? image;

  User({this.id, this.fullname, this.image});

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json['id'],
    fullname: json['fullname'],
    image: json['image'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'fullname': fullname,
    'image': image,
  };

  @override
  String toString() => 'User{id: $id, fullname: $fullname, image: $image}';
}
