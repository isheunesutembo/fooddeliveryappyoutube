

import'package:freezed_annotation/freezed_annotation.dart';
part 'ingredient_model.freezed.dart';
part 'ingredient_model.g.dart';
 @freezed
abstract class IngredientModel with _$IngredientModel{
  @JsonSerializable(explicitToJson: true)
  factory IngredientModel({
    String? name,
    double? price ,
   
  })=_IngredientModel;
  factory IngredientModel.fromJson(Map<String, dynamic> json) => _$IngredientModelFromJson(json);

}