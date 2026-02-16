import 'package:cloud_firestore/cloud_firestore.dart';

class CarFirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Stream<QuerySnapshot> getCarsStream({
    String? carType,
    String? showroomID,
    List<String>? carIDs,
  }) {
    Query query = _db.collection('cars');

    if (carIDs != null && carIDs.isNotEmpty) {
      final idsToQuery = carIDs.length > 10 ? carIDs.sublist(0, 10) : carIDs;
      query = query.where('carID', whereIn: idsToQuery);
    }
    else if (showroomID != null && showroomID.isNotEmpty) {
      query = query.where('showroomID', isEqualTo: showroomID);
    }

    if (carType != null && carType != 'All Cars') {
      query = query.where('carName', isEqualTo: carType);
    }

    return query.snapshots();
  }

  Future<DocumentSnapshot> getCar(String carId) {
    return _db.collection('cars').doc(carId).get();
  }
}
