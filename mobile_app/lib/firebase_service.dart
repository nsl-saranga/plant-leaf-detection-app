import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot> getCollectionStream(String collectionName) {
    return _firestore.collection(collectionName).snapshots();
  }
}
