import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class BookModel {
  final String title;
  final String image;

  BookModel({required this.title, required this.image});

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      title: json['title'] ?? '',
      image: json['image'] ?? '',
    );
  }
}

class BookPage extends StatefulWidget {
  @override
  _BookPageState createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  late PageController _pageController;
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();

    // Load the last saved page index
    _loadLastPageIndex();
  }

  Future<void> _loadLastPageIndex() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _currentPageIndex = prefs.getInt('lastPageIndex') ?? 0;
    });

    // Jump to the last saved page
    _pageController.jumpToPage(_currentPageIndex);
  }

  Future<void> _savePageIndex(int index) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('lastPageIndex', index);
  }

  Future<List<BookModel>> readJsonData() async {
    final jsondata = await rootBundle.loadString('assetss/jsonfile/book.json');
    final list = json.decode(jsondata) as List<dynamic>;
    return list.map((e) => BookModel.fromJson(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Book Viewer"),
      ),
      body: FutureBuilder(
        future: readJsonData(),
        builder: (context, data) {
          if (data.hasError) {
            return Center(child: Text("${data.error}"));
          } else if (data.hasData) {
            var items = data.data as List<BookModel>;
            return PageView.builder(
              controller: _pageController,
              itemCount: items == null ? 0 : items.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.80,
                        child: Image(
                          image: AssetImage(items[index].image.toString()),
                          fit: BoxFit.fill,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 8, right: 8),
                                child: Text(
                                  items[index].title.toString(),
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              onPageChanged: (index) {
                // Save the current page index when the page changes
                _savePageIndex(index);
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
