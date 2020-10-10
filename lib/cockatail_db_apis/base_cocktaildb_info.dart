import 'dart:io' show Platform;

// base request information for cocktail db
final String BASE_URL = 'https://www.thecocktaildb.com/api/json';
final String VERSION = 'v2';
final String API_KEY = Platform.environment['DB_API_KEY'];
