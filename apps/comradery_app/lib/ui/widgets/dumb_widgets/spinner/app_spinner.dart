import 'package:flutter/material.dart';

class AppSpinner extends StatelessWidget {
  const AppSpinner({
    Key? key,
    this.color,
    this.centered = true,
  }) : super(key: key);

  final Color? color;
  final bool centered;

  @override
  Widget build(BuildContext context) {
    final spinner = Container(
      height: 15,
      width: 15,
      child: CircularProgressIndicator(
        color: color ?? Theme.of(context).primaryColor,
      ),
    );

    if (!centered) return spinner;

    return Center(
      child: spinner,
    );
  }
}
