import 'package:dadata_suggestions/dadata_suggestions.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:satellite_app/data/interseptor.dart';
import 'package:satellite_app/data/repository/auth_repository.dart';
import 'package:satellite_app/data/repository/dadata_repository.dart';
import 'package:satellite_app/data/repository/satellite_repository.dart';
import 'package:satellite_app/data/repository/token_ropository.dart';
import 'package:satellite_app/data/service/auth_service.dart';
import 'package:satellite_app/data/service/banner_service.dart';
import 'package:satellite_app/data/service/geozones_service.dart';
import 'package:satellite_app/data/service/order_service.dart';
import 'package:satellite_app/data/service/satellite_service.dart';
import 'package:satellite_app/domain/use_case/profile_use_case.dart';
import 'package:satellite_app/router/app_router.dart';

const timeout = Duration(seconds: 30);

class AppComponents {
  static final AppComponents _instance = AppComponents._internal();

  factory AppComponents() => _instance;

  AppComponents._internal();

  final tokenDaData = '6cbb9f2ecf9886a6f52e1bfb7c78ef3e8e05a9ed';
  final Dio dio = Dio();

  late final AuthService authService = AuthService(dio);
  late final BannerService bannerService = BannerService(dio);
  late final SatelliteService satelliteService = SatelliteService(dio);
  late final GeozonesService geozonesService = GeozonesService(dio);

  final TokenRepository tokenRepository = TokenRepository();

  late final GeolocationDadataRepository dadataRepository =
      GeolocationDadataRepository(
    DadataSuggestions(tokenDaData),
  );

  late final ProfileUseCase profileUseCase =
      ProfileUseCase(tokenRepository, AuthRepository(authService));
  late final SatelliteRepository satelliteRepository =
      SatelliteRepository(satelliteService);
  late final OrderService orderService = OrderService(dio);

  Future<void> init() async {
    dio.options
      ..baseUrl = 'https://it-profession.fbtw.ru/'
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
