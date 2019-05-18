import 'package:meta/meta.dart';

class Image {

  String imageUrl;
  String photographer;
  int views;

  Image({
    @required this.imageUrl,
    @required this.photographer,
    @required this.views
  });

  Image.fromMap(Map searchResult) {

    imageUrl = searchResult['webformatURL'];
    photographer = searchResult['user'];
    views = searchResult['views'];
  }
}