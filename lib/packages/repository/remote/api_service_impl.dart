import '../../index.dart';

class ApiServiceImpl extends ApiService {
  static ApiService instance(DioService dioService, DioService downloadService,
      DioService commonService) {
    return ApiServiceImpl(dioService, downloadService, commonService);
  }

  ApiServiceImpl(DioService dioService, DioService downloadService,
      DioService commonService)
      : _dioService = dioService,
        _downloadService = downloadService,
        _commonService = commonService;

  final DioService _dioService;
  final DioService _downloadService;
  final DioService _commonService;
}
