/// Response of list of ingredients from api
class CocktailsByIngredientResponse {
  List<CocktailsByIngredient> cocktails;

  CocktailsByIngredientResponse({this.cocktails});

  CocktailsByIngredientResponse.fromJson(Map<String, dynamic> json) {
    if (json['drinks'] != null && json['drinks'] != "None Found") {
      cocktails = new List<CocktailsByIngredient>();
      json['drinks'].forEach((cocktail) {
        cocktails.add(new CocktailsByIngredient.fromJson(cocktail));
      });
    }
  }
}

/// Each ingredient object from api
class CocktailsByIngredient {
  String drinkName;
  String drinkId;

  CocktailsByIngredient({this.drinkName, this.drinkId});

  CocktailsByIngredient.fromJson(Map<String, dynamic> json) {
    drinkName = json['strDrink'].toString();
    drinkId = json['idDrink'].toString();
  }
}
