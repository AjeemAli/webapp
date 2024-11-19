import 'package:cloud_firestore/cloud_firestore.dart';

import '../domain/models/verse_model.dart';

class FirebaseService {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Fetch verses from Firestore (assuming your data is stored in Firestore under a collection 'verses')
  Future<List<Verses>> getVerses(String surahName) async {
    try {
      final snapshot = await firestore.collection('surahs').doc(surahName).collection('verses').get();
      return snapshot.docs.map((doc) => Verses.fromMap(doc.data())).toList();
    } catch (e) {
      throw Exception("Failed to fetch verses: $e");
    }
  }

  // Add verse to favorites (assuming user has a 'favorites' collection)
  Future<void> addToFavorites(String verseId) async {
    try {
      await firestore.collection('users').doc('userId').collection('favorites').add({
        'verseId': verseId,
        'timestamp': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      throw Exception("Failed to add to favorites: $e");
    }
  }
}
