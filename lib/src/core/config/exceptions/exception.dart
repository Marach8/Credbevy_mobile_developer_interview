import 'dart:async';
import 'package:credbevy_task/src/global_export.dart';

/// custom exception class for handling exceptions in the api_client
class CredBevyException implements Exception {
  CredBevyException(this.message, {this.code});

  final dynamic message;
  final int? code;

  // ignore: prefer_constructors_over_static_methods, type_annotate_public_apis
  static CredBevyException getException(err) {
    if (err is SocketException) {
      return InternetConnectException(kInternetConnectionError, 0);
    } 

    else if(err is TimeoutException){
      return OtherExceptions(err.message, 0);
    }
    
    else if (err is DioException) {
      switch (err.type) {
        case DioExceptionType.cancel:
          return OtherExceptions(
            kRequestCancelledError, err.response?.statusCode);
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.receiveTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.connectionError:
          return InternetConnectException(
              kTimeOutError, err.response?.statusCode ?? 0);

        case DioExceptionType.badResponse:
        case DioExceptionType.badCertificate:
        case DioExceptionType.unknown:
          switch (err.response?.statusCode) {
            case 500:
              return InternalServerException(
                  statusCode: err.response?.statusCode);
            case 502:
              return InternalServerException(
                  statusCode: err.response?.statusCode);
            case 400:
              return OtherExceptions(
                err.response?.data['message'], err.response?.statusCode);
            case 403:
            case 401:
              return OtherExceptions(
                err.response?.data['message'], err.response?.statusCode);
              // return UnAuthorizedException(
              //   statusCode: err.response?.statusCode);
            case 404:
              return OtherExceptions(kUserNotFound, err.response?.statusCode);
            case 413:
              return OtherExceptions(kFileTooLarge, err.response?.statusCode);
            case 409:
              return OtherExceptions(
                err.response?.data['message'], err.response?.statusCode);
            default:
              // default exception error message
              return OtherExceptions(
                err.response?.data['message'], err.response?.statusCode);
          }
      }
    } 
    else {
      return OtherExceptions(kDefaultError, 0);
    }
  }
}

class OtherExceptions implements CredBevyException {
  OtherExceptions(this.newMessage, this.statusCode);

  final dynamic newMessage;
  final int? statusCode;

  @override
  String toString() => message;

  @override
  dynamic get message => newMessage;

  @override
  int? get code => statusCode;
}

class FormatException implements CredBevyException {
  @override
  String toString() => message;

  @override
  int? get code => null;

  @override
  String get message => kFormatError;
}

class InternetConnectException implements CredBevyException {
  InternetConnectException(this.newMessage, this.statusCode);

  final String newMessage;
  final int statusCode;

  @override
  String toString() => message;

  @override
  String get message => newMessage;

  @override
  int? get code => statusCode;
}

class InternalServerException implements CredBevyException {
  final int? statusCode;

  InternalServerException({required this.statusCode});
  @override
  String toString() {
    return message;
  }

  @override
  String get message => kServerError;

  @override
  int? get code => statusCode;
}

class UnAuthorizedException implements CredBevyException {
  final int? statusCode;

  UnAuthorizedException({required this.statusCode});
  @override
  String toString() {
    return message;
  }

  @override
  String get message => kInvalidCredential;

  @override
  int? get code => statusCode;
}

class CacheException implements Exception {
  CacheException(this.message, this.statusCode) : super();

  String message;
  final int? statusCode;

  @override
  String toString() {
    return message;
  }
}

// exceptions messages
const kInternetConnectionError = 'No internet connection, try again.';
const kTimeOutError = 'Connection timeout. Please check your internet connection.';
const kServerError = 'Something went wrong, try again.';
const kFormatError = 'Unable to process data at this time.';
const kInvalidCredential = 'Invalid Authentication Credential(s)!';
const kDefaultError = 'Oops something went wrong!';
const kBadRequestError = 'Invalid Credential(s)!';
const kFileTooLarge = 'File too large.';
const kUserNotFound = 'User does not exist!';
const kNotFoundError = 'An error occured, please try again.';
const kRequestCancelledError = 'Request to server was cancelled.';