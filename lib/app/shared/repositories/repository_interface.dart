import 'package:flutter_modular/flutter_modular.dart';

abstract class IRepository<T> implements Disposable {
  Future<List<T>> getAll(String offset, String limit);

  Future<T> getById(dynamic key);

  Future<dynamic> save(T dto);

  Future update(dynamic key, T dto);

  Future delete(dynamic key);
}
