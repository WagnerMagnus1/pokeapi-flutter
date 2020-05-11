import 'package:flutter_modular/flutter_modular.dart';

abstract class IService<T> implements Disposable {
  Future<List<T>> getAll(int offset, int limit);

  Future<T> saveOrUpdate(T dto);

  Future delete(dynamic key);

  Future<List<T>> sync(bool getOrPost);
}
