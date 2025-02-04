import 'package:flutter/material.dart';
import 'package:fooddeliveryappyoutube/features/menu/models/menu_model.dart';

class MenuItemWidget extends StatelessWidget {
  MenuModel menuModel;
   MenuItemWidget({super.key,required this.menuModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 150,
        width: 150,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20)
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 60,),
               Center(
                 child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                   child: Image.network(menuModel.image!,
                   fit: BoxFit.fill,
                   height: 100,
                   width: 166,),
                   
                 ),
               ),
               const SizedBox(height: 16,),
              
               Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 20),
                 child: Text("\$${menuModel.price}",
                 style: const TextStyle(color: Colors.black,
                 fontSize: 12,
                 fontWeight: FontWeight.w600),),
               ),
               const SizedBox(height: 16,),
                 Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 20),
                 child: Text(menuModel.quantity!,
                 style: const TextStyle(color: Colors.black,
                 fontSize: 12,
                 fontWeight: FontWeight.w600),),
               ),
            
              ],
            ),
            Positioned(
              top: 10,
              left: 5,
              child: Image.asset("assets/icons/favourite.png",
              height: 20,width: 20,),
            ),
             Positioned(
              top: 10,
              right: 5,
              child: Image.asset("assets/icons/shopping-bag.png",
              height: 20,width: 20,),
            )
          ],
        ),
      ),
    );
  }
}