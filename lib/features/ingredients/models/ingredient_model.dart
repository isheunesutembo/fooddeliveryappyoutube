

import'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'ingredient_model.freezed.dart';
part 'ingredient_model.g.dart';
 @freezed
@HiveType(typeId: 1)
abstract class IngredientModel with _$IngredientModel{
  @JsonSerializable(explicitToJson: true)
  factory IngredientModel({
   @HiveField(0) String? name,
  @HiveField(1)  double? price ,
   
  })=_IngredientModel;
  factory IngredientModel.fromJson(Map<String, dynamic> json) => _$IngredientModelFromJson(json);

}