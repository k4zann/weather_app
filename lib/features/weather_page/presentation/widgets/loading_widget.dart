import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key, this.backColor, this.size = 60});

  final Color? backColor;
  final double? size;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: backColor,
      child: SizedBox(
        height: size!,
        width: size!,
        child: const RiveAnimation.asset(
          'assets/gifs/loading.riv',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
