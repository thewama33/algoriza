import 'package:algoriza/model/coffe_model.dart';

class Parser {
  static parse<T>(dynamic json) {
    switch (T) {
      case CoffeResponse:
        return CoffeResponse.fromJson(json);
    }
  }
}
