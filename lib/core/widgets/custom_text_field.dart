import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:snkr_flutter/core/utils/colors.dart';
import 'package:snkr_flutter/core/utils/fonts.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final bool? readOnly;
  final String? Function(String?)? validator;
  final bool? isCalender;
  final TextInputType? keyboardType;

  const CustomTextField({
    Key? key, // Use Key type for the key parameter
    required this.controller,
    required this.labelText,
    this.validator,
    this.readOnly,
    this.isCalender,
    this.keyboardType,
  }) : super(key: key);

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
      child: TextFormField(
        keyboardType: keyboardType ?? TextInputType.text,
        controller: controller,
        validator: validator,
        readOnly: readOnly ?? false,
        style: fGBrownRegular14,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          //floatingLabelStyle: fGBrownRegular14,
          labelText: labelText,
          labelStyle: fGrayRegular14,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: cGBrown)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: cGBrown)),
          focusColor: cSilver,
          // Conditionally set the suffix icon
          suffixIcon: isCalender ?? false
              ? IconButton(
                  onPressed: () {
                    getDatePicker(context).then((value) {
                      controller.text = value;
                    });
                  },
                  icon: const Icon(Icons.calendar_month_outlined),
                )
              : null, // Set null if onPressed or icon is not provided
        ),
      ),
    );
  }
}
