// En domain/repository.dart
abstract class Repository<T> {
  Future<void> create(T item);
  Future<List<T>> read();
  Future<void> update(T item);
  Future<void> delete(T item);
}
