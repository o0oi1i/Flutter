import 'package:chopper/chopper.dart';
import 'recipe_model.dart';
import 'model_response.dart';
import 'model_converter.dart';
part 'recipe_service.chopper.dart';

const String apiKey = '98a6b5eaa8cb3ae08e13c268bccce2e3';
const String apiId = '10d700ad';
const String apiUrl = 'https://api.edamam.com';

// 1
@ChopperApi()
// 2
abstract class RecipeService extends ChopperService {
  // 3
  @Get(path: 'search')
  // 4
  Future<Response<Result<APIRecipeQuery>>>
      // 5
      queryRecipes(
    @Query('q') String query,
    @Query('from') int from,
    @Query('to') int to,
  );

  static RecipeService create() {
    // 1
    final client = ChopperClient(
      // 2
      baseUrl: apiUrl,
      // 3
      interceptors: [_addQuery, HttpLoggingInterceptor()],
      // 4
      converter: ModelConverter(),
      // 5
      errorConverter: JsonConverter(),
      // 6
      services: [
        _$RecipeService(),
      ],
    );
    // 7
    return _$RecipeService(client);
  }
}

Request _addQuery(Request req) {
  // 1
  final params = Map<String, dynamic>.from(req.parameters);
  // 2
  params['app_id'] = apiId;
  params['app_key'] = apiKey;
  // 3
  return req.copyWith(parameters: params);
}
