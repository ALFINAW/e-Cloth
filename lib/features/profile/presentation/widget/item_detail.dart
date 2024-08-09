import 'package:flutter/material.dart';

class ItemDetail extends StatelessWidget {
  final String title;
  final List<Map<String, dynamic>> keyValuePairs;
  final bool showCopyIcon;

  const ItemDetail({
    super.key,
    required this.title,
    required this.keyValuePairs,
    this.showCopyIcon = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 15.0),
        Column(
          children: keyValuePairs.asMap().entries.map((entry) {
            int index = entry.key;
            Map<String, dynamic> pair = entry.value;
            String keyText = pair['key']!;
            String valueText = pair['value']!;
            Color valueColor = pair['color'] ?? Colors.grey;

            return Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 190,
                    child: Text(
                      keyText,
                      style: const TextStyle(
                        fontSize: 13.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Flexible(
                          child: Text(
                            valueText,
                            style: TextStyle(
                              fontSize: 13.0,
                              fontWeight: FontWeight.bold,
                              color: valueColor,
                            ),
                            overflow: index == 0
                                ? TextOverflow.ellipsis
                                : TextOverflow.visible,
                            softWrap: index == 0 ? false : true,
                          ),
                        ),
                        if (showCopyIcon && index == 0) ...[
                          const SizedBox(width: 9.4),
                          const Icon(
                            Icons.copy_rounded,
                            size: 20.0,
                          ),
                        ],
                      ],
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
