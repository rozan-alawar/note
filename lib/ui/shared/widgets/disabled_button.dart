import 'package:flutter/material.dart';

import '../../../utils/resources/color_manager.dart';
import 'button.dart';

class DisabledButton extends StatelessWidget {
  const DisabledButton({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      child: Button(
        isGradient: false,
        onPressed: () {},
        widget: child,
        color: ColorManager.grey,
      ),
    );
  }
}
