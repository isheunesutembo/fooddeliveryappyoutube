import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fooddeliveryappyoutube/fakedata/fakedata.dart';
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
          },child: MenuItemWidget(menuModel: data[index]));
        });
    }, error: (error,stackTrace)=>ErrorText(error: error.toString()), loading: ()=>Loader());
  }
}
