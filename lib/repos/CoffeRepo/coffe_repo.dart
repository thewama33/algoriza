import 'package:algoriza/model/coffe_model.dart';
import 'package:algoriza/repos/base/base_repo.dart';

import '../../core/end_points.dart';

class CoffeRepo extends BaseRepo {
  Future<List<CoffeResponse>?> getProducts() {
    return networkManager.getList<CoffeResponse>(Endpoints.kGet_COFFE);
  }
}
