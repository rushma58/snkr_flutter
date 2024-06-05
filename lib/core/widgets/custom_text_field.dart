import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:intl/intl.dart';
import 'package:snkr_flutter/core/utils/colors.dart';
import 'package:snkr_flutter/core/utils/fonts.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final bool? readOnly;
  final String? Function(String?)? validator;
  final bool? isObscured;
  final TextInputType? keyboardType;

  const CustomTextField({
    Key? key, // Use Key type for the key parameter
    required this.controller,
    required this.labelText,
    this.validator,
    this.readOnly,
    this.isObscured,
    this.keyboardType,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  Future<String> getDatePicker(
    BuildContext context,
  ) async {
    DateTime? datePicked = await showDatePicker(
      initialDate: DateTime.now(),
      firstDate: DateTime(1920),
      lastDate: DateTime(2027),
      context: context,
      initialDatePickerMode: DatePickerMode.day,
    );
    // if (datePicked != null) {
    //   selectedDate.text = DateFormat('yyyy-MM-dd').format(datePicked);
    // }
    return DateFormat('yyyy/MM/dd').format(datePicked!).toString();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 12),
      height: 60,
      child: TextFormField(
        keyboardType: widget.keyboardType ?? TextInputType.text,
        controller: widget.controller,
        validator: widget.validator,
        readOnly: widget.readOnly ?? false,
        style: fBlackRegular14,
        obscureText: widget.isObscured ?? false ? _obscureText : false,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          //floatingLabelStyle: fGBrownRegular14,
          labelText: widget.labelText,
          labelStyle: fGrayRegular14,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: cGrayOld.withOpacity(0.5))),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: cBlack)),
          focusColor: cSilver,
          // Conditionally set the suffix icon
          suffixIcon: widget.isObscured != null && widget.isObscured == true
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                  icon: Iconify(
                    _obscureText ? Mdi.eye_off : Mdi.eye,
                    size: 24,
                    color: cGrayOld,
                  ),
                )
              : null, // Set null if onPressed or icon is not provided
        ),
      ),
    );
  }
}
