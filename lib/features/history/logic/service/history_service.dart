import 'package:cloud_firestore/cloud_firestore.dart';
import '../../model/history_order.dart';

class HistoryService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<HistoryOrder>> getOrderHistory(String userId) {
    return _firestore
        .collection('checkout')
        .where('userId', isEqualTo: userId)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
          .map((doc) => HistoryOrder.fromFirestore(doc))
          .toList();
    });
  }

  Future<void> clearHistory(String userId) async {
    final snapshot = await _firestore
        .collection('checkout')
        .where('userId', isEqualTo: userId)
        .get();
    for (final doc in snapshot.docs) {
      await doc.reference.delete();
    }
  }
}
