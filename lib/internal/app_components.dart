import 'package:dio/dio.dart';
import 'package:dron_delivery_app/data/interseptor.dart';
import 'package:dron_delivery_app/data/repository/token_ropository.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

const timeout = Duration(seconds: 30);

class AppComponents {
  static final AppComponents _instance = AppComponents._internal();

  factory AppComponents() => _instance;

  AppComponents._internal();

  final tokenDaData = '6cbb9f2ecf9886a6f52e1bfb7c78ef3e8e05a9ed';
  final Dio dio = Dio();
  final TokenRepository tokenRepository = TokenRepository();

  Future<void> init() async {
    dio.options
      ..baseUrl = 'https://farm.fbtw.ru/'
      ..connectTimeout = timeout
      ..receiveTimeout = timeout
      ..sendTimeout = timeout;
    dio.interceptors.add(PrettyDioLogger());

    await tokenRepository.initTokens();
    dio.interceptors.add(
      JWTInterceptor(
        repository: tokenRepository,
        dio: dio,
      ),
    );
  }
}
