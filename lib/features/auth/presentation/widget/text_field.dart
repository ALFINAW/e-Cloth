import 'package:e_cloth/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class MyTextField extends StatefulWidget {
  final String? id;
  final String? label;
  final String? value;
  final String? hint;
  final String? helper;
  final String? Function(String?)? validator;
  final bool obscure;
  final bool enabled;
  final int? maxLength;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final Function(String) onChanged;
  final Function(String)? onSubmitted;
  final bool isDatePicker;
  final Function(DateTime)? onDateSelected;

  const MyTextField({
    super.key,
    this.id,
    this.label,
    this.value,
    this.hint,
    this.helper,
    this.validator,
    this.obscure = false,
    this.enabled = true,
    this.maxLength,
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardType,
    this.inputFormatters,
    required this.onChanged,
    this.onSubmitted,
    this.isDatePicker = false,
    this.onDateSelected,
  });

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  late TextEditingController textEditingController = TextEditingController();
  bool _obscureText = false;

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController(text: widget.value ?? "");
    _obscureText = widget.obscure;
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        textEditingController.text =
            DateFormat('dd-MM-yyyy').format(pickedDate);
      });
      if (widget.onDateSelected != null) {
        widget.onDateSelected!(pickedDate);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 51,
            child: TextFormField(
              enabled: widget.enabled,
              controller: textEditingController,
              validator: widget.validator,
              maxLength: widget.maxLength,
              obscureText: widget.obscure ? _obscureText : false,
              keyboardType: widget.isDatePicker
                  ? TextInputType.none
                  : widget.keyboardType,
              inputFormatters: widget.inputFormatters,
              decoration: InputDecoration(
                labelText: widget.label,
                suffixIcon: widget.isDatePicker
                    ? IconButton(
                        icon: const Icon(
                          Icons.calendar_month_outlined,
                          size: 23,
                          color: AppColors.secondaryTwo,
                        ),
                        onPressed: () => _selectDate(context),
                      )
                    : widget.suffixIcon != null
                        ? IconButton(
                            icon: Icon(
                              widget.obscure
                                  ? (_obscureText
                                      ? Icons.visibility_off
                                      : Icons.visibility)
                                  : widget.suffixIcon,
                              size: 20,
                              color: AppColors.secondaryTwo,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                          )
                        : null,
                hintText: widget.hint,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(
                    color: Colors.blue,
                    width: 1.0,
                  ),
                ),
                contentPadding: const EdgeInsets.all(12.0),
              ),
              onChanged: widget.onChanged,
              onFieldSubmitted: widget.onSubmitted,
              onTap: widget.isDatePicker ? () => _selectDate(context) : null,
            ),
          ),
          if (widget.helper != null) ...[
            const SizedBox(height: 8.0),
            Text(
              widget.helper!,
              style: const TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ],
        ],
      ),
    );
  }
}
