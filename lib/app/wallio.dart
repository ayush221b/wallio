import 'package:flutter_web/material.dart';
import 'package:wallio/app/models/image.dart' as DisplayImage;
import 'package:wallio/app/pages/browse_images.dart';
import 'package:wallio/app/util/network.dart';
import 'package:wallio/app/widgets/image_display.dart';

class Wallio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wall I/O - The Image Browser',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => BrowseImages(),
      },
      onGenerateRoute: (RouteSettings settings) {
        final List<String> pathElements = settings.name.split('/');

        if (pathElements[0] != '') {
          return null;
        }
        if (pathElements[1] == 'images') {

          String query = pathElements[2];
          DisplayImage.Image imageToDisplay =
              Storage.images.images[int.parse(pathElements[3])];

          return MaterialPageRoute(builder: (BuildContext context) {
            return ImageDisplay(displayImage: imageToDisplay, query: query);
          });
        } else {
          return null;
        }
      },
    );
  }
}
