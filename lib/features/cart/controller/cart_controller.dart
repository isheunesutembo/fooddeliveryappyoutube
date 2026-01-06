import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fooddeliveryappyoutube/features/cart/model/cart_model.dart';
import 'package:fooddeliveryappyoutube/features/cart/repository/cart_repository.dart';
import 'package:fooddeliveryappyoutube/features/ingredients/models/ingredient_model.dart';
import 'package:fooddeliveryappyoutube/features/menu/models/menu_model.dart';
import 'package:fooddeliveryappyoutube/utils/util.dart';

final cartControllerProvider =
    AsyncNotifierProvider<CartController, AsyncValue<void>>(CartController.new);

class CartController extends AsyncNotifier<AsyncValue<void>> {
  late CartRepository _cartRepository;

  AsyncValue build() {
    _cartRepository = ref.watch(cartRepositoryProvider);

    return const AsyncValue.data(null);
  }

  void addMenuToCart(MenuModel menu, BuildContext context) {
    _cartRepository.addMenuToCart(menu, context).fold(
        (l) => showSnackBar(context, l.toString()),
        (r) => showSnackBar(context, "${menu.title} added to cart"));
  }

  void addMenuToCartWithIngredients(
      MenuModel menu, List<IngredientModel> ingredient, BuildContext context) {
    _cartRepository.addIngredientToCart(menu, ingredient, context).fold(
        (l) => showSnackBar(context, l.toString()),
        (r) => showSnackBar(context, "${menu.title} added to cart"));
  }

  void removeCartItem(CartModel cart, BuildContext context) {
    _cartRepository.removeMenuItem(cart).fold(
        (l) => showSnackBar(context, l.toString()),
        (r) => showSnackBar(context, "${cart.title}removed from cart"));
  }

  void decreaseQuantity(CartModel cart) {
    _cartRepository.decreaseQuantity(cart);
  }

  void increaseQuantity(CartModel cart) {
    _cartRepository.increaseQuality(cart);
  }

  Future<void> clearCart() async {
    return _cartRepository.clearCart();
  }
}
