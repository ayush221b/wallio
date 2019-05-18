import 'package:meta/meta.dart';
import 'package:wallio/app/models/image.dart';

class ImageList {

  List<Image> images = [];
  String searchQuery;

  ImageList({
    @required this.images,
    @required this.searchQuery
  });

  addToList(Image image) {
    images.add(image);
  }
}