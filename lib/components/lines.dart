import 'package:flutter/material.dart';

import 'inputs.dart';
import 'labels.dart';

/// FileName inputs
///
/// @Author hugo
/// @Date 2023/12/21 16:54
///
/// @Description TODO
class Line extends StatelessWidget {
  final String text;
  final String hintText;
  final double size;
  final void Function(String?)? onValueChanged;

  const Line({
    super.key,
    required this.text,
    required this.hintText,
    required this.size,
    this.onValueChanged,
  });

  @override
  Widget build(BuildContext context) => Row(
        children: [
          Label(
            text: text,
            size: size,
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: Input(
              hintText: hintText,
              onValueChanged: onValueChanged,
            ),
          )
        ],
      );
}
