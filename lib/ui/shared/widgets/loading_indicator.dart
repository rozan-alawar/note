import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../utils/resources/color_manager.dart';

class LoadingIndiaor extends StatelessWidget {
  const LoadingIndiaor({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: ShaderMask(
        blendMode: BlendMode.srcIn,
        shaderCallback: (bounds) =>
            ColorManager.darkLinearGradient.createShader(
          Rect.fromLTWH(0, 0, bounds.width, bounds.height),
        ),
        child: SpinKitThreeBounce(
          color: ColorManager.blue,
          size: 25.0,
        ),
      ),
    );
  }
}
