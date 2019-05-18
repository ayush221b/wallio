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

  Image.fromMap(Map decodedResponseBody) {

    imageUrl = decodedResponseBody['webformatURL'];
    photographer = decodedResponseBody['user'];
    views = decodedResponseBody['views'];
  }
}