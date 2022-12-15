import 'package:algoriza/model/coffe_model.dart';

abstract class CoffeState {}

class CoffeInitialState extends CoffeState {}

class CoffeLoadingState extends CoffeState {}

class CoffeDataLoaded extends CoffeState  {
  List<CoffeResponse>? model;

  CoffeDataLoaded({this.model});
}

class CoffeError extends CoffeState {
  String? message;

  CoffeError({this.message});
}
