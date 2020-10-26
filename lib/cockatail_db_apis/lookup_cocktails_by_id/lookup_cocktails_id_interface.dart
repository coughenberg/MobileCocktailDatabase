/// Each cockatil and its information
class CocktailsByIDResponse {
  String drinkName;
  String drinkId;
  String category;
  String glassType;
  String instructions;
  List<CocktailIngredientInfo> ingredients;
  // long image; // strDrinkThumb

  /// constructor
  CocktailsByIDResponse(
      {this.drinkName,
      this.drinkId,
      this.category,
      this.glassType,
      this.instructions,
      this.ingredients});

  /// Extrapolate data from json map to CocktailsByIDResponse Object
  CocktailsByIDResponse.fromJson(Map<String, dynamic> json) {
    print(json['drinks'][0]['strDrink']);
    this.drinkName = json['drinks'][0]['strDrink'].toString();
    this.drinkId = json['drinks'][0]['idDrink'].toString();
    this.category = json['drinks'][0]['strCategory'].toString();
    this.glassType = json['drinks'][0]['strGlass'].toString();
    this.instructions = json['drinks'][0]['strInstructions'].toString();
    this.ingredients = new List<CocktailIngredientInfo>();
    for (int index = 1;
        index <= 15 &&
            json['drinks'][0]['strIngredient$index'] != null &&
            json['drinks'][0]['strMeasure$index'] != null;
        index++) {
      this.ingredients.add(CocktailIngredientInfo.fromIngredientKey(
          json['drinks'][0]['strIngredient$index'],
          json['drinks'][0]['strMeasure$index']));
    }
  }
}

/// Each ingredient and its measurement
class CocktailIngredientInfo {
  String ingredientName;
  String ingredientMeasurement;

  /// Constructor
  CocktailIngredientInfo({this.ingredientName, this.ingredientMeasurement});

  /// Extrapolate data from ingredient keys to CocktailIngredientInfo object
  CocktailIngredientInfo.fromIngredientKey(
      String ingredientName, String ingredientMeasurement) {
    this.ingredientName = ingredientName;
    this.ingredientMeasurement = ingredientMeasurement;
  }
}
