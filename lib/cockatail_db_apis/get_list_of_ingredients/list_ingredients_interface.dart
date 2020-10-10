/// Response of list of ingredients from api
class IngredientResponse {
  List<Ingredient> ingredients;

  IngredientResponse({this.ingredients});

  IngredientResponse.fromJson(Map<String, dynamic> json) {
    if (json['drinks'] != null) {
      ingredients = new List<Ingredient>();
      json['drinks'].forEach((ingredient) {
        ingredients.add(new Ingredient.fromJson(ingredient));
      });
    }
  }
}

/// Each ingredient object from api
class Ingredient {
  String ingredientName;

  Ingredient({this.ingredientName});

  Ingredient.fromJson(Map<String, dynamic> json) {
    ingredientName = json['strIngredient1'].toString();
  }
}
