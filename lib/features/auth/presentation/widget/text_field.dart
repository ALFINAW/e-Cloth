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
  final double? width;
  final int? maxLines;
  final TextStyle? hintStyle;
  final EdgeInsets? margin;
  final Color? borderColor;

  const MyTextField(
      {super.key,
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
      this.width,
      this.maxLines,
      this.hintStyle,
      this.margin,
      this.borderColor});

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
      margin: widget.margin ?? const EdgeInsets.only(bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: widget.maxLines != null ? (widget.maxLines! * 24.0) : 60.0,
            width: widget.width ?? double.infinity,
            child: TextFormField(
              enabled: widget.enabled,
              controller: textEditingController,
              validator: widget.validator,
              maxLength: widget.maxLength,
              maxLines: widget.maxLines ?? 1,
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
                hintStyle: widget.hintStyle ??
                    const TextStyle(color: Colors.grey, fontSize: 14),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                    color: widget.borderColor ?? Colors.grey,
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
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 18.0,
                  vertical: 10.0, // Tambahkan padding vertikal
                ),
              ),
              onChanged: widget.onChanged,
              onFieldSubmitted: widget.onSubmitted,
              onTap: widget.isDatePicker ? () => _selectDate(context) : null,
            ),
          ),
          if (widget.helper != null) ...[
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
