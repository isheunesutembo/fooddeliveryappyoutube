import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fooddeliveryappyoutube/features/auth/main/screen/main_screen.dart';
import 'package:fooddeliveryappyoutube/features/favourites/controller/favourite_controller.dart';
import 'package:fooddeliveryappyoutube/utils/color.dart';
import 'package:fooddeliveryappyoutube/utils/widgets/error_text.dart';
import 'package:fooddeliveryappyoutube/utils/widgets/loader.dart';

class FavouriteScreen extends ConsumerWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favourite = ref.watch(favouriteControllerProvider);
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: favourite.when(
          data: (data) => SizedBox(
                height: MediaQuery.of(context).size.height,
                child: SafeArea(
                    child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const MainScreen()));
                            },
                            child: Container(
                              height: 43,
                              width: 43,
                              decoration: const BoxDecoration(
                                  color: Colors.white, shape: BoxShape.circle),
                              child: Image.asset(
                                "assets/icons/backarrow.png",
                                height: 50,
                                width: 50,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 120,
                          ),
                          const Text(
                            "Favourites",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.9,
                        child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: false,
                            itemCount: data.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  const SizedBox(height: 12,),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      width: double.infinity,
                                      height: 107,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(20)
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              ClipRRect(
                                                borderRadius: BorderRadius.circular(10),
                                                child: Image.network(
                                                  data[index].image.toString(),
                                                  width: 136,
                                                  height: 87,
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    const SizedBox(height: 20,),
                                                    Text(data[index].title.toString(),
                                                    style: const TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.w700
                                                    ),),
                                                    const SizedBox(height: 40,),
                                                    Expanded(child: Text(
                                                      "\$${data[index].price}",
                                                      style:  TextStyle(
                                                        color: Colors.grey[700],
                                                        fontSize: 12,
                                                        fontWeight: FontWeight.w500
                                                      )
                                                    ))
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: GestureDetector(
                                              onTap: (){
                                                ref.read(favouriteControllerProvider.notifier)
                                                .deleteMenuItem(index, context);
                                              },
                                              child: Image.asset("assets/icons/delete.png",
                                              height: 20,width: 20,),
                                            ),
                                          )

                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              );
                            }),
                      )
                    ],
                  ),
                )),
              ),
          error: (error, stackTrace) => ErrorText(error: error.toString()),
          loading: () => const Loader()),
    );
  }
}
