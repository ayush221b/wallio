import 'package:flutter_web/material.dart';

import 'package:wallio/app/models/image.dart' as DisplayImage;

class ImageDisplay extends StatelessWidget {
  final String query;
  final DisplayImage.Image displayImage;

  ImageDisplay({this.query, this.displayImage});

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;

    TextStyle authorStyle =
        TextStyle(color: Colors.black, fontFamily: 'Roboto', fontSize: 20.0);

    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            Container(
              width: deviceWidth,
              height: deviceHeight,
              child: Hero(
                tag: displayImage.imageUrl,
                child: Image.network(
                  displayImage.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
                bottom: deviceHeight - 0.9 * deviceHeight,
                right: deviceWidth - 0.9 * deviceWidth,
                child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5.0)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          '\n An Image By ${displayImage.photographer}',
                          style: authorStyle,
                        ),
                        Text(
                          '\n Views: ${displayImage.views}',
                          style: authorStyle,
                        )
                      ],
                    )))
          ],
        ),
      ),
    );
  }
}
