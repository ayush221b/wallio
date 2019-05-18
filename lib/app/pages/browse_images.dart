import 'package:flutter_web/material.dart';
import 'package:wallio/app/models/image_list.dart';
import 'package:wallio/app/util/network.dart';
import 'package:wallio/app/widgets/image_grid.dart';

class BrowseImages extends StatefulWidget {
  @override
  _BrowseImagesState createState() => _BrowseImagesState();
}

class _BrowseImagesState extends State<BrowseImages> {
  TextEditingController searchQueryController = TextEditingController();
  bool _isLoading = false;
  ImageList _images;
  bool _searchDone = false;

  Future _performSearch() async {
    final String query = searchQueryController.text;
    ImageList images = await Storage.getImagesForSearch(query);

    print(images.images[0].imageUrl);

    setState(() {
      _images = images;
      _searchDone = true;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white24,
          centerTitle: true,
          elevation: 0.0,
          title: Text(
            'Wall I/O',
            style: TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w300,
                color: Colors.black,
                fontSize: 24.0),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
                padding: EdgeInsets.all(16.0),
                margin: EdgeInsets.only(top: 32.0),
                child: TextField(
                  controller: searchQueryController,
                  maxLines: 1,
                  decoration: InputDecoration(
                      labelText: 'Search',
                      suffixIcon: IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () async {
                          setState(() {
                            _isLoading = true;
                          });
                          await _performSearch();
                        },
                      ),
                      border: OutlineInputBorder(
                        
                          borderRadius:
                              BorderRadius.all(Radius.circular(8.0)))),
                )),
            if (_isLoading)
              Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 45.0, horizontal: 50.0),
                  child: SizedBox(
                      height: 2.0,
                      child: LinearProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                            Theme.of(context).primaryColor),
                      )))
            else
              ImageGrid(_images, searchPerformed: _searchDone)
          ],
        ));
  }
}
