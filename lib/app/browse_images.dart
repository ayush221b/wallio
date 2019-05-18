import 'package:flutter/material.dart';
import 'package:wallio/app/widgets/image_grid.dart';

class BrowseImages extends StatefulWidget {
  @override
  _BrowseImagesState createState() => _BrowseImagesState();
}

class _BrowseImagesState extends State<BrowseImages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white24,
        centerTitle: true,
        elevation: 0.0,
        title: Text('Wall I/O', style: TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.w300,color: Colors.black, fontSize: 24.0),),
      ),
      body: ImageGrid(),
    );
  }
}