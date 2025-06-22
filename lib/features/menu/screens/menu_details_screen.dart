import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fooddeliveryappyoutube/features/favourites/controller/favourite_controller.dart';
import 'package:fooddeliveryappyoutube/features/ingredients/models/ingredient_model.dart';
import 'package:fooddeliveryappyoutube/features/menu/models/menu_model.dart';
import 'package:fooddeliveryappyoutube/utils/color.dart';
import 'package:fooddeliveryappyoutube/utils/widgets/decorated_circle_icon.dart';

class MenuDetailsPage extends ConsumerStatefulWidget {
  const MenuDetailsPage({super.key});

  @override
  ConsumerState<MenuDetailsPage> createState() => _MenuDetailsPageState();
}

class _MenuDetailsPageState extends ConsumerState<MenuDetailsPage> {
  List<IngredientModel> selectedIngredients = [];
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    final menu = ModalRoute.of(context)!.settings.arguments as MenuModel;
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: SafeArea(
          child: SizedBox(
            height: height*1,
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
                    GestureDetector(onTap: (){
                      Navigator.pop(context);
                    },child: CircleIcon(image: Image.asset("assets/icons/backarrow.png"))),
                    GestureDetector(onTap: (){
                      ref.read(favouriteControllerProvider.notifier)
                      .addMenuToFavourite(menu, context);
                    },child: CircleIcon(image: Image.asset("assets/icons/favourite.png")))
                  ],
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(menu.image.toString(),
                    height: 224,width:double.infinity,
                    fit: BoxFit.fill,),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: height*0.7,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    )
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                       Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Text(menu.title.toString(),
                         style: const TextStyle(color: Colors.black,
                         fontSize: 15,
                         fontWeight: FontWeight.bold),),
                       ) ,
                       const SizedBox(height: 10),
                       Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Text(menu.description.toString(),
                         style: const TextStyle(color: Colors.black,
                         fontSize: 14,
                         fontWeight: FontWeight.w500),),
                       ) ,
                       const SizedBox(height: 10),
                       Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                           const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  "Quantity",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  menu.quantity.toString(),
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                        ],
                       ),
                       const SizedBox(height: 10),
                        Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                           const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  "Price",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "\$${menu.price.toString()}",
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                        ],
                       ),
                       if(menu.ingredients!=null)...{
                        const Text("Add extra additionals",
                        style: TextStyle(color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w800),),
                        Column(
                          children: menu.ingredients!.map((ingredient){
                            return CheckboxListTile(title: Text('${ingredient.name.toString()} \$${ingredient.price.toString()}',
                            style: const TextStyle(color: Colors.black,fontSize: 15,
                            fontWeight: FontWeight.bold),),
                            value: selectedIngredients.contains(ingredient),
                            activeColor: Colors.deepOrangeAccent,
                            onChanged: (isSelected){
                              setState(() {
                                if(isSelected!){
                                  selectedIngredients.add(ingredient);
                                }else{
                                  selectedIngredients.remove(ingredient);
                                }
                              });
                            },);
                          }).toList(),
                        )
                       },
                       Center(
                         child: SizedBox(
                          width: 357,
                          height: 62,
                           child: ElevatedButton(onPressed: (){
                           
                           },
                           style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)
                            )
                           ), child:  const Text("Add To cart",
                           style: TextStyle(color: Colors.white,
                           fontWeight: FontWeight.w600),),),
                         ),
                       )
            
            
                      ],
                    ),
                  ),
                ),
              )
            
            ],
                    ),
                  ),
          )),
    );
  }
}
