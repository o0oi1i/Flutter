import 'package:chopper/chopper.dart';

import 'dart:convert';

import 'model_response.dart';

import 'recipe_model.dart';

class ModelConverter implements Converter {
  @override
  Request convertRequest(Request request) {
    final req = applyHeader(
      request,
      contentTypeKey,
      jsonHeaders,
      override: false,
    );

    return encodeJson(req);
  }

  Request encodeJson(Request request) {
    final contentType = request.headers[contentTypeKey];
    if (contentType != null && contentType.contains(jsonHeaders)) {
      return request.copyWith(
        body: json.encode(request.body),
      );
    }
    return request;
  }

  @override
  Response<BodyType> convertResponse<BodyType, InnerType>(Response response) {
    return decodeJson<BodyType, InnerType>(response);
  }

  Response<BodyType> decodeJson<BodyType, InnerType>(Response response) {
    var body = response.body;

    final contentType = response.headers[contentTypeKey];
    if (contentType != null && contentType.contains(jsonHeaders)) {
      body = utf8.decode(response.bodyBytes);
    }

    try {
      final mapData = json.decode(body);
      if (mapData['status'] != null) {
        return response.copyWith<BodyType>(
          body: Error(Exception(mapData['status'])) as BodyType,
        );
      }
      final recipeQuery = APIRecipeQuery.fromJson(mapData);
      return response.copyWith<BodyType>(
        body: Success(recipeQuery) as BodyType,
      );
    } catch (e) {
      chopperLogger.warning(e);
      return response.copyWith<BodyType>(
        body: Error(e as Exception) as BodyType,
      );
    }
  }
}
