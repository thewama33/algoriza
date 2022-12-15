

import 'package:equatable/equatable.dart';

class CoffeResponse extends Equatable{
  String? title;
  String? description;
  List<String>? ingredients;
  String? image;
  int? id;

  CoffeResponse(
      {this.title, this.description, this.ingredients, this.image, this.id});

  CoffeResponse.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    ingredients = json['ingredients'].cast<String>();
    image = json['image'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['title'] = this.title;
    data['description'] = this.description;
    data['ingredients'] = this.ingredients;
    data['image'] = this.image;
    data['id'] = this.id;
    return data;
  }
  
  @override
  List<Object?> get props => [title,description,ingredients,image,id];
}