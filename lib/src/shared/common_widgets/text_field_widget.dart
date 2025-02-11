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
        contentPadding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
        fillColor: CredBevyColors.transparent,
        filled: true,
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
          fontSize: CredBevyFontSizes.size16,
          color: CredBevyColors.hexCDCDD1
        ),
        enabledBorder: const OutlineInputBorder().copyWith(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            width: 1.5,
            color: CredBevyColors.hexE0E0E0
          )
        ),
        focusedBorder: const OutlineInputBorder().copyWith(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            width: 1.5,
            color: CredBevyColors.hex444449
          )
        ),
      ),
    );
  }
}
