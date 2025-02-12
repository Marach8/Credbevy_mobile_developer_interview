import 'package:credbevy_task/src/global_export.dart';

class Validator{
  
  String? validateEmptyField(String? input) {
    if((input ?? '').isEmpty){
      return CredBevyStrings.EMPTY_FIELD;
    }
    return null;
  }


  String? validateDouble(String? input) {
    if ((input ?? '').isEmpty) {
      return CredBevyStrings.EMPTY_FIELD;
    }

    try {
      double.parse(input ?? '');
      return null;
    } catch (_) {
      return CredBevyStrings.INVALID_NUMBER;
    }
  }
}
