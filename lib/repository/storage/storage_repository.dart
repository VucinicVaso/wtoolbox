import '../wtoobox_repository.dart';
import '../../entity/storage/storage.dart';

abstract class StorageRepository extends WTRepository<Storage> {

  // get storage file by reference
  Future<Storage> getByFileReference(String? fileReference);

}