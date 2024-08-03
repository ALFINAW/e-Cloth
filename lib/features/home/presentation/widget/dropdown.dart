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

  const MyDropdown({
    super.key,
    required this.hint,
    required this.value,
    required this.onChanged,
    required this.items,
    this.height,
    this.width,
    this.padding,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height, // Default height is null
      width: width, // Default width is null
      padding: padding ??
          const EdgeInsets.symmetric(
              horizontal: 10, vertical: 5), // Default padding
      decoration: BoxDecoration(
        border: Border.all(
            color: borderColor ?? Colors.black), // Default border color
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          hint: Text(
            hint,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          value: value,
          icon: const Icon(Icons.keyboard_arrow_down, size: 20),
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
