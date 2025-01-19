import 'package:flutter/material.dart';
import 'package:fooddeliveryappyoutube/fakedata/fakedata.dart';
import 'package:fooddeliveryappyoutube/features/menu/widgets/menu_item_widget.dart';

class AllMenuWidget extends StatelessWidget {
  const AllMenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 2 / 3,crossAxisSpacing: 2),
        physics: const ClampingScrollPhysics(),
        itemCount: FakeData.menu.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return MenuItemWidget(menuModel: FakeData.menu[index]);
        });
  }
}
