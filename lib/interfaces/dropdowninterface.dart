import 'package:MobileCocktailDatabase/cockatail_db_apis/get_list_of_ingredients/list_ingredients_interface.dart';

class Dropdown {
  String display;
  String value;

  Dropdown({
    this.display,
    this.value,
  });

  Dropdown.fromIngredientList(List<Ingredient> ingredients) {
   ingredients.forEach((ingredient) { 
    this.display = ingredient.ingredientName;
    this.value = ingredient.ingredientName;
   });
  }
}

// LEAVE THIS FOR NOW. WILL REVISIT THIS IF NEEDED
// class DropdownOptions {
//   List<Dropdown> dropdownoptions;

//   DropdownOptions({this.dropdownoptions});

//   DropdownOptions.fromIngredientList(IngredientResponse ingredientResponse) {
//      if (ingredientResponse != null) {
//       dropdownoptions = new List<Dropdown>();
//       ingredientResponse.ingredients.forEach((ingredient) {
//         dropdownoptions.add(new Dropdown.fromIngredientList(ingredientResponse.ingredients));
//       });
//     }
//   }
// }
// BELOW TIM EXAMPLE:
// class IngredientResponse {
//   List<Ingredient> ingredients;

//   IngredientResponse({this.ingredients});

//   IngredientResponse.fromJson(Map<String, dynamic> json) {
//     if (json['drinks'] != null) {
//       ingredients = new List<Ingredient>();
//       json['drinks'].forEach((ingredient) {
//         ingredients.add(new Ingredient.fromJson(ingredient));
//       });
//     }
//   }
// }

// /// Each ingredient object from api
// class Ingredient {
//   String ingredientName;

//   Ingredient({this.ingredientName});

//   Ingredient.fromJson(Map<String, dynamic> json) {
//     ingredientName = json['strIngredient1'].toString();
//   }
// }



