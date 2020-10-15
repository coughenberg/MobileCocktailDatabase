import 'package:MobileCocktailDatabase/cockatail_db_apis/get_list_of_ingredients/list_ingredients_interface.dart';
import 'package:MobileCocktailDatabase/cockatail_db_apis/get_list_of_ingredients/list_ingredients_service.dart';

// main is only here right now for debugging purposes, uncomment when testing backend service
// void main() {
//   Future<List<Ingredient>> ing =
//       IngredientListController().listIngredientsBloc();
//   ing.then((value) => value.forEach((element) {
//         print(element.ingredientName);
//       }));
// }

/// Filters
class IngredientListController {
  Future<List<Ingredient>> listIngredientsBloc() async {
    return IngredientListService().getIngredientsListCall();
  }
}
