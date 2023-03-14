import 'package:partners/api/setup/api_provider.dart';
import 'package:partners/api/setup/endpoint.dart';

abstract class GetPartnesRoutesProtocol {
  void getPartnes({Success? success, Failure? failure});
}

class GetPartnesRoutes extends GetPartnesRoutesProtocol {
  final _provider = ApiProvider();

  @override
  void getPartnes({Success? success, Failure? failure}) {
    final endpoint = Endpoint(path: '/all.json', method: Method.get);

    _provider.request(endpoint: endpoint, success: success, failure: failure);
  }
}
