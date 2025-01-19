import 'package:flutter/material.dart';
import 'package:fooddeliveryappyoutube/features/categories/widget/category_widget.dart';
import 'package:fooddeliveryappyoutube/features/menu/widgets/all_menu_widget.dart';
import 'package:fooddeliveryappyoutube/features/promotion/widgets/promotions_widget.dart';
import 'package:fooddeliveryappyoutube/features/search/widgets/search_field_widget.dart';
import 'package:fooddeliveryappyoutube/utils/color.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.primaryColor,
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Order Your Favourite \n Fast Food!",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w700)),
                    Container(
                      height: 43,
                      width: 43,
                      decoration: const BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      child: Image.asset(
                        "assets/icons/notificationicon.png",
                        height: 21,
                        width: 21,
                      ),
                    )
                  ],
                ),
              ),
           const   Padding(
                padding:  EdgeInsets.all(8.0),
                child: SizedBox(height: 60,
                child: SearchField(),),
              ),
          const    Padding(
                padding:  EdgeInsets.all(8.0),
                child: PromotionsWidget(),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Categories",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight:FontWeight.bold
                    ),),
                    Text("See All",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 11,
                      fontWeight:FontWeight.w600
                    ),)
                  ],
                ),
              ),
            const  Padding(
                padding:  EdgeInsets.all(8.0),
                child:  SizedBox(
                  height: 120,
                  child: CategoryWidget(),
                ),
              ),
                const Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Your food",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight:FontWeight.bold
                    ),),
                    Text("See All",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 11,
                      fontWeight:FontWeight.w600
                    ),)
                  ],
                ),
              ),
         const     Padding(
                padding: const EdgeInsets.all(8.0),
                child: AllMenuWidget(),
              )
            ],
          ),
        )));
  }
}
