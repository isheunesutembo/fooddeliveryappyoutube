import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fooddeliveryappyoutube/core/failure.dart';
import 'package:fooddeliveryappyoutube/features/cart/model/cart_model.dart';
import 'package:fooddeliveryappyoutube/features/ingredients/models/ingredient_model.dart';
import 'package:fooddeliveryappyoutube/features/menu/models/menu_model.dart';
import 'package:fooddeliveryappyoutube/providers/firebase_providers.dart';
import 'package:fooddeliveryappyoutube/utils/firebaseconstants.dart';
import 'package:fpdart/fpdart.dart';
import 'package:uuid/uuid.dart';
final cartRepositoryProvider=Provider((ref)=>CartRepository(fireStore: ref.watch(firebaseFireStoreProvider), firebaseAuth: ref.watch(firebaseAuthProvider)));
class CartRepository {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _firebaseAuth;

  CartRepository(
      {required FirebaseFirestore fireStore,
      required FirebaseAuth firebaseAuth})
      : _firestore = fireStore,
        _firebaseAuth = firebaseAuth;

  Either<dynamic, Future<void>> addMenuToCart(
      MenuModel menu, BuildContext context) {
    String cartId = const Uuid().v1();

    try {
      return right(Firebaseconstants.cartRef.set({
        "cart": FieldValue.arrayUnion([
          CartModel(
              cartId: cartId,
              image: menu.image,
              menuId: menu.menuId,
              quantity: 1,
              price: menu.price!.toDouble(),
              title: menu.title,
              ingredients: []).toJson()
        ])
      }, SetOptions(merge: true)));
    } on FirebaseException catch (e) {
      throw e.message!;
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
  Either <dynamic,Future<void>>removeMenuItem(CartModel cart){
    try{
      return right(Firebaseconstants.cartRef.update({
        "cart":FieldValue.arrayRemove([cart.toJson()])
      }));
    }catch(e){
      return Left(throw Exception(e));
    }
  }

  void decreaseQuantity(CartModel cart){
    if(cart.quantity==1){
      removeMenuItem(cart);
    }else{
      cart=cart.copyWith(quantity: cart.quantity!-1);
      Firebaseconstants.cartRef.update({
        "cart":FieldValue.arrayUnion([cart.toJson()])
      });
    }
  }

  Future<void>clearCart()async{
    Firebaseconstants.cartRef.update({"cart":FieldValue.delete()});
  }

  void increaseQuality(CartModel cart){
    removeMenuItem(cart);
    cart=cart.copyWith(quantity:cart.quantity!+1);
    Firebaseconstants.cartRef.update({
      "cart":FieldValue.arrayUnion(([cart.toJson()]))
    });
  }

   Either<dynamic, Future<void>> addIngredientToCart(
      MenuModel menu,List<IngredientModel>ingredient ,BuildContext context) {
    String cartId = const Uuid().v1();

    try {
      return right(Firebaseconstants.cartRef.set({
        "cart": FieldValue.arrayUnion([
          CartModel(
              cartId: cartId,
              image: menu.image,
              menuId: menu.menuId,
              quantity: 1,
              price: menu.price!.toDouble(),
              title: menu.title,
              ingredients: ingredient.toList()).toJson()
        ])
      }, SetOptions(merge: true)));
    } on FirebaseException catch (e) {
      throw e.message!;
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
