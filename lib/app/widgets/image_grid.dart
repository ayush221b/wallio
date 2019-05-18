import 'package:flutter/material.dart';
import 'package:wallio/app/models/image_list.dart';
import 'package:wallio/app/models/image.dart' as DisplayImage;

class ImageGrid extends StatelessWidget {
  final ImageList _images;
  final bool searchPerformed;

  ImageGrid(this._images, {this.searchPerformed = false});

  Widget getBuildWidget(BuildContext context) {
    Widget targetWidget;

    if (_images == null && searchPerformed == true) {
      targetWidget = Container(
        padding: EdgeInsets.all(16.0),
        child: Text(
          'Something went wrong. Please try again.',
          style: TextStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w400,
              fontSize: 16.0),
          textAlign: TextAlign.center,
        ),
      );
    } else if (searchPerformed == false) {
      targetWidget = Container(
        padding: EdgeInsets.all(16.0),
        child: Text(
          'Welcome to Wall I/O. \n \n Please perform a search to see results.',
          style: TextStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w400,
              fontSize: 16.0),
          textAlign: TextAlign.center,
        ),
      );
    } else {
      targetWidget = buildImagesGrid(context);
    }

    return targetWidget;
  }

  Widget buildImagesGrid(BuildContext context) {
    List<DisplayImage.Image> displayImages = _images.images;

    int noOfRows = 1;
    double deviceWidth = MediaQuery.of(context).size.width;

    if(deviceWidth > 800) noOfRows = 3;

    return Expanded(
      child: GridView.builder(
        itemCount: displayImages.length,
        padding: EdgeInsets.all(10.0),
        scrollDirection: Axis.vertical,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: noOfRows),
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Hero(
              tag: '${displayImages[index].imageUrl}',
              child: Material(
                color: Colors.redAccent,
                elevation: 4.0,
                child: GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, '/images/${_images.searchQuery}/$index');
                  },
                  child: Image.network(
                    displayImages[index].imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return getBuildWidget(context);
  }
}
