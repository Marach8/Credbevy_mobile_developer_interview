import 'package:credbevy_task/src/global_export.dart';

class CredBevyTextField extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final TextInputType? inputType;
  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  
  const CredBevyTextField({
    super.key,
    this.hintText,
    this.controller,
    this.onChanged,
    this.onSaved,
    this.validator,
    this.inputType,
  });

  @override
  Widget build(context) {
    return TextFormField(
      validator: validator,
      cursorColor: CredBevyColors.hex444449,
      controller: controller,
      onChanged: onChanged,
      onSaved: onSaved,
      keyboardType: inputType,
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
        fontSize: CredBevyFontSizes.size16,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
          fontSize: CredBevyFontSizes.size16,
          color: CredBevyColors.hexCDCDD1
        ),
      ),
    );
  }
}
