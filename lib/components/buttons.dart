import 'package:flutter/material.dart';
import 'package:sleep_score_live_demo/style/colors.dart';

/// FileName labels
///
/// @Author hugo
/// @Date 2023/12/21 17:02
///
/// @Description TODO
class Button extends StatelessWidget {
  final String text;
  final Color bgColor;
  final Color color;
  final double size;
  final void Function()? onPressed;

  const Button(
    this.text, {
    super.key,
    required this.size,
    required this.bgColor,
    required this.color,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) => GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: const BoxDecoration(
          color: color_ff32cd32,
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        padding: const EdgeInsets.only(
          left: 32,
          top: 8,
          right: 32,
          bottom: 8,
        ),
        child: Text(text,
            style: TextStyle(
              color: color,
              fontSize: size,
              fontWeight: FontWeight.w800,
            )),
      ));
}
