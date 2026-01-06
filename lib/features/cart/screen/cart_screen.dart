import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fooddeliveryappyoutube/features/auth/controller/auth_controller.dart';
import 'package:fooddeliveryappyoutube/features/auth/main/screen/main_screen.dart';
import 'package:fooddeliveryappyoutube/features/cart/model/cart_model.dart';
import 'package:fooddeliveryappyoutube/features/cart/widgets/cart_item_widget.dart';
import 'package:fooddeliveryappyoutube/utils/color.dart';
import 'package:fooddeliveryappyoutube/utils/widgets/error_text.dart';
import 'package:fooddeliveryappyoutube/utils/widgets/loader.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    final userProvider = ref.watch(getUserDataProvider(uid));

    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: userProvider.when(data: (data){

        return data.cart!.isNotEmpty||data.cart!=null?
        ListView(
          children: [
            Row(
              children: [
                GestureDetector(onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>MainScreen()));
                },
                  child: Container(decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle
                  ),child: Image.asset("assets/icons/backarrow.png",height: 50,width: 50,)),
                ),
                const SizedBox(width: 120,),
                const Text("Your Cart",style: TextStyle(fontSize: 20,
                fontWeight: FontWeight.bold),)
              ],
            ),
            Column(children:data.cart!.map((cartItem)=>CartItemWidget(cart: cartItem)).toList(),)
          ],
        ):Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(child: Text("Cart Is Empty"),),
            const SizedBox(height: 8,),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const MainScreen()));
              },
                child: const Center(child: Text("Back To Shopping",style: TextStyle(color: Colors.orange,
                fontWeight: FontWeight.bold,fontSize: 15),),),
              ),
          ],
        ),);

      }, error:(error,stackTrace)=>ErrorText(error: error.toString()), loading: ()=>const Loader()),
    );
  }
}
