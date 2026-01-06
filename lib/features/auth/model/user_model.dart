import 'package:fooddeliveryappyoutube/features/cart/model/cart_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part'user_model.freezed.dart';
part'user_model.g.dart';

@freezed
abstract class UserModel with _$UserModel{
  factory UserModel({
    required String uid,
    String? username,
    String? profileImage,
    List<CartModel>?cart

  })=_UserModel;
  factory UserModel.fromJson(Map<String,dynamic>json)=>
  _$UserModelFromJson(json);
}