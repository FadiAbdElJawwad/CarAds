import 'package:cloud_firestore/cloud_firestore.dart';

class ShowroomFirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Stream<QuerySnapshot> getShowroomsStream({String? showroomID}) {
    Query query = _db.collection('showrooms');
    if (showroomID != null) {
      query = query.where('showroomID', isEqualTo: showroomID);
    }
    return query.snapshots();
  }
}
