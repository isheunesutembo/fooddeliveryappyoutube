


import 'package:fooddeliveryappyoutube/features/ingredients/models/ingredient_model.dart';
import'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'menu_model.freezed.dart';
part 'menu_model.g.dart';
 @freezed
 @HiveType(typeId: 0)
abstract class MenuModel with _$MenuModel{
  factory MenuModel({
   @HiveField(0) String? image,
   @HiveField(1) String? title ,
    @HiveField(2)String? description,
    @HiveField(3) double? price,
    @HiveField(4) String? quantity,
    @HiveField(5) required String menuId,
    @HiveField(6) List<IngredientModel>?ingredients,
    @HiveField(7) String? categoryId,
  })=_MenuModel;
  factory MenuModel.fromJson(Map<String, dynamic> json) => _$MenuModelFromJson(json);

}