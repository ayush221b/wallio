import 'dart:convert';

import 'package:wallio/app/models/image.dart';
import 'package:wallio/app/models/image_list.dart';

import 'package:http/http.dart' as http;

class Storage {
  
  static ImageList images = ImageList(searchQuery: '', images: []);

  static Future<ImageList> getImagesForSearch(String query) async {
    images = ImageList(searchQuery: '', images: []);
    String parsedQuery = query.trim().replaceAll(new RegExp(r' '), '+');

    String baseUrl = 'https://pixabay.com/api/';
    String params = '?key=2861675-b18e143fe0e4d53571694be3c' +
        '&q=$parsedQuery' +
        '&image_type=photo' +
        'safesearch=true';

    try {
      http.Response response = await http.get(baseUrl + params);
      if (response.statusCode == 200) {
        Map decodedResponse = json.decode(response.body);

        List results = decodedResponse['hits'];

        results.forEach((searchResult) {
          Image image = Image.fromMap(searchResult);
          images.addToList(image);
        });

        return images;
      } else {
        return null;
      }
    } catch (exception) {
      print(exception);
      return null;
    }
  }
}
