import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:MobileCocktailDatabase/cockatail_db_apis/base_cocktaildb_info.dart';
import 'package:MobileCocktailDatabase/cockatail_db_apis/filter_cocktails_by_ingredients/filter_ingredients_interface.dart';
import 'package:MobileCocktailDatabase/cockatail_db_apis/apiKey.dart';

/// class that calls out to filter cocktails by ingredient
class FilterCocktailsByIngredientsService {
  ///The call to get the list of ingredients
  ///
  ///@returns Future<List<Ingredient>> from the class list_ingredients_interface
  Future<List<CocktailsByIngredient>> filterIngredientsServicePost(
      String ingredients) async {
    var url = '$BASE_URL/$VERSION/$API_KEY/filter.php?i=$ingredients';
    var responseString = await http.get(url);
    Map<String, dynamic> response = jsonDecode(responseString.body);
    return CocktailsByIngredientResponse.fromJson(response).cocktails;
  }
}
