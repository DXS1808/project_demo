import 'package:dio/dio.dart';
import 'package:project_demo/data/data_sources/remote/rest_client.dart';

class RestClientDio{
  static RestClient restClient = RestClient(Dio(BaseOptions(contentType: "application/json")));
}