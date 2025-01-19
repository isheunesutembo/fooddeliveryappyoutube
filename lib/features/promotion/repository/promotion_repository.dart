import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fooddeliveryappyoutube/features/promotion/model/promotion_model.dart';
import 'package:fooddeliveryappyoutube/providers/firebase_providers.dart';
import 'package:fooddeliveryappyoutube/utils/firebaseconstants.dart';

final promotionRepositoryProvider = Provider((ref) => PromotionRepository(
    firebaseFirestore: ref.watch(firebaseFireStoreProvider)));

class PromotionRepository {
  final FirebaseFirestore _firebaseFirestore;
  PromotionRepository({
    required FirebaseFirestore firebaseFirestore,
  }) : _firebaseFirestore = firebaseFirestore;
  CollectionReference get _promotions =>
      _firebaseFirestore.collection(Firebaseconstants.promotionsCollection);
  Stream<List<PromotionModel>> getPromotions() {
    return _promotions.snapshots().map((event) {
      List<PromotionModel> promotions = [];
      for (var doc in event.docs) {
        promotions
            .add(PromotionModel.fromJson(doc.data() as Map<String, dynamic>));
      }
      return promotions;
    });
  }
}
