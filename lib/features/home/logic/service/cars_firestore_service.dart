import 'package:cloud_firestore/cloud_firestore.dart';

class CarFirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Stream<QuerySnapshot> getCarsStream({String? carType}) {
    Query query = _db.collection('cars');
    if (carType != null && carType != 'All Cars') {
      query = query.where('carName', isEqualTo: carType);
    }
    return query.snapshots();
  }
}