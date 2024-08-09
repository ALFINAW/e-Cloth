import 'package:flutter/material.dart';

class MyDropdown extends StatelessWidget {
  final String hint;
  final String? value;
  final ValueChanged<String?> onChanged;
  final List<String> items;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final Color? borderColor;
  final Color? backgroundColor;
  final Color? hintColor;

  const MyDropdown(
      {super.key,
      required this.hint,
      required this.value,
      required this.onChanged,
      required this.items,
      this.height,
      this.width,
      this.padding,
      this.borderColor,
      this.backgroundColor,
      this.hintColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: padding ??
          const EdgeInsets.only(left: 10, top: 5, bottom: 5, right: 5),
      decoration: BoxDecoration(
          border: Border.all(color: borderColor ?? Colors.black),
          borderRadius: BorderRadius.circular(10),
          color: backgroundColor ?? Colors.white),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          hint: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                hint,
                style:
                    TextStyle(fontSize: 14, color: hintColor ?? Colors.black),
              ),
              const SizedBox(width: 5.0),
              Icon(
                Icons.keyboard_arrow_down,
                size: 20,
                color: hintColor ?? Colors.black,
              ),
            ],
          ),
          value: value,
          icon: const SizedBox.shrink(),
          isDense: true,
          style: const TextStyle(color: Colors.black, fontSize: 14),
          onChanged: onChanged,
          items: items.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
