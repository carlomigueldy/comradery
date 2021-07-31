import 'package:flutter/material.dart';

class AppSpinner extends StatelessWidget {
  const AppSpinner({
    Key? key,
    this.color,
  }) : super(key: key);

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 15,
        width: 15,
        child: CircularProgressIndicator(
          color: color ?? Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
