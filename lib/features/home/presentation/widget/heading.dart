import 'package:flutter/material.dart';

class HeadingWidget extends StatelessWidget {
  final String title;
  final String? subtitle;
  final double titleFontSize;
  final double subtitleFontSize;
  final Function? onPressed;
  const HeadingWidget({
    super.key,
    required this.title,
    required this.titleFontSize,
    required this.subtitleFontSize,
    this.subtitle,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 3.0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: titleFontSize,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          if (subtitle != null)
            InkWell(
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () {
                if (onPressed != null) onPressed!();
              },
              child: Text(
                subtitle!,
                style: TextStyle(
                  fontSize: subtitleFontSize,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

Widget headingOne({
  required String title,
  String? subtitle,
  Function? onPressed,
}) {
  return HeadingWidget(
    title: title,
    subtitle: subtitle,
    titleFontSize: 20,
    subtitleFontSize: 16,
    onPressed: onPressed,
  );
}
