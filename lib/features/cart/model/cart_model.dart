import 'package:fooddeliveryappyoutube/features/ingredients/models/ingredient_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'cart_model.freezed.dart';
part 'cart_model.g.dart';

@freezed

abstract class CartModel with _$CartModel {
  @JsonSerializable(explicitToJson: true)
  factory CartModel({
  required String cartId,
    String? image,
    String? menuId,
     int? quantity,
    String? title,
    required double price,
    List<IngredientModel>? ingredients,
    
  }) = _CartModel;
  factory CartModel.fromJson(Map<String, dynamic> json) =>
      _$CartModelFromJson(json);
}

extension CartExt on CartModel{
  double get ingredientsGrandTotal{
    return ingredients!.map((e)=>(e.price)).fold(0, (p,c)=>p+c!);
  }
}

extension CartItemExt on CartModel{
  double get cartItemGrandTotal{
    return ingredients!.map((e)=>(e.price!+price)).fold(0, (p,c)=>p+c);
  }
}
