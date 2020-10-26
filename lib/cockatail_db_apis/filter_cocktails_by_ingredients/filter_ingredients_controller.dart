import 'package:MobileCocktailDatabase/cockatail_db_apis/filter_cocktails_by_ingredients/filter_ingredients_interface.dart';
import 'package:MobileCocktailDatabase/cockatail_db_apis/filter_cocktails_by_ingredients/filter_ingredients_service.dart';
import 'package:MobileCocktailDatabase/cockatail_db_apis/lookup_cocktails_by_id/lookup_cocktails_id_controller.dart';
import 'package:MobileCocktailDatabase/cockatail_db_apis/lookup_cocktails_by_id/lookup_cocktails_id_interface.dart';

// main is only here right now for debugging purposes,
// uncomment when testing backend service
// void main() {
//   FilterCocktailsByIngredientsController()
//       .filterIngredientsBloc(['tequila', 'salt', 'lemonade', 'vodka']);
// }

/// Business logic class for filtering cocktails by given ingredients
class FilterCocktailsByIngredientsController {
  /// A unique set of cocktails found by given ingredients
  Set<CocktailsByIngredient> cocktailIDs = {};

  /// The permutation of ingredients,
  /// where the most amount of ingredients is at the end
  List<String> ingredientPermutations = new List<String>();

  /// Business logic for filtered list of all cocktails
  /// based on given ingredients
  ///
  /// @params ingredients list of dropdown ingredients selected
  /// @returns Future<List<CocktailsByIDResponse>> List of cocktails
  Future<List<CocktailsByIDResponse>> filterIngredientsBloc(
      List<String> ingredients) async {
    for (int i = 0; i < ingredients.length; i++) {
      List<String> temp = [ingredients[i]];
      for (int j = i + 1; j < ingredients.length; j++) {
        temp.add(ingredients[j]);
        // Add the elements with the most amount of ingredients to the end HERE.
        this.ingredientPermutations.add(temp.join(','));
      }
    }
    await condenseCallsToFilterIngredients();
    List<CocktailsByIDResponse> cocktailInformation =
        await LookupCocktailInformationByIDsController()
            .lookupCocktailIDsBloc(cocktailIDs);
    return cocktailInformation;
  }

  /// Allows for minimal amount of calls to happen to the api
  ///
  /// @param maxListLength will later be adjusted to be used with pagination
  /// @returns Future void value, so the previous call can wait for this one
  Future condenseCallsToFilterIngredients({maxListLength = 10}) async {
    bool check = true;
    while (check &&
        this.ingredientPermutations != null &&
        this.ingredientPermutations.length > 0) {
      var cocktailResponse = await FilterCocktailsByIngredientsService()
          .filterIngredientsServicePost(
              this.ingredientPermutations.removeLast());
      if (cocktailResponse != null) {
        cocktailResponse.forEach((cocktail) => this.cocktailIDs.add(cocktail));
        if (cocktailResponse.length > maxListLength) {
          check = false;
        }
      }
    }
  }
}
