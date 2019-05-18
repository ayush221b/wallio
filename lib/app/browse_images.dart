import 'package:flutter/material.dart';

class BrowseImages extends StatefulWidget {
  @override
  _BrowseImagesState createState() => _BrowseImagesState();
}

class _BrowseImagesState extends State<BrowseImages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white30,
        title: Text('Wallio'),
      ),
    );
  }
}