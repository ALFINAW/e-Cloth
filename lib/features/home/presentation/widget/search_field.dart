import 'package:e_cloth/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class MySearchField extends StatefulWidget {
  final String? hint;
  final String? initialValue;
  final bool enabled;
  final Function(String) onChanged;
  final Function(String)? onSubmitted;
  final double height;

  const MySearchField({
    super.key,
    this.hint = 'Search',
    this.initialValue,
    this.enabled = true,
    required this.onChanged,
    this.onSubmitted,
    this.height = 48.0,
  });

  @override
  State<MySearchField> createState() => _MySearchFieldState();
}

class _MySearchFieldState extends State<MySearchField> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _textEditingController.text = widget.initialValue ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: TextField(
        enabled: widget.enabled,
        controller: _textEditingController,
        decoration: InputDecoration(
            hintText: widget.hint,
            hintStyle: TextStyle(
              fontSize: widget.height / 3.5,
            ),
            filled: false,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: const BorderSide(
                color: Colors.black,
                width: 1.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: const BorderSide(
                color: Colors.grey,
                width: 1.0,
              ),
            ),
            prefixIcon: Container(
              padding: const EdgeInsets.all(16.0),
              child: Assets.icons.search.image(
                color: Colors.grey[500],
                fit: BoxFit.cover,
              ),
            ),
            contentPadding: const EdgeInsets.all(20)),
        onChanged: (value) {
          widget.onChanged(value);
        },
        onSubmitted: (value) {
          if (widget.onSubmitted != null) widget.onSubmitted!(value);
        },
      ),
    );
  }
}
