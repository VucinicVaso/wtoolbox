abstract class WTRepository<T> {

  // init collection
  Future<bool?> init(int? accountKey);

  // close collection
  Future<void> close();

  // check if collection is empty
  Future<bool?> isEmpty();

  Future<bool?> insert(T? entity);

  Future<bool?> update(T? entity);

  Future<bool?> delete(T? entity);

  Future<bool?> deleteAll();

  Future<T?> getByKey(int? key);

  Future<List<T>?> getAll();

}