import 'package:flutter/material.dart';

import 'data/firebase_yaseen_service.dart';
import 'domain/models/verse_model.dart';

class YaseenUseCase {
  final FirebaseService firebaseService;

  YaseenUseCase({required this.firebaseService});

  // Fetch a list of verses from Surah Yaseen (assuming a Firebase service)
  Future<List<Verses>> fetchVerses() async {
    try {
      // Calling Firebase service to get the verses
      final verses = await firebaseService.getVerses("yaseen");
      return verses;
    } catch (e) {
      // Handle errors gracefully
      throw Exception("Failed to load verses: $e");
    }
  }

  // Example of adding a verse to the user's favorites (for instance)
  Future<void> addVerseToFavorites(String verseId) async {
    try {
      await firebaseService.addToFavorites(verseId);
    } catch (e) {
      throw Exception("Failed to add to favorites: $e");
    }
  }
}
