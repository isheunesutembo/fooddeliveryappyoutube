

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fooddeliveryappyoutube/features/cart/controller/cart_controller.dart';
import 'package:fooddeliveryappyoutube/features/cart/model/cart_model.dart';

class CartItemWidget extends ConsumerWidget {
    CartModel cart;
   CartItemWidget({super.key,required this.cart});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final cartController=ref.watch(cartControllerProvider.notifier);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
          children: [
              const SizedBox(height: 12,),
              Container(
                  width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
      
                  ),
                  child:Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                         Row(children: [
                           ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(cart.image.toString(),
                              width: 136,height: 87,fit: BoxFit.fill,),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                            Text(cart.title.toString(),
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight:FontWeight.w700
                            ),),
                            const SizedBox(height: 15,),
                            Text("\$${cart!.price.toString()}",
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight:FontWeight.w700
                            ),),
                            cart.ingredients!.isNotEmpty?
                            Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                            children: cart.ingredients!.map((ingredient){
                                return Text(ingredient.name.toString(),
                                style: const TextStyle(fontSize: 11,
                                fontWeight: FontWeight.w200,
                                color: Colors.black),);
                            }).toList(),):const SizedBox()
                            
                            
                                                ],),
                          )
                         ],),
                         Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                                Image.asset("assets/icons/delete.png",
                                height: 20,width: 20,),
                                const SizedBox(height: 20,),
                                Row(
                                  children: [
                                      GestureDetector(onTap: (){
                                          cartController.removeCartItem(cart, context);
                                      },child: Image.asset("assets/icons/removeicon.png")),
                                      const SizedBox(width: 3,),
                                      Text(cart.quantity.toString(),
                                      style: const TextStyle(fontSize: 15,fontWeight: FontWeight.w800),),
                                      const SizedBox(width: 3,),
                                       GestureDetector(onTap: (){
                                          cartController.increaseQuantity(cart);
                                       },child: Image.asset("assets/icons/addicon.png"))
                                  ],
                                )
                            ],
                           ),
                         )
                      ],
                  ) ,
              )
          ],
      ),
    );
  }
}