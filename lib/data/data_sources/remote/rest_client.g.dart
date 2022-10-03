// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rest_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _RestClient implements RestClient {
  _RestClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://api.themoviedb.org/3/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<Movie> getListMovie(apiKey, page) async {
    const extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'api_key': apiKey,
      r'page': page
    };
    final headers = <String, dynamic>{};
    final data = <String, dynamic>{};
    final result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<Movie>(
        Options(method: 'GET', headers: headers, extra: extra)
            .compose(_dio.options, 'movie/popular',
                queryParameters: queryParameters, data: data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Movie.fromJson(result.data!);
    return value;
  }

  @override
  Future<Movie> getListTopRated(apiKey, page) async {
    const extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'api_key': apiKey,
      r'page': page
    };
    final headers = <String, dynamic>{};
    final data = <String, dynamic>{};
    final result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<Movie>(
        Options(method: 'GET', headers: headers, extra: extra)
            .compose(_dio.options, 'movie/top_rated',
                queryParameters: queryParameters, data: data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Movie.fromJson(result.data!);
    return value;
  }

  @override
  Future<Movie> getListNowPlaying(apiKey, page) async {
    const extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'api_key': apiKey,
      r'page': page
    };
    final headers = <String, dynamic>{};
    final data = <String, dynamic>{};
    final result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<Movie>(
        Options(method: 'GET', headers: headers, extra: extra)
            .compose(_dio.options, 'movie/now_playing',
                queryParameters: queryParameters, data: data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Movie.fromJson(result.data!);
    return value;
  }

  @override
  Future<Movie> getListUpComing(apiKey, page) async {
    const extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'api_key': apiKey,
      r'page': page
    };
    final headers = <String, dynamic>{};
    final data = <String, dynamic>{};
    final result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<Movie>(
        Options(method: 'GET', headers: headers, extra: extra)
            .compose(_dio.options, 'movie/upcoming',
                queryParameters: queryParameters, data: data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Movie.fromJson(result.data!);
    return value;
  }

  @override
  Future<Movie> getListFavorite(apiKey, accountId, sessionId) async {
    const extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'api_key': apiKey,
      r'session_id': sessionId
    };
    final headers = <String, dynamic>{};
    final data = <String, dynamic>{};
    final result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<Movie>(
        Options(method: 'GET', headers: headers, extra: extra)
            .compose(_dio.options, 'account/${accountId}/favorite/movies',
                queryParameters: queryParameters, data: data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Movie.fromJson(result.data!);
    return value;
  }

  @override
  Future<MovieDetail> getMovieDetail(apiKey, movieId) async {
    const extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'api_key': apiKey};
    final headers = <String, dynamic>{};
    final data = <String, dynamic>{};
    final result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<MovieDetail>(
            Options(method: 'GET', headers: headers, extra: extra)
                .compose(_dio.options, 'movie/${movieId}',
                    queryParameters: queryParameters, data: data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = MovieDetail.fromJson(result.data!);
    return value;
  }

  @override
  Future<Movie> getListRecommendations(apiKey, movieId, int page) async {
    const extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'api_key': apiKey,
      r'page': page
    };
    final headers = <String, dynamic>{};
    final data = <String, dynamic>{};
    final result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<Movie>(
        Options(method: 'GET', headers: headers, extra: extra)
            .compose(_dio.options, 'movie/${movieId}/recommendations',
                queryParameters: queryParameters, data: data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Movie.fromJson(result.data!);
    return value;
  }

  @override
  Future<CreditCast> getCreditCast(apiKey, movieId) async {
    const extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'api_key': apiKey};
    final headers = <String, dynamic>{};
    final data = <String, dynamic>{};
    final result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CreditCast>(
            Options(method: 'GET', headers: headers, extra: extra)
                .compose(_dio.options, 'movie/${movieId}/credits',
                    queryParameters: queryParameters, data: data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CreditCast.fromJson(result.data!);
    return value;
  }

  @override
  Future<Reviews> getReviews(apiKey, movieId) async {
    const extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'api_key': apiKey};
    final headers = <String, dynamic>{};
    final data = <String, dynamic>{};
    final result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Reviews>(
            Options(method: 'GET', headers: headers, extra: extra)
                .compose(_dio.options, 'movie/${movieId}/reviews',
                    queryParameters: queryParameters, data: data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Reviews.fromJson(result.data!);
    return value;
  }

  @override
  Future<Movie> getSimilar(apiKey, movieId, int page) async {
    const extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'api_key': apiKey,
      r'page': page
    };
    final headers = <String, dynamic>{};
    final data = <String, dynamic>{};
    final result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<Movie>(
        Options(method: 'GET', headers: headers, extra: extra)
            .compose(_dio.options, 'movie/${movieId}/similar',
                queryParameters: queryParameters, data: data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Movie.fromJson(result.data!);
    return value;
  }

  @override
  Future<MovieImage> getMovieImage(apiKey, movieId) async {
    const extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'api_key': apiKey};
    final headers = <String, dynamic>{};
    final data = <String, dynamic>{};
    final result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<MovieImage>(
            Options(method: 'GET', headers: headers, extra: extra)
                .compose(_dio.options, 'movie/${movieId}/images',
                    queryParameters: queryParameters, data: data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = MovieImage.fromJson(result.data!);
    return value;
  }

  @override
  Future<CastDetail> getCastDetail(apiKey, personId) async {
    const extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'api_key': apiKey};
    final headers = <String, dynamic>{};
    final data = <String, dynamic>{};
    final result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CastDetail>(
            Options(method: 'GET', headers: headers, extra: extra)
                .compose(_dio.options, 'person/${personId}',
                    queryParameters: queryParameters, data: data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CastDetail.fromJson(result.data!);
    return value;
  }

  @override
  Future<CastImage> getCastImage(apiKey, castId) async {
    const extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'api_key': apiKey};
    final headers = <String, dynamic>{};
    final data = <String, dynamic>{};
    final result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CastImage>(
            Options(method: 'GET', headers: headers, extra: extra)
                .compose(_dio.options, 'person/${castId}/images',
                    queryParameters: queryParameters, data: data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CastImage.fromJson(result.data!);
    return value;
  }

  @override
  Future<CreditMovie> getCreditMovie(apiKey, castId) async {
    const extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'api_key': apiKey};
    final headers = <String, dynamic>{};
    final data = <String, dynamic>{};
    final result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CreditMovie>(
            Options(method: 'GET', headers: headers, extra: extra)
                .compose(_dio.options, 'person/${castId}/movie_credits',
                    queryParameters: queryParameters, data: data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CreditMovie.fromJson(result.data!);
    return value;
  }

  @override
  Future<Movie> getSearchMovie(apiKey, query) async {
    const extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'api_key': apiKey,
      r'query': query
    };
    final headers = <String, dynamic>{};
    final data = <String, dynamic>{};
    final result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<Movie>(
        Options(method: 'GET', headers: headers, extra: extra)
            .compose(_dio.options, 'search/movie',
                queryParameters: queryParameters, data: data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Movie.fromJson(result.data!);
    return value;
  }

  @override
  Future<MovieVideo> getVideo(apiKey, movieId) async {
    const extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'api_key': apiKey};
    final headers = <String, dynamic>{};
    final data = <String, dynamic>{};
    final result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<MovieVideo>(
            Options(method: 'GET', headers: headers, extra: extra)
                .compose(_dio.options, 'movie/${movieId}/videos',
                    queryParameters: queryParameters, data: data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = MovieVideo.fromJson(result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
