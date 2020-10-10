import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:MobileCocktailDatabase/cockatail_db_apis/base_cocktaildb_info.dart';
import 'package:MobileCocktailDatabase/cockatail_db_apis/get_list_of_ingredients/list_ingredients_service.dart';
import 'package:MobileCocktailDatabase/cockatail_db_apis/get_list_of_ingredients/list_ingredients_interface.dart';
import 'package:MobileCocktailDatabase/cockatail_db_apis/apiKey.dart';

void main() {
  IngredientList().getIngredientsListCall();
}

class IngredientList {
  // main is only here right now for debugging purposes, uncomment when testing backend service
  void main() {
    getIngredientsListCall();
  }

  ///The call to get the list of ingredients
  ///
  ///@returns Future<List<Ingredient>> from the class list_ingredients_interface
  Future<List<Ingredient>> getIngredientsListCall() async {
    var url = '$BASE_URL/$VERSION/$API_KEY/list.php?i=list';
    var responseString = await http.get(url);
    Map<String, dynamic> response = jsonDecode(responseString.body);
    return IngredientResponse.fromJson(response).ingredients;
  }
}
