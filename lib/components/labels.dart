import 'package:flutter/material.dart';

/// FileName labels
///
/// @Author hugo
/// @Date 2023/12/21 17:02
///
/// @Description TODO
class Label extends StatelessWidget {
  final String text;
  final double size;

  const Label({
    super.key,
    required this.text,
    required this.size,
  });

  @override
  Widget build(BuildContext context) => Text(
        text,
        style: TextStyle(
          color: Colors.black87,
          fontSize: size,
          fontWeight: FontWeight.normal,
        ),
      );
}
