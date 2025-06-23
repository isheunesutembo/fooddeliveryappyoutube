


import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fooddeliveryappyoutube/features/promotion/model/promotion_model.dart';
import 'package:fooddeliveryappyoutube/features/promotion/repository/promotion_repository.dart';
final promotionsControllerProvider=AsyncNotifierProvider<PromotionController,AsyncValue<void>>(PromotionController.new);
final getPromotionsProvider=StreamProvider((ref)=>ref.watch(promotionsControllerProvider.notifier).getPromotions());

class PromotionController extends AsyncNotifier<AsyncValue<void>>{
late PromotionRepository _promotionRepository;
AsyncValue<void>  build(){
  _promotionRepository=ref.watch(promotionRepositoryProvider);
  return const AsyncData(null);
}

Stream<PromotionModel>getPromotions(){
  return _promotionRepository.getPromotions();
}
}