// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CartModelImpl _$$CartModelImplFromJson(Map<String, dynamic> json) =>
    _$CartModelImpl(
      cartId: json['cartId'] as String,
      image: json['image'] as String?,
      menuId: json['menuId'] as String?,
      quantity: (json['quantity'] as num?)?.toInt(),
      title: json['title'] as String?,
      price: (json['price'] as num).toDouble(),
      ingredients: (json['ingredients'] as List<dynamic>?)
          ?.map((e) => IngredientModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CartModelImplToJson(_$CartModelImpl instance) =>
    <String, dynamic>{
      'cartId': instance.cartId,
      'image': instance.image,
      'menuId': instance.menuId,
      'quantity': instance.quantity,
      'title': instance.title,
      'price': instance.price,
      'ingredients': instance.ingredients?.map((e) => e.toJson()).toList(),
    };
