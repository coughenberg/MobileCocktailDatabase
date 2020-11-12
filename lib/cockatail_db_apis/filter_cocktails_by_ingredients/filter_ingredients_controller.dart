import 'dart:math';
import 'package:powerset/powerset.dart';

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
    Iterable<List<String>> ingredientsPowerSet = powerset(ingredients);

    ingredientsPowerSet.forEach((ingredientCombination) {
      this.ingredientPermutations.add(ingredientCombination.join(','));
    });
    this.ingredientPermutations.removeLast();
    this
        .ingredientPermutations
        .sort((a, b) => getAmountOfCommas(b).compareTo(getAmountOfCommas(a)));
    print(this.ingredientPermutations);

    await condenseCallsToFilterIngredients();
    List<CocktailsByIDResponse> cocktailInformation =
        await LookupCocktailInformationByIDsController()
            .lookupCocktailIDsBloc(cocktailIDs);
    return cocktailInformation;
  }

  /// Finds the total amount of commas in a given ingredientString
  ///
  /// @param ingredientString - string of comma separated ingredients
  /// @returns total amount of commas found
  int getAmountOfCommas(String ingredientString) {
    int index = 0;
    int total = 0;
    while (index >= 0 && index < ingredientString.length - 1) {
      index = ingredientString.indexOf(',', index);
      if (index != -1) {
        total++;
        index = index + 1;
      }
    }
    return total;
  }

  /// Allows for minimal amount of calls to happen to the api
  ///
  /// @param maxListLength - A sorted list with the most ingredients first
  /// @returns Future - void value so the previous call can wait for this one
  Future condenseCallsToFilterIngredients({maxListLength = 10}) async {
    while (this.cocktailIDs.length <= maxListLength &&
        this.ingredientPermutations != null &&
        this.ingredientPermutations.length > 0) {
      List<CocktailsByIngredient> cocktailResponse =
          await FilterCocktailsByIngredientsService()
              .filterIngredientsServicePost(
                  this.ingredientPermutations.removeAt(0));
      if (cocktailResponse != null) {
        cocktailResponse.forEach((cocktail) => this.cocktailIDs.add(cocktail));
      }
    }
  }
}
