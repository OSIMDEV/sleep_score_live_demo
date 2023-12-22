import 'package:flutter/material.dart';
import 'package:sleep_score_live_demo/style/colors.dart';

import '../style/input_border_style.dart';

/// FileName inputs
///
/// @Author hugo
/// @Date 2023/12/21 16:54
///
/// @Description TODO
class Input extends StatelessWidget {
  final String hintText;
  final void Function(String?)? onValueChanged;

  const Input({
    super.key,
    required this.hintText,
    this.onValueChanged,
  });

  @override
  Widget build(BuildContext context) => TextField(
        decoration: InputDecoration(
          label: Text(
            hintText,
            style: const TextStyle(
              color: Colors.black54,
              fontSize: 15,
            ),
          ),
          border: inputBorderStyle,
          enabledBorder: inputBorderStyle,
          focusedBorder: inputBorderStyle,
          focusedErrorBorder: inputBorderStyle,
          fillColor: color_fff5f5dc,
          filled: true,
        ),
        onChanged: (String? value) {
          onValueChanged?.call(value);
        },
        keyboardType: TextInputType.number,
        cursorColor: Colors.black87,
      );
}
