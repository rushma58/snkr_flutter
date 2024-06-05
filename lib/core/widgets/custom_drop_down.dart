import 'package:flutter/material.dart';
import 'package:snkr_flutter/core/utils/colors.dart';
import 'package:snkr_flutter/core/utils/fonts.dart';

class CustomDropdownField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final List<String> dropdownList;
  final String? Function(String?)? validator;

  const CustomDropdownField({
    super.key,
    required this.controller,
    required this.labelText,
    this.validator,
    required this.dropdownList,
  });

  @override
  State<CustomDropdownField> createState() => _CustomDropdownFieldState();
}

class _CustomDropdownFieldState extends State<CustomDropdownField> {
  String? _selectedValue;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.controller.text;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.only(bottom: 12),
      child: DropdownMenu<String>(
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: cGrayOld.withOpacity(0.5),
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: Colors.red,
            ),
          ),
        ),
        initialSelection: widget.dropdownList.firstWhere(
          (item) => item.toLowerCase() == widget.controller.text.toLowerCase(),
          orElse: () => "",
        ),
        expandedInsets: const EdgeInsets.all(0),
        menuHeight: 150,
        menuStyle: const MenuStyle(
          alignment: Alignment.bottomLeft,
        ),
        label: Text(
          widget.labelText,
          style: fGrayRegular14,
        ),
        onSelected: (String? newValue) {
          setState(() {
            _selectedValue = newValue;
            widget.controller.text = newValue!;
          });
          _validateField();
        },
        textStyle: fBlackRegular14,
        trailingIcon: const Icon(
          Icons.keyboard_arrow_down,
          color: cGrayOld,
        ),
        dropdownMenuEntries:
            widget.dropdownList.map<DropdownMenuEntry<String>>((String option) {
          return DropdownMenuEntry<String>(
            value: option,
            label: option,
            style: MenuItemButton.styleFrom(
              foregroundColor: cGrayOld,
              backgroundColor: Colors.white,
            ),
          );
        }).toList(),
        errorText: _errorMessage,
      ),
    );
  }

  void _validateField() {
    if (mounted) {
      final FormState formState = Form.of(context);
      String? errorMessage = widget.validator?.call(_selectedValue);
      setState(() {
        _errorMessage = errorMessage;
      });
    }
  }
}
