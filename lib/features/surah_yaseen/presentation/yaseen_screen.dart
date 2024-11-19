import 'package:flutter/material.dart';

import '../../../utils/firebase_helpers.dart';


class SurahScreen extends StatefulWidget {
  @override
  _SurahScreenState createState() => _SurahScreenState();
}

class _SurahScreenState extends State<SurahScreen> {
  final FirebaseHelper _firebaseHelper = FirebaseHelper();
  List<Map<String, dynamic>> surahData = [];

  @override
  void initState() {
    super.initState();
    fetchSurahData();
  }

  Future<void> fetchSurahData() async {
    try {
      final data = await _firebaseHelper.fetchCollection('surah_yaseen');
      setState(() {
        surahData = data;
      });
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Surah Yaseen')),
      body: surahData.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: surahData.length,
        itemBuilder: (context, index) {
          final verse = surahData[index];
          return ListTile(
            title: Text(verse['arabic_text']),
            subtitle: Text(verse['translation']),
          );
        },
      ),
    );
  }
}
