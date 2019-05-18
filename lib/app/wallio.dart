import 'package:flutter/material.dart';
import 'package:wallio/app/browse_images.dart';

class Wallio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wallio',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => BrowseImages(),
      },
      onGenerateRoute: (context) => null,
    );
  }
}