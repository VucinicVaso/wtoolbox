import '../wtoobox_repository.dart';
import '../../entity/account/account.dart';

abstract class AccountRepository extends WTRepository<Account> {

  Future<Account> getSelected();

}