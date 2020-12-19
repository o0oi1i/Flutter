import 'package:http/http.dart';

const String apiId = '10d700ad';
const String apiKey = '98a6b5eaa8cb3ae08e13c268bccce2e3';
const String apiUrl = 'https://api.edamam.com/search';

// 1
Future getData(String url) async {
  // 2
  print('Calling url: $url');
  // 3
  Response response = await get(url);
  // 4
  if (response.statusCode == 200) {
    // 5
    return response.body;
  } else {
    // 6
    print(response.statusCode);
  }
}

class RecipeService {
  // 1
  Future<dynamic> getRecipes(String query, int from, int to) async {
    // 2
    var recipeData = await getData(
        '$apiUrl?app_id=$apiId&app_key=$apiKey&q=$query&from=$from&to=$to');
    // 3
    return recipeData;
  }
}
