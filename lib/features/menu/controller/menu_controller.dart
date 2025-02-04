

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fooddeliveryappyoutube/features/menu/models/menu_model.dart';
import 'package:fooddeliveryappyoutube/features/menu/repository/menurepository.dart';
final menuControllerprovider=AsyncNotifierProvider<MenuController,AsyncValue<void>>(MenuController.new);
final getmenusProvider=StreamProvider((ref)=>ref.watch(menuControllerprovider.notifier).getmenuItems());
class MenuController extends AsyncNotifier<AsyncValue<void>>{
  late MenuRepository _menuRepository;

  AsyncValue<void>build(){
    _menuRepository=ref.watch(menuRepositoryProvider);
    return const AsyncValue.data(null);

  }
  Stream<List<MenuModel>>getmenuItems(){
    return _menuRepository.getMenus();
  }

}