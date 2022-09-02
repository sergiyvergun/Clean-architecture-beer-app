import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../utils/constants/api_consts.dart';
import '../../models/beer_model.dart';

part 'beers_api_service.g.dart';

@RestApi(baseUrl: kBaseUrl)
abstract class BeersApiService {
  factory BeersApiService(Dio dio, {String baseUrl}) = _BeersApiService;

  @GET('/beers')
  Future<HttpResponse<List<BeerModel>>> fetchBeerList();
}