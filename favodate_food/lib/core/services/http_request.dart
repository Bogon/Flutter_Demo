import 'package:dio/dio.dart';
import 'config.dart';

class HttpRequest {

  static final BaseOptions baseOptions = BaseOptions(baseUrl: HttpConfig.baseURL, connectTimeout: HttpConfig.timeout);

  static final Dio dio = Dio(baseOptions);

  static Future<T> request<T>(String url, {
                      String method = "get",
                      Map<String, dynamic> params,
                      Interceptor interceptor}) async {
    // 1. 创建个性化设置
    final options = Options(method: method);

    // 全局拦截器
    // 创建默认的全局拦截器
    Interceptor intercp = InterceptorsWrapper(
      onRequest: (options) {
        print("请求拦截");
        return options;
      },
      onResponse: (response) {
        print("响应拦截");
        return response;
      },
      onError: (err) {
        print("异常拦截");
        return err;
      }
    );

    List<Interceptor> inters = [intercp];
    // 请求单独的拦截器
    if (interceptor != null) {
      inters.add(interceptor);
    }
    // 同一添加到拦截器中
    dio.interceptors.addAll(inters);

    // 2. 发送网络请求
    try {
      Response response = await dio.request(
          url, queryParameters: params, options: options);
      return response.data;
    } on DioError catch(e) {
      return Future.error(e);
    }
  }

}