import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:MobileCocktailDatabase/cockatail_db_apis/base_cocktaildb_info.dart';
import 'package:MobileCocktailDatabase/cockatail_db_apis/apiKey.dart';

import 'lookup_cocktails_id_interface.dart';

/// class that calls out to filter cocktails by ingredient
class LookupCocktailInformationByIDsService {
  /// The call to get the list of ingredients
  ///
  /// @returns Future<List<Ingredient>> from the class list_ingredients_interface
  Future<CocktailsByIDResponse> lookupCocktailsByIDServicePost(
      String cocktailID) async {
    var url = '$BASE_URL/$VERSION/$API_KEY/lookup.php?i=$cocktailID';
    var responseString = await http.get(url);
    Map<String, dynamic> response = jsonDecode(responseString.body);
    return CocktailsByIDResponse.fromJson(response);
  }
}
