import '../../index.dart';

class RepositoryImpl extends Repository {
  static Repository instance({required ApiService apiService}) {
    return RepositoryImpl(apiService);
  }

  RepositoryImpl(
      ApiService apiService,
      ) : _apiService = apiService;

  final ApiService _apiService;
}
