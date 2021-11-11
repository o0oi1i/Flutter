// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

class _$RecipeService extends RecipeService {
  _$RecipeService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  final definitionType = RecipeService;

  Future<Response<Result<APIRecipeQuery>>> queryRecipes(
      String query, int from, int to) {
    final $url = 'search';
    final Map<String, dynamic> $params = {'q': query, 'from': from, 'to': to};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<Result<APIRecipeQuery>, APIRecipeQuery>($request);
  }
}
