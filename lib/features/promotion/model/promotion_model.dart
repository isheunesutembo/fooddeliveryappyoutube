
import'package:freezed_annotation/freezed_annotation.dart';
part 'promotion_model.freezed.dart';
part 'promotion_model.g.dart';
@freezed
abstract class PromotionModel with _$PromotionModel {
  factory PromotionModel({
    List<String>?images
  })=_PromotionModel;
  factory PromotionModel.fromJson(Map<String, dynamic> json) => _$PromotionModelFromJson(json);
}