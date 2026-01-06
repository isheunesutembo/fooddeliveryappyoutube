import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fooddeliveryappyoutube/features/menu/controller/menu_controller.dart';
import 'package:fooddeliveryappyoutube/features/menu/screens/menu_details_screen.dart';
import 'package:fooddeliveryappyoutube/features/menu/widgets/menu_item_widget.dart';
import 'package:fooddeliveryappyoutube/utils/color.dart';
import 'package:fooddeliveryappyoutube/utils/widgets/error_text.dart';
import 'package:fooddeliveryappyoutube/utils/widgets/loader.dart';

class MenuByCategoryIdScreen extends ConsumerWidget {
  String categoryId;
   MenuByCategoryIdScreen({super.key,required this.categoryId});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
     final menu=ref.watch(getMenuByIdProvider(categoryId));
    return menu.when(data: (data){
      return    data.isNotEmpty?  Scaffold(
        appBar: AppBar(
          actionsIconTheme: Theme.of(context).iconTheme,
          backgroundColor: AppColor.primaryColor,
        ),
        body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 2 / 3,crossAxisSpacing: 2),
          physics: const ClampingScrollPhysics(),
          itemCount: data.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return GestureDetector(onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const MenuDetailsPage(),settings: RouteSettings(arguments: data[index])));
            },child: MenuItemWidget(menuModel: data[index]));
          }),
      ):  Scaffold(appBar: AppBar(
          actionsIconTheme: Theme.of(context).iconTheme,
        ),body: const Center(child: Text("No menu items"),));
    }, error: (error,stackTrace)=>ErrorText(error: error.toString()), loading: ()=>const Loader());
  }
}