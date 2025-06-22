import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fooddeliveryappyoutube/features/auth/controller/auth_controller.dart';
import 'package:fooddeliveryappyoutube/features/menu/models/menu_model.dart';
import 'package:fooddeliveryappyoutube/firebase_options.dart';
import 'package:fooddeliveryappyoutube/router.dart';
import 'package:fooddeliveryappyoutube/utils/color.dart';
import 'package:fooddeliveryappyoutube/utils/widgets/error_text.dart';
import 'package:fooddeliveryappyoutube/utils/widgets/loader.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:routemaster/routemaster.dart';

import 'features/auth/model/user_model.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Hive.initFlutter();
  await Hive.openBox("menuFavourites");
  Hive.registerAdapter(MenuModelAdapter());
  runApp( const ProviderScope(child: MyApp()));
}
class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  UserModel? userModel;
  void getData(WidgetRef ref,
  User data)async{
    userModel=await ref.watch(authControllerProvider.notifier).getUserData(data.uid)
    .first;
    ref.read(userProvider.notifier).update((state)=>userModel);

  }
  @override
  Widget build(BuildContext context) {
    return ref.watch(authStateChangeProvider).when(data: (data)=>
    MaterialApp.router(
     
      color: AppColor.primaryColor,
      debugShowCheckedModeBanner: false,
      routerDelegate:RoutemasterDelegate(routesBuilder: (context){
        if(data!=null){
          getData(ref, data);
          return loggedInRoute;
        }
        return loggedOutRoute;
      }), 
     routeInformationParser: const RoutemasterParser(),
    ), error: (error,_)=>ErrorText(error: error.toString()), loading: ()=>const Loader());
  }
}