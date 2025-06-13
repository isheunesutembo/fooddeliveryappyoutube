import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fooddeliveryappyoutube/fakedata/fakedata.dart';
import 'package:fooddeliveryappyoutube/features/categories/controller/category_controller.dart';
import 'package:fooddeliveryappyoutube/features/categories/widget/category_item_widget.dart';
import 'package:fooddeliveryappyoutube/features/menu/screens/menu_by_category_id_screen.dart';
import 'package:fooddeliveryappyoutube/utils/widgets/error_text.dart';
import 'package:fooddeliveryappyoutube/utils/widgets/loader.dart';

class CategoryWidget extends ConsumerWidget {
  const CategoryWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = ref.watch(getCategoriesProvider);
    return categories.when(
        data: (data) {
          return ListView.builder(
              itemCount: data.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MenuByCategoryIdScreen(
                                  categoryId:
                                      data[index].categoryId.toString())));
                    },
                    child: CategoryItemWidget(category: data[index]));
              });
        },
        error: (error, stackTrace) => ErrorText(error: error.toString()),
        loading: () => const Loader());
  }
}
