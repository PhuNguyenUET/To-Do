import '../../index.dart';

abstract class Repository {
  static Local get local => Local.instance;

  static NetworkSrc createNetworkSrc({required Local local}) {
    return NetworkSrc.instance();
  }

  static Future<Repository> createRepository({
    required AppEvent appEvent,
    required Local local,
  }) async {
    NetworkSrc networkSrc = createNetworkSrc(local: local);

    final apiService = ApiServiceImpl.instance(networkSrc.dioService,
        networkSrc.downloadDioService, networkSrc.commonDioService);

    return RepositoryImpl.instance(apiService: apiService);
  }
}
