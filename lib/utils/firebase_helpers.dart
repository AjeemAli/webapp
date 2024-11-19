
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseHelper {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Map<String, dynamic>>> fetchCollection(String collectionPath) async {
    try {
      final querySnapshot = await _firestore.collection(collectionPath).get();
      return querySnapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
    } catch (e) {
      throw Exception('Error fetching data: $e');
    }
  }

  Future<void> addDocument(String collectionPath, Map<String, dynamic> data) async {
    try {
      await _firestore.collection(collectionPath).add(data);
    } catch (e) {
      throw Exception('Error adding document: $e');
    }
  }

  Future<void> updateDocument(String collectionPath, String docId, Map<String, dynamic> data) async {
    try {
      await _firestore.collection(collectionPath).doc(docId).update(data);
    } catch (e) {
      throw Exception('Error updating document: $e');
    }
  }
}
