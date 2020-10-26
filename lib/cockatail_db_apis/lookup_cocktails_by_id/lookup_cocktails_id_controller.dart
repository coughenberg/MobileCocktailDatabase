import 'package:MobileCocktailDatabase/cockatail_db_apis/filter_cocktails_by_ingredients/filter_ingredients_interface.dart';
import 'package:MobileCocktailDatabase/cockatail_db_apis/lookup_cocktails_by_id/lookup_cocktails_id_interface.dart';

import 'lookup_cocktails_id_service.dart';

// main is only here right now for debugging purposes, uncomment when testing backend service
// void main() {
//   Future<List<Ingredient>> ing =
//       IngredientListController().listIngredientsBloc();
//   ing.then((value) => value.forEach((element) {
//         print(element.ingredientName);
//       }));
// }

/// BLOC to looking up the cocktails by id Service
class LookupCocktailInformationByIDsController {
  Future<List<CocktailsByIDResponse>> lookupCocktailIDsBloc(
      Set<CocktailsByIngredient> cocktailIDs) async {
    List<CocktailsByIDResponse> cocktails = new List<CocktailsByIDResponse>();
    for (CocktailsByIngredient id in cocktailIDs) {
      cocktails.add(await LookupCocktailInformationByIDsService()
          .lookupCocktailsByIDServicePost(id.drinkId));
    }
    return cocktails;
  }
}
