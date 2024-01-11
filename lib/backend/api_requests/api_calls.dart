import 'dart:convert';
import 'dart:typed_data';
import '../schema/structs/index.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start ChatBot Group Code

class ChatBotGroup {
  static String baseUrl = 'https://lapteller-be.onrender.com';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
  };
  static ChatBotCall chatBotCall = ChatBotCall();
  static ProductsCall productsCall = ProductsCall();
  static StoreCall storeCall = StoreCall();
  static NewsCall newsCall = NewsCall();
}

class ChatBotCall {
  Future<ApiCallResponse> call({
    String? prompt = '',
  }) async {
    final ffApiRequestBody = '''
{
  "question": "${prompt}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'ChatBot',
      apiUrl: '${ChatBotGroup.baseUrl}/ask',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  List? products(dynamic response) => getJsonField(
        response,
        r'''$.products''',
        true,
      ) as List?;
  String? answer(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.answer''',
      ));
}

class ProductsCall {
  Future<ApiCallResponse> call({
    String? productName = '',
  }) async {
    final ffApiRequestBody = '''
{
"productName": "${productName}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Products',
      apiUrl: '${ChatBotGroup.baseUrl}/getProductList',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class StoreCall {
  Future<ApiCallResponse> call({
    String? storeName = '',
  }) async {
    final ffApiRequestBody = '''
{
"storeName":"${storeName}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Store',
      apiUrl: '${ChatBotGroup.baseUrl}/getLocalStoreLocations',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class NewsCall {
  Future<ApiCallResponse> call({
    String? q = 'laptop',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'News',
      apiUrl: '${ChatBotGroup.baseUrl}/news?q=${q}',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

/// End ChatBot Group Code

class VideoCall {
  static Future<ApiCallResponse> call({
    String? keyword = 'laptop+review',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Video',
      apiUrl:
          'https://youtube.googleapis.com/youtube/v3/search?part=snippet&maxResults=50&q=\$${keyword}&regionCode=us&type=video&key=AIzaSyCVBYC-4YnlVNsJW1G9XmJMxnpnM83dGXw&fbclid=IwAR1ZGW3RMECseUC3yoUAfLobc-XxNfLgxUw1zaAyT0FAd-O5cv7WBVhBztc',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List? items(dynamic response) => getJsonField(
        response,
        r'''$.items''',
        true,
      ) as List?;
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
