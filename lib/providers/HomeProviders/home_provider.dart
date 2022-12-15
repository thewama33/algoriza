import 'package:algoriza/model/coffe_model.dart';
import 'package:algoriza/providers/HomeProviders/home_state.dart';
import 'package:algoriza/repos/CoffeRepo/coffe_repo.dart';
import 'package:algoriza/services/network/network_exceptions.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/debug_prints.dart';

class CoffeeProvider extends StateNotifier<CoffeState> {
  CoffeeProvider() : super(CoffeInitialState()) {
    getProducts();
  }

  CoffeRepo? repo = CoffeRepo();
  List<CoffeResponse>? itemModel;

  Future<List<CoffeResponse>?> getProducts() async {
    printDone("Getting Products");

    state = CoffeLoadingState();
    try {
      itemModel = await repo?.getProducts();
      if (itemModel != null) {
        printDone(itemModel!);
        state = CoffeDataLoaded(model: itemModel);
        return itemModel;
      }
    } on DioError catch (error) {
      state = CoffeError(message: error.message);
      printError(error.message);
    }

    return itemModel;
  }
}

final cofferProvider = StateNotifierProvider((ref) {
  return CoffeeProvider();
});
