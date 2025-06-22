import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fooddeliveryappyoutube/fakedata/fakedata.dart';
import 'package:fooddeliveryappyoutube/features/favourites/controller/favourite_controller.dart';
import 'package:fooddeliveryappyoutube/features/menu/controller/menu_controller.dart';
import 'package:fooddeliveryappyoutube/features/menu/screens/menu_details_screen.dart';
import 'package:fooddeliveryappyoutube/features/menu/widgets/menu_item_widget.dart';
import 'package:fooddeliveryappyoutube/utils/widgets/loader.dart';

import '../../../utils/widgets/error_text.dart';

class AllMenuWidget extends ConsumerWidget {
  const AllMenuWidget({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final menu=ref.watch(getmenusProvider);
    return menu.when(data: (data){
      return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 2 / 3,crossAxisSpacing: 2),
        physics: const ClampingScrollPhysics(),
        itemCount: data.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return GestureDetector(onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>MenuDetailsPage(),settings: RouteSettings(arguments: data[index])));
          },child: Padding(
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
                   child: Image.network(data[index].image!,
                   fit: BoxFit.fill,
                   height: 100,
                   width: 166,),
                   
                 ),
               ),
               const SizedBox(height: 16,),
              
               Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 20),
                 child: Text("\$${data[index].price}",
                 style: const TextStyle(color: Colors.black,
                 fontSize: 12,
                 fontWeight: FontWeight.w600),),
               ),
               const SizedBox(height: 16,),
                 Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 20),
                 child: Text(data[index].quantity!,
                 style: const TextStyle(color: Colors.black,
                 fontSize: 12,
                 fontWeight: FontWeight.w600),),
               ),
            
              ],
            ),
            Positioned(
              top: 10,
              left: 5,
              child: GestureDetector(
                onTap: (){
              ref.read(favouriteControllerProvider.notifier)
             .addMenuToFavourite(data[index], context);
                },
                child: Image.asset("assets/icons/favourite.png",
                height: 20,width: 20,),
              ),
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
    ));
        });
    }, error: (error,stackTrace)=>ErrorText(error: error.toString()), loading: ()=>Loader());
  }
}
