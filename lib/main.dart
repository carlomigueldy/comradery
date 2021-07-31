import 'package:comradery/stacked_app.locator.dart';
import 'package:comradery/stacked_app.router.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

void main() {
  setupLocator();
  runApp(ComraderyApp());
}

class ComraderyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Comradery App',
      debugShowCheckedModeBanner: false,
      scrollBehavior: ScrollBehavior().copyWith(
        physics: BouncingScrollPhysics(),
      ),
      navigatorKey: StackedService.navigatorKey,
      onGenerateRoute: StackedRouter().onGenerateRoute,
    );
  }
}
