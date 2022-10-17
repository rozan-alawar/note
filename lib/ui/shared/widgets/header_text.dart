import 'package:flutter/material.dart';
import 'package:note/utils/resources/color_manager.dart';
import 'package:note/utils/resources/styles_manager.dart';

class HeaderText extends StatelessWidget {
  const HeaderText(
      {super.key, required this.text, this.gradientText, this.fontSize = 40});
  final String text;
  final String? gradientText;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: getBoldStyle(fontSize: fontSize),
        ),
        ShaderMask(
          blendMode: BlendMode.srcIn,
          shaderCallback: (bounds) =>
              ColorManager.darkLinearGradient.createShader(
            Rect.fromLTWH(0, 0, bounds.width, bounds.height),
          ),
          child: Text(
            gradientText ?? "",
            style: getBoldStyle(
              fontSize: fontSize,
            ),
          ),
        )
      ],
    );
  }
}
