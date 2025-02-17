


import 'package:fooddeliveryappyoutube/features/ingredients/models/ingredient_model.dart';
import'package:freezed_annotation/freezed_annotation.dart';
part 'menu_model.freezed.dart';
part 'menu_model.g.dart';
 @freezed
abstract class MenuModel with _$MenuModel{
  factory MenuModel({
    String? image,
    String? title ,
    String? description,
    double? price,
    String? quantity,
    required String menuId,
    List<IngredientModel>?ingredients,
    String? categoryId,
  })=_MenuModel;
  factory MenuModel.fromJson(Map<String, dynamic> json) => _$MenuModelFromJson(json);

}