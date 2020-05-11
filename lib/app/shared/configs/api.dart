import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

class Api extends Disposable {
  final Dio dio;
  final String urlBase;

  Api(this.dio, this.urlBase) {
    final baseOptions = BaseOptions(
      baseUrl: urlBase,
    );

    this.dio.options = baseOptions;
  }

  @override
  void dispose() {}
}
