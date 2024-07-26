import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String label;
  final void Function() onPressed;
  final double? width;
  final double? height;
  final Widget? icon;
  final IconData? suffixIcon;
  final Color? buttonColor;
  final Color? labelColor;
  final Color? borderColor;
  final double? borderWidth;
  final double? fontSize;

  const MyButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.width,
    this.height,
    this.icon,
    this.suffixIcon,
    this.buttonColor,
    this.labelColor,
    this.borderColor,
    this.borderWidth,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    double widgetWidth = width ?? MediaQuery.of(context).size.width;
    double widgetHeight = height ?? 51.0;
    double widgetIconSize = 22.0;

    return SizedBox(
      width: widgetWidth,
      height: widgetHeight,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(widgetWidth, widgetHeight),
          backgroundColor: buttonColor ?? Colors.transparent,
          foregroundColor: labelColor ?? Colors.white,
          side: borderColor != null && borderWidth != null
              ? BorderSide(color: borderColor!, width: borderWidth!)
              : BorderSide.none,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        onPressed: onPressed,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (icon != null)
                  SizedBox(
                    width: widgetIconSize,
                    height: widgetIconSize,
                    child: icon!,
                  ),
                if (icon != null) const SizedBox(width: 10.0),
                Text(
                  label,
                  style: TextStyle(
                    fontSize: fontSize ?? 14.0,
                    fontWeight: FontWeight.bold,
                    color: labelColor ?? Colors.white,
                  ),
                ),
              ],
            ),
            if (suffixIcon != null)
              Positioned(
                right: 0.0,
                child: Icon(
                  suffixIcon!,
                  size: widgetIconSize,
                  color: labelColor ?? Colors.white,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
