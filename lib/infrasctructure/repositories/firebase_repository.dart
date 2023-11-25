// En data/firebase_repository.dart

import '../../domain/repositories/repository.dart';

class FirebaseRepository<T> implements Repository<T> {
  @override
  Future<void> create(T item) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<void> delete(T item) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<List<T>> read() {
    // TODO: implement read
    throw UnimplementedError();
  }

  @override
  Future<void> update(T item) {
    // TODO: implement update
    throw UnimplementedError();
  }
  // Implementar métodos CRUD utilizando Firebase
  // ...
}
