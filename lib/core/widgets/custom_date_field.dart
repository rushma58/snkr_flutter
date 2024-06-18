import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:snkr_flutter/core/utils/colors.dart';
import 'package:snkr_flutter/core/utils/fonts.dart';

class CustomDateField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final bool? readOnly;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;

  const CustomDateField({
    Key? key, // Use Key type for the key parameter
    required this.controller,
    required this.labelText,
    this.validator,
    this.readOnly,
    this.keyboardType,
  }) : super(key: key);

  @override
  State<CustomDateField> createState() => _CustomDateFieldState();
}

class _CustomDateFieldState extends State<CustomDateField> {
  final bool _obscureText = true;

  Future<void> getDatePicker(
    BuildContext context,
  ) async {
    DateTime? datePicked = await showDatePicker(
      initialDate: DateTime.now(),
      firstDate: DateTime(1920),
      lastDate: DateTime(2027),
      context: context,
      initialDatePickerMode: DatePickerMode.day,
    );
    if (datePicked != null) {
      widget.controller.text = DateFormat('yyyy-MM-dd').format(datePicked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 12),
      //height: 60,
      child: TextFormField(
        keyboardType: widget.keyboardType ?? TextInputType.text,
        controller: widget.controller,
        validator: widget.validator,
        readOnly: widget.readOnly ?? false,
        style: fBlackRegular14,
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
          suffixIcon: IconButton(
            onPressed: () {
              getDatePicker(context);
            },
            icon: const Icon(
              Icons.calendar_month,
              color: cBlack,
            ),
          ), // Set null if onPressed or icon is not provided
        ),
      ),
    );
  }
}
